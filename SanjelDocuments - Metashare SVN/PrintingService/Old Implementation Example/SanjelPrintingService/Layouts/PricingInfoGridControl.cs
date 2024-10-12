
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Layouts
{
    public sealed class PricingInfoGridControl : GridControl
    {
        #region Instance Variables

        private RowRender _headerRow;

        #endregion Instance Variables

        #region Constructor

        public PricingInfoGridControl(string id)
            : base(id)
        {
        }

        #endregion Constructor

        #region Virtual Methods

        protected override void DrawDataGrid(PdfDevice pdfDevice, EnumRenderArea renderArea)
        {
            _headerRow = null;
            base.DrawDataGrid(pdfDevice, renderArea);
        }

        protected override RowRender CreatePrintingRow(PdfDevice pdfDevice, GridRender gridRender, DataRow dataRow, GridRowControl rowControl)
        {
            RowRender rowRender = new RowRender(rowControl.Id, rowControl.Styles, gridRender.OriginX, gridRender.OriginY, gridRender.Width, 0);
            bool isHeader = IsHeaderRow(rowControl.Id);
            foreach (GridCellControl cellControl in rowControl.Cells)
            {
                string text = null;
                if (!string.IsNullOrEmpty(cellControl.DataField) && dataRow != null && dataRow.Table.Columns.Contains(cellControl.DataField))
                {
                    object item = dataRow[cellControl.DataField];
                    if (item != null)
                    {
                        text = item.ToString();
                    }
                }
                else if (!string.IsNullOrEmpty(cellControl.Label))
                {
                    text = cellControl.Label;
                }

                // merge notes of header to description of header
                if (isHeader && dataRow != null && dataRow["Notes"] != null && dataRow["Notes"].ToString().Length > 0 &&
                    string.Compare(cellControl.DataField, "Description", StringComparison.OrdinalIgnoreCase) == 0 &&
                    GetRowControl(PriceBookDefinition.NotesTemplate) != null)
                {
                    GridRowControl notesControl = GetRowControl(PriceBookDefinition.NotesTemplate);
                    KeyValuePair<string, string> pairHeader = ReportLayoutBuilder.BuildHtmlString(cellControl.Styles);
                    KeyValuePair<string, string> pairNotes = ReportLayoutBuilder.BuildHtmlString(notesControl.Styles);
                    string html = pairHeader.Key + text + pairHeader.Value + "<br />" + pairNotes.Key + dataRow["Notes"] + pairNotes.Value;
                    HtmlTextRender printingCell = new HtmlTextRender(cellControl.Id, html, cellControl.Styles,
                                                             gridRender.OriginX + cellControl.OriginX,
                                                             gridRender.OriginY, cellControl.Width, 0);
                    rowRender.Children.Add(printingCell);
                }
                else
                {
                    TextRender printingCell = new TextRender(cellControl.Id, text, cellControl.Styles,
                                                             gridRender.OriginX + cellControl.OriginX,
                                                             gridRender.OriginY, cellControl.Width, 0);
                    rowRender.Children.Add(printingCell);
                }
            }
            return rowRender;
        }

        protected override void AfterAddRowToEstimateTable(RowRender rowRender, DataRow dataRow)
        {
            if (IsHeaderRow(rowRender.Id))
            {
                _headerRow = rowRender;

                if (IsMainHeaderRow(rowRender.Id))
                {
                    SanjelPdfBookmark bookmark = new SanjelPdfBookmark(dataRow["Description"].ToString());
                    Bookmarks.Add(rowRender, bookmark);
                }
            }
        }

        protected override void AfterAddRowToRenderTable(RowRender rowRender, PdfDevice pdfDevice)
        {
            if (IsMainHeaderRow(rowRender.Id) && Bookmarks.ContainsKey(rowRender))
            {
                SanjelPdfBookmark bookmark = Bookmarks[rowRender];
                bookmark.UpdateHostPage(pdfDevice.CurrentPage);
                pdfDevice.Section.AddBookmark(bookmark);
                Bookmarks.Remove(rowRender);
            }
        }

        protected override void AfterForceFlushEstimateTable(PdfDevice pdfDevice)
        {
            if (_headerRow != null)
            {
                Render cloneHeader = _headerRow.Clone();
                EstimateTable.Rows.Add(cloneHeader as RowRender);
                EstimateTable.Height += cloneHeader.Height;
            }
        }

        protected override void BeforeDrawPrintingTable(PdfDevice pdfDevice, EnumRenderArea renderArea)
        {
            base.BeforeDrawPrintingTable(pdfDevice, renderArea);
            RemoveBottomLineOfLastRow();
        }

        protected override bool IsReadyForFlush(DataRow row)
        {
            string rowName = row["RowName"].ToString();
            if (EstimateTable.Rows.Count > 1 && IsHeaderRow(rowName) && HasPriceItemInEstimateTable())
            {
                HasPriceItemInEstimateTable();
                return true;
            }
            return false;
        }

        #endregion Virtual Methods

        #region Private Methods

        private bool IsHeaderRow(string rowId)
        {
            return (string.Compare(rowId, PriceBookDefinition.H1TitleTemplate, StringComparison.OrdinalIgnoreCase) == 0 ||
                    string.Compare(rowId, PriceBookDefinition.H2TitleTemplate, StringComparison.OrdinalIgnoreCase) == 0 ||
                    string.Compare(rowId, PriceBookDefinition.H3TitleTemplate, StringComparison.OrdinalIgnoreCase) == 0);
        }

        private bool IsMainHeaderRow(string rowId)
        {
            return (string.Compare(rowId, PriceBookDefinition.H1TitleTemplate, StringComparison.OrdinalIgnoreCase) == 0);
        }

        private void RemoveBottomLineOfLastRow()
        {
            for (int index = 0; index < GridRender.Rows.Count; index++)
            {
                if (IsMainHeaderRow(GridRender.Rows[index].Id) && index > 1)
                {
                    if (!IsMainHeaderRow(GridRender.Rows[index - 1].Id))
                    {
                        StyleModel newStyles = GridRender.Rows[index - 1].Styles.Clone();
                        newStyles.Border.Bottom.Visible = false;
                        GridRender.Rows[index - 1].Styles = newStyles;
                    }
                }
                if (index == GridRender.Rows.Count - 1)
                {
                    StyleModel newStyles = GridRender.Rows[index].Styles.Clone();
                    newStyles.Border.Bottom.Visible = false;
                    GridRender.Rows[index].Styles = newStyles;
                }
            }
        }

        private bool HasPriceItemInEstimateTable()
        {
            return EstimateTable.Rows.Any(rowRender => !IsHeaderRow(rowRender.Id));
        }

        #endregion Private Methods
    }
}
