
using System.Data;
using System.Windows;

using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Layouts
{
    public enum CellDataType
    {
        Label,
        Text,
        Image
    };

    public enum EnumStretchType
    {
        Fixed,
        Minimum,
        Maximum
    }

    public enum EnumCellControlType
    {
        Normal,
        TrailLine,
    }

    public class GridCellControl : Frame
    {
        #region Instance Properties

        public int StartColumn { get; set; }
        public int EndColumn { get; set; }
        public string DataField { get; set; }
        public string Label { get; set; }

        public EnumCellControlType ControlType { get; set; }
        public EnumStretchType Stretch { get; set; }
        public CellDataType Type { get; set; }

        public Control Control { get; set; }

        #endregion Instance Properties

        public GridCellControl(string id, int start, int end, string field, string label)
            : base(id)
        {
            StartColumn = start;
            EndColumn = end;
            DataField = field;
            Label = label;
        }

        public Render BuildRenderObject(PdfDevice pdfDevice, RowRender rowRender, DataRow dataRow)
        {
            string text = GetText(dataRow);
            double objectWidth = Width;
            if (Stretch ==EnumStretchType.Minimum)
            {
                Size size = TextRender.EstimateRenderSize(pdfDevice.CurrentPage, text, Styles, Width);
                objectWidth = size.Width < objectWidth ? size.Width : objectWidth;
            }

            if (ControlType == EnumCellControlType.TrailLine)
            {
                TrailLineRender trailLine = new TrailLineRender(Id, text, Styles, rowRender.OriginX + OriginX, rowRender.OriginY, objectWidth, 0);
                return trailLine;
            }
            
            TextRender render = new TextRender(Id, text, Styles, rowRender.OriginX + OriginX, rowRender.OriginY, objectWidth, 0);
            return render;
        }

        private string GetText(DataRow dataRow)
        {
            string text = null;
            if (!string.IsNullOrEmpty(DataField) && dataRow != null)
            {
                object item = dataRow[DataField];
                if (item != null)
                {
                    text = item.ToString();
                }
            }
            else if (!string.IsNullOrEmpty(Label))
            {
                text = Label;
            }
            return text;
        }
    }
}

