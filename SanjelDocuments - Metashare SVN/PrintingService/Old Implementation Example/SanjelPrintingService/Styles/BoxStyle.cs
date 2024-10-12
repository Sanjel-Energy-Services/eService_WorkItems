
using System;

namespace Sanjel.PrintingService.Styles
{
    public class BoxStyle : IStyle
    {
        private double _top;
        private double _bottom;
        private double _left;
        private double _right;

        public double Top
        {
            get { return _top; }
            set { _top = Math.Abs(value); }
        }

        public double Bottom
        {
            get { return _bottom; }
            set { _bottom = Math.Abs(value); }
        }

        public double Left
        {
            get { return _left; }
            set { _left = Math.Abs(value); }
        }

        public double Right
        {
            get { return _right; }
            set { _right = Math.Abs(value); }
        }

        public BoxStyle()
        {
            Top = 0;
            Bottom = 0;
            Left = 0;
            Right = 0;
        }

        public BoxStyle(BoxStyle parent)
        {
            Top = parent.Top;
            Bottom = parent.Bottom;
            Left = parent.Left;
            Right = parent.Right;
        }

        public BoxStyle Clone()
        {
            return new BoxStyle
            {
                Top = Top,
                Bottom = Bottom,
                Left = Left,
                Right = Right
            };
        }
    }
}
