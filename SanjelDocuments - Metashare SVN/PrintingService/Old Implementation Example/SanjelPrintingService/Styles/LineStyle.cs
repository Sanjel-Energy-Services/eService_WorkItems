
using System;
using System.Drawing;

namespace Sanjel.PrintingService.Styles
{
    public enum EnumLengthUnit
    {
        None,
        Percent,    // percentage
        Inch,       // inch
        Cm,         // centi-meter
        Pixel,      // pixel
    }

    public enum EnumBorderStyle
    {
        None,       // Specifies no border. This is default
        Solid,
        Dot,
        Dash,
        DashDot,
        DashDotDot,
    }

    public class LineStyle : IStyle
    {
        private double _width;

        public bool Visible
        {
            get { return Style != EnumBorderStyle.None; }
            set { Style = value ? EnumBorderStyle.Solid : EnumBorderStyle.None; }
        }

        public double Width
        {
            get { return _width; }
            set { _width = Math.Abs(value); }
        }

        public EnumBorderStyle Style { get; set; }
        public Color Color { get; set; }

        public LineStyle()
        {
            Width = 0;
            Style = EnumBorderStyle.None;
            Color = Color.Black;
        }

        public LineStyle(LineStyle parent)
        {
            // don't inherit this property from parent
            Style = EnumBorderStyle.None;

            Width = parent.Width;
            Color = parent.Color;
        }

        public LineStyle Clone()
        {
            return new LineStyle
            {
                Width = Width,
                Style = Style,
                Color = Color
            };
        }
    }
}
