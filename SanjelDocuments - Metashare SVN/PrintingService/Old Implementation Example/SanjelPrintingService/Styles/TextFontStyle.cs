
using System;
using System.Globalization;

namespace Sanjel.PrintingService.Styles
{
    public enum EnumFontStyle
    {
        Normal,
        Italic
    }

    public enum EnumFontWeight
    {
        Normal,
        Bold
    }

    public enum EnumFontDecoration
    {
        None,
        Overline,
        Linethrough,
        Underline
    }

    public class TextFontStyle : IStyle, IEquatable<TextFontStyle>
    {
        private double _size;

        public double Size
        {
            get { return _size; }
            set { _size = Math.Abs(value); }
        }

        public string Name { get; set; }
        public EnumFontStyle Style { get; set; }
        public EnumFontWeight Weight { get; set; }
        public EnumFontDecoration Decoration { get; set; }

        public TextFontStyle()
        {
            Name = "Arial";
            Size = 9;
            Style = EnumFontStyle.Normal;
            Weight = EnumFontWeight.Normal;
            Decoration = EnumFontDecoration.None;
        }

        public TextFontStyle(TextFontStyle parent)
        {
            Name = parent.Name;
            Size = parent.Size;
            Style = parent.Style;
            Weight = parent.Weight;
            Decoration = parent.Decoration;
        }

        #region Instance Methods

        public TextFontStyle Clone()
        {
            return new TextFontStyle
            {
                Name = Name,
                Size = Size,
                Style = Style,
                Weight = Weight,
                Decoration = Decoration
            };
        }

        public override string ToString()
        {
            return Size.ToString(CultureInfo.InvariantCulture) + Style + Weight + Decoration + Name;
        }

        public override int GetHashCode()
        {
            return ToString().GetHashCode();
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            TextFontStyle style = obj as TextFontStyle;
            return style != null && Equals(style);
        }

        public bool Equals(TextFontStyle other)
        {
            return other != null && this == other;
        }

        public static bool operator != (TextFontStyle left, TextFontStyle right)
        {
            return !(left == right);
        }

        public static bool operator == (TextFontStyle left, TextFontStyle right)
        {
            if ((object)left == null && (object)right == null) return true;
            if ((object)left == null || (object)right == null) return false;

            return (String.Compare(left.ToString(), right.ToString(), StringComparison.OrdinalIgnoreCase) == 0);
        }

        #endregion Instance Methods
    }
}
