
using System.Drawing;

namespace Sanjel.PrintingService.Styles
{
    public class BorderStyle : IStyle
    {
        public LineStyle Top { get; set; }
        public LineStyle Bottom { get; set; }
        public LineStyle Left { get; set; }
        public LineStyle Right { get; set; }

        public BorderStyle()
        {
            Top = new LineStyle();
            Bottom = new LineStyle();
            Left = new LineStyle();
            Right = new LineStyle();
        }

        public BorderStyle(BorderStyle parent)
        {
            Top = new LineStyle(parent.Top);
            Bottom = new LineStyle(parent.Bottom);
            Left = new LineStyle(parent.Left);
            Right = new LineStyle(parent.Right);
        }

        public BorderStyle Clone()
        {
            return new BorderStyle
            {
                Top = Top.Clone(),
                Bottom = Bottom.Clone(),
                Left = Left.Clone(),
                Right = Right.Clone()
            };
        }

        public void SetBorderWidth(double width)
        {
            Top.Width = width;
            Right.Width = width;
            Bottom.Width = width;
            Left.Width = width;
        }

        public void SetBorderStyle(EnumBorderStyle style)
        {
            Top.Style = style;
            Right.Style = style;
            Bottom.Style = style;
            Left.Style = style;
        }

        public void SetBorderColor(Color color)
        {
            Top.Color = color;
            Right.Color = color;
            Bottom.Color = color;
            Left.Color = color;
        }
    }
}
