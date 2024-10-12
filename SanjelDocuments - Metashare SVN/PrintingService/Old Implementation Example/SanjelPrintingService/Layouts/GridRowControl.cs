
using System;
using System.Collections.Generic;
using System.Data;

using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Layouts
{
    public class GridRowControl : Frame
    {
        public bool GroupBy { get; set; }

        public List<GridCellControl> Cells { get; set; }

        public GridRowControl(string id)
            : base(id)
        {
            Cells = new List<GridCellControl>();
        }

        public GridRowControl(string id, bool groupBy)
            : base(id)
        {
            GroupBy = groupBy;
            Cells = new List<GridCellControl>();
        }

        public RowRender BuildRenderObject(PdfDevice pdfDevice, GridRender gridRender, DataRow dataRow)
        {
            RowRender rowRender = new RowRender(Id, Styles, gridRender.OriginX, gridRender.OriginY, gridRender.Width, 0);
            Render[] renders = new Render[Cells.Count];
            double widthTaken = 0;
            int maxCount = 0;
            for (int index = 0; index < Cells.Count; index++)
            {
                GridCellControl cellControl = Cells[index];
                if (cellControl.Stretch == EnumStretchType.Maximum)
                {
                    maxCount++;
                    continue;
                }
                Render render = cellControl.BuildRenderObject(pdfDevice, rowRender, dataRow);
                renders[index] = render;
                widthTaken += render.Width;
            }

            if (maxCount > 0)
            {
                double widthAvailable = gridRender.Width - widthTaken;
                if (widthAvailable < 0)
                {
                    throw new Exception("Total Width of columns in the table " + Id + " is too big.");
                }
                double widthAverage = widthAvailable/maxCount;
                for (int index = 0; index < Cells.Count; index++)
                {
                    GridCellControl cellControl = Cells[index];
                    if (cellControl.Stretch == EnumStretchType.Maximum)
                    {
                        cellControl.Width = widthAverage;
                        Render render = cellControl.BuildRenderObject(pdfDevice, rowRender, dataRow);
                        renders[index] = render;
                    }
                }
            }

            double left = rowRender.OriginX;
            for (int index = 0; index < Cells.Count; index++ )
            {
                Render render = renders[index];
                render.OriginX = left;
                left += render.Width;
                rowRender.Children.Add(render);
            }
            rowRender.Width = left - OriginX;
            return rowRender;
        }
    }
}

