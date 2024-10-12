
using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using System.Windows;
using Sanjel.PrintingService.JDT;
using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Layouts
{
    public class GridColumnControl : Frame
    {
        public GridColumnControl(string id)
            : base(id)
        {
        }

        public Render BuildRenderObject(GridRender parentGrid)
        {
            Render render = new Render(Id, Styles, Styles.OriginX + parentGrid.OriginX,
                                           parentGrid.OriginY, Width, parentGrid.Height);
            return render;
        }
    }

    public class GridControl : Control
    {
        #region Instance Variables

        protected DataTable DataTable;
        protected readonly StyleModel StyleModel = new StyleModel();

        protected double PositionY;
        protected GridRender GridRender;
        protected GridRender EstimateTable;
        protected Frame GroupFrame;
        protected Dictionary<Render, SanjelPdfBookmark> Bookmarks;

        #endregion Instance Variables

        #region Instance Properties

        public Dictionary<string, GridRowControl> Rows { get; set; }
        public List<GridColumnControl> Columns { get; set; }

        public string DataTableName { get; set; }
        public string ColumnTemplate { get; set; }

        #endregion Instance Properties

        #region Constructor

        public GridControl(string id)
        {
            Id = id;

            Rows = new Dictionary<string, GridRowControl>();
            Columns = new List<GridColumnControl>();
        }

        #endregion Constructor

        #region Public Methods

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            SetupWidth();

            PositionY = 0;
            if (Model == null)
            {
                object table = device.Section.GetPropertyValue(DataTableName);
                if (table != null && table is DataTable)
                {
                    DataTable dataTable = table as DataTable;
                    if (string.IsNullOrEmpty(ColumnTemplate) ||
                        string.Compare(ColumnTemplate, dataTable.TableName, StringComparison.OrdinalIgnoreCase) == 0)
                    {
                        Model = new DataModel(table);
                        DataTable = (DataTable)(Model.DataSet);
                    }
                }
            }

            if (Model != null && DataTable != null)
            {
                GroupFrame = groupFrame;
                DrawDataGrid(device, renderArea);
            }
        }

        public void SetupWidth()
        {
            double width = Width;
            Styles.Width = LayoutUtilities.LimitChildValue(width, Styles.Width);

            // get information of column widths
            List<int> autoColumns = new List<int>();
            double totalColumnWidth = 0;
            for (int index = 0; index < Columns.Count; index++)
            {
                Columns[index].InitializeRect();
                if (Columns[index].Width <= double.Epsilon)
                {
                    autoColumns.Add(index);
                }
                else
                {
                    totalColumnWidth += Columns[index].Width;
                }
            }

            if ((totalColumnWidth - Styles.Width) > 1)
            {
                throw new Exception("Total Width of columns in the table " + Id + " is too big.");
            }

            if (autoColumns.Count > 0)
            {
                double average = (Styles.Width - totalColumnWidth) / (autoColumns.Count);
                foreach (int index in autoColumns)
                {
                    Columns[index].Width = average;
                }
            }

            Styles.Width = Columns.Sum(column => column.Width);

            // setup left position column
            double left = 0;
            foreach (GridColumnControl columnTemplate in Columns)
            {
                columnTemplate.Styles.OriginX = left;
                left += columnTemplate.Width;
            }

            // setup left position, and width of cell
            foreach (var pair in Rows)
            {
                foreach (GridCellControl cell in pair.Value.Cells)
                {
                    double cellLeft = 0, cellWidth = 0;
                    for (int index = 0; index < Columns.Count; index++)
                    {
                        if (index < cell.StartColumn)
                            cellLeft += Columns[index].Width;
                        if (index <= cell.EndColumn && index >= cell.StartColumn)
                            cellWidth += Columns[index].Width;
                    }
                    cell.OriginX = cellLeft;
                    cell.Width = cellWidth;
                }
            }
        }

        public override void ReInitialize()
        {
            Model = null;
            base.ReInitialize();
        }

        #endregion Public Methods

        #region Protected Methods

        protected GridRowControl GetRowControl(string templateName)
        {
            return (Rows.ContainsKey(templateName)) ? Rows[templateName] : null;
        }

        protected void CreateCaptionRow(PdfDevice pdfDevice, EnumRenderArea renderArea)
        {
            GridRowControl rowControl = GetRowControl(PriceBookDefinition.CaptionTemplate);
            if (rowControl != null)
            {
                RowRender printingRow = CreatePrintingRow(pdfDevice, GridRender, null, rowControl);
                EstimateRow(pdfDevice, printingRow, renderArea);
                GridRender.Rows.Add(printingRow);
                GridRender.Height += printingRow.Height;
            }
        }

        protected bool EstimateRow(PdfDevice pdfDevice, RowRender printingRow, EnumRenderArea renderArea)
        {
            printingRow.Height = printingRow.ComputeRenderHeight(pdfDevice.CurrentPage);
            Rect rectClient = pdfDevice.CurrentPage.GetAvailablePlotRect(OriginX, Width, renderArea);
            double available = rectClient.Height - GridRender.Height - EstimateTable.Height;
            if (printingRow.Height > available)
            {
                return false;
            }

            PositionY += printingRow.Height;
            return true;
        }

        protected void AddRowToEstimateTable(RowRender rowRender, DataRow dataRow)
        {
            EstimateTable.Rows.Add(rowRender);
            EstimateTable.Height += rowRender.Height;
            AfterAddRowToEstimateTable(rowRender, dataRow);
        }

        protected void FlushEstimateTable(PdfDevice pdfDevice)
        {
            foreach (RowRender row in EstimateTable.Rows)
            {
                double bottom = GridRender.OriginY + GridRender.Height;
                foreach (Render cell in row.Children)
                {
                    cell.OriginY = bottom;
                }
                row.OriginX = GridRender.OriginX;
                row.OriginY = bottom;

                AddRowToRenderTable(row, pdfDevice);
            }
            EstimateTable.Rows.Clear();
            EstimateTable.SetObjectRect(OriginX, PositionY, Width, 0);
        }

        protected void ForceFlushEstimateTable(PdfDevice pdfDevice)
        {
            FlushEstimateTable(pdfDevice);
            AfterForceFlushEstimateTable(pdfDevice);
        }

        protected void DrawPrintingTable(PdfDevice pdfDevice, EnumRenderArea renderArea)
        {
            BeforeDrawPrintingTable(pdfDevice, renderArea);
            PositionY = 0;

            FinalizeTable(GridRender);

            pdfDevice.CurrentPage.AddRenderObject(GridRender, renderArea);
            GridRender = new GridRender(Id, StyleModel, OriginX, OriginY + PositionY, Width, 0);
        }

        protected void CreateNewPage(PdfDevice pdfDevice, EnumRenderArea renderArea)
        {
            pdfDevice.AddNewPage();

            if (GroupFrame != null && GroupFrame is ControlGroup)
            {
                GroupFrame.OriginY = pdfDevice.CurrentPage.GetClientRect(renderArea).Top;
                ((ControlGroup)GroupFrame).DrawHeader(pdfDevice, renderArea);
            }

            Rect rectClient = pdfDevice.CurrentPage.GetAvailablePlotRect(OriginX, Width, renderArea);
            OriginY = rectClient.Top;
            GridRender.OriginY = rectClient.Top;
            PositionY = 0;
            CreateCaptionRow(pdfDevice, renderArea);
        }

        protected void AddRowToRenderTable(RowRender rowRender, PdfDevice pdfDevice)
        {
            GridRender.Rows.Add(rowRender);
            GridRender.Height += rowRender.Height;
            AfterAddRowToRenderTable(rowRender, pdfDevice);
        }

        public void FinalizeTable(GridRender gridRender)
        {
            foreach (GridColumnControl columnTemplate in Columns)
            {
                Render render = columnTemplate.BuildRenderObject(gridRender);
                gridRender.Columns.Insert(0, render);
            }
        }

        #endregion Protected Methods

        #region Virtual Methods

        protected virtual RowRender CreatePrintingRow(PdfDevice pdfDevice, GridRender gridRender, DataRow dataRow, GridRowControl rowControl)
        {
            return rowControl.BuildRenderObject(pdfDevice, gridRender, dataRow);
        }

        protected virtual void AfterAddRowToEstimateTable(RowRender rowRender, DataRow dataRow)
        {
        }

        protected virtual void AfterAddRowToRenderTable(RowRender rowRender, PdfDevice pdfDevice)
        {
        }

        protected virtual bool IsReadyForFlush(DataRow row)
        {
            return false;
        }

        protected virtual void AfterForceFlushEstimateTable(PdfDevice pdfDevice)
        {
        }

        protected virtual void BeforeDrawPrintingTable(PdfDevice pdfDevice, EnumRenderArea renderArea)
        {
            Rect rectClient = pdfDevice.CurrentPage.GetAvailablePlotRect(OriginX, Width, renderArea);
            double available = rectClient.Height - GridRender.Height - EstimateTable.Height;
            if (available > -1 && EstimateTable.Rows.Count > 0 && GridRender.Rows.Count < 2)
            {
                ForceFlushEstimateTable(pdfDevice);
            }
        }

        protected virtual void DrawDataGrid(PdfDevice pdfDevice, EnumRenderArea renderArea)
        {
            GridRender = new GridRender(Id, StyleModel, OriginX, OriginY + PositionY, Width, 0);
            EstimateTable = new GridRender(Id, StyleModel, OriginX, OriginY + PositionY, Width, 0);
            Bookmarks = new Dictionary<Render, SanjelPdfBookmark>();

            CreateCaptionRow(pdfDevice, renderArea);

            // draw data table row by row
            for (int rowIndex = 0; rowIndex < DataTable.Rows.Count; rowIndex++)
            {
                GridRowControl rowControl = GetRowControl((string) (DataTable.Rows[rowIndex][0]));
                if (rowControl != null)
                {
                    if (IsReadyForFlush(DataTable.Rows[rowIndex]))
                    {
                        FlushEstimateTable(pdfDevice);
                    }

                    RowRender rowRender = CreatePrintingRow(pdfDevice, EstimateTable, DataTable.Rows[rowIndex], rowControl);
                    if (EstimateRow(pdfDevice, rowRender, renderArea))
                    {
                        AddRowToEstimateTable(rowRender, DataTable.Rows[rowIndex]);
                    }
                    else
                    {
                        DrawPrintingTable(pdfDevice, renderArea);
                        CreateNewPage(pdfDevice, renderArea);
                        rowIndex--;
                    }
                }
            }

            if (EstimateTable.Rows.Count > 0)
            {
                FlushEstimateTable(pdfDevice);
            }
            if (GridRender.Rows.Count >= 1)
            {
                DrawPrintingTable(pdfDevice, renderArea);
            }
        }

        #endregion Virtual Methods
    }
}
