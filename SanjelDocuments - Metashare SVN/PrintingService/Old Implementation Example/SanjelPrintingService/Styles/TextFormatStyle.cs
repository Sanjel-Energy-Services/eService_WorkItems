
using System;
using System.Drawing;

namespace Sanjel.PrintingService.Styles
{
    public enum EnumTextAlignment
    {
        TopLeft,
        TopCenter,
        TopRight,
        MiddleLeft,
        MiddleCenter,
        MiddleRight,
        MiddleDescentLeft,
        MiddleDescentCenter,
        MiddleDescentRight,
        BottomLeft,
        BottomCenter,
        BottomRight,
        BottomDescentLeft,
        BottomDescentCenter,
        BottomDescentRight,
        TopJustified,
        MiddleJustified,
        BottomJustified
    }

    public enum EnumHorizontalAlignment
    {
        Left,
        Center,
        Right,
        Justify
    }

    public enum EnumVerticalAlignment
    {
        Top,
        Middle,
        Bottom
    }

    public class TextFormatStyle : IStyle
    {
        public Color Color { get; set; }
        public double LineSpacing { get; set; }
        public double Orientation { get; set; }

        public EnumHorizontalAlignment HorAlignment { get; set; }
        public EnumVerticalAlignment VerAlignment { get; set; }

        public TextFormatStyle()
        {
            Color = Color.Black;
            LineSpacing = 0;
            Orientation = 0;
            HorAlignment = EnumHorizontalAlignment.Left;
            VerAlignment = EnumVerticalAlignment.Top;
        }

        public TextFormatStyle(TextFormatStyle parent)
        {
            Color = parent.Color;
            LineSpacing = parent.LineSpacing;
            Orientation = parent.Orientation;
            HorAlignment = parent.HorAlignment;
            VerAlignment = parent.VerAlignment;
        }

        public TextFormatStyle Clone()
        {
            return new TextFormatStyle
            {
                Color = Color,
                LineSpacing = LineSpacing,
                Orientation = Orientation,
                HorAlignment = HorAlignment,
                VerAlignment = VerAlignment
            };
        }

        public EnumTextAlignment GetAlignment()
        {
            EnumTextAlignment alignment;
            Enum.TryParse(VerAlignment + HorAlignment.ToString(), true, out alignment);
            return alignment;
        }
    }
}
