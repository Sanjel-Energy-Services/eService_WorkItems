
using System.Windows;

using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Layouts
{
    public class Frame
    {
        #region Instance Variables

        private bool _initializedByStyle;

        #endregion Instance Variables

        #region Instance Properties

        public string Id { get; set; }
        public StyleModel Styles { get; set; }

        public double Width { get; set; }
        public double Height { get; set; }
        public double OriginX { get; set; }
        public double OriginY { get; set; }

        #endregion Instance Properties

        #region Constructors

        public Frame()
        {
            InitializeFrame();
        }

        public Frame(string id)
        {
            Id = id;
            InitializeFrame();
        }

        public Frame(string id, StyleModel styles)
        {
            Id = id;
            InitializeFrame(styles);
        }

        #endregion Constructors

        #region Public Methods

        public Rect GetClientRect()
        {
            double width = Width - Styles.Padding.Left - Styles.Padding.Right;
            double height = Height - Styles.Padding.Top - Styles.Padding.Bottom;

            // width and height cannot be negative values
            width = width > 0 ? width : 0;
            height = height > 0 ? height : 0;
            return new Rect(OriginX + Styles.Padding.Left, OriginY + Styles.Padding.Top, width, height);
        }

        public Rect GetFrameRect()
        {
            return new Rect(OriginX, OriginY, Width, Height);
        }

        public Rect GetExtAreaRect()
        {
            double width = Width + Styles.Margin.Left + Styles.Margin.Right;
            double height = Height + Styles.Margin.Top + Styles.Margin.Bottom;

            return new Rect(OriginX - Styles.Margin.Left, OriginY - Styles.Margin.Top, width, height);
        }

        public void InitializeRect(bool forceIt = false)
        {
            if (Styles != null && (!_initializedByStyle || forceIt))
            {
                _initializedByStyle = true;
                OriginX = Styles.OriginX;
                OriginY = Styles.OriginY;
                Width = Styles.Width;
                Height = Styles.Height;
            }
        }

        public void InitializeRect(Rect parentRect)
        {
            InitializeRect();

            OriginX = OriginX < 1 ? parentRect.Left + Styles.Margin.Left : OriginX;
            OriginY = OriginY < 1 ? parentRect.Top + Styles.Margin.Top : OriginY;

            double newWidth = parentRect.Width - Styles.Margin.Left - Styles.Margin.Right;
            double newHeight = parentRect.Height - Styles.Margin.Top - Styles.Margin.Bottom;
            newWidth = (newWidth <= double.Epsilon) ? 0 : newWidth;
            newHeight = (newHeight <= double.Epsilon) ? 0 : newHeight;

            Width = (Width <= double.Epsilon) ? newWidth : Width;
            Width = (Width > newWidth) ? newWidth : Width;
            Height = (Height <= double.Epsilon) ? newHeight : Height;
            Height = (Height > newHeight) ? newHeight : Height;
        }

        public virtual void ReInitialize()
        {
            InitializeRect(true);
        }

        public virtual void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null) { }

        #endregion Public Methods

        #region Private Methods

        private void InitializeFrame(StyleModel styles = null)
        {
            Styles = styles ?? new StyleModel();
        }

        #endregion Private Methods
    }
}
