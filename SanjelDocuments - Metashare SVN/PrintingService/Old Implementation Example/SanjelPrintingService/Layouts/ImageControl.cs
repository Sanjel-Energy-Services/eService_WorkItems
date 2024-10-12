
using System.Windows;

using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Layouts
{
    public class ImageControl : Control
    {
        #region Instance Variables

        private ImageModel _model;

        #endregion Instance Variables

        #region Instance Properties

        public override IModel Model
        {
            get { return _model; }
            set { _model = value as ImageModel; }
        }

        #endregion Instance Properties

        #region Constructors

        public ImageControl(string id)
            : base(id)
        {
        }

        #endregion Constructors

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            Rect clientRect = GetClientRect();
            double imageWidth = _model.Image.Width;
            double imageHeight = _model.Image.Height;
            double xRatio = clientRect.Width / imageWidth;
            double yRatio = clientRect.Height / imageHeight;
            if (xRatio < yRatio)
            {
                imageWidth = imageWidth*xRatio;
                imageHeight = imageHeight*xRatio;
            }
            else
            {
                imageWidth = imageWidth*yRatio;
                imageHeight = imageHeight*yRatio;
            }

            if (Styles.TextFormat.HorAlignment == EnumHorizontalAlignment.Right)
            {
                double newLeft = clientRect.Right - imageWidth;
                clientRect.X = newLeft > clientRect.X ? newLeft : clientRect.X;
            }
            else if (Styles.TextFormat.HorAlignment == EnumHorizontalAlignment.Center)
            {
                double newLeft = clientRect.Left + (clientRect.Width - imageWidth)/2;
                clientRect.X = newLeft > clientRect.X ? newLeft : clientRect.X;
            }

            if (Styles.TextFormat.VerAlignment == EnumVerticalAlignment.Middle)
            {
                double newTop = clientRect.Top + clientRect.Height/2 - imageHeight/2;
                clientRect.Y = newTop > clientRect.Y ? newTop : clientRect.Y;
            }

            SanjelPdfPage pdfPage = device.CurrentPage;
            ImageRender render = new ImageRender(Id, _model.Image, Styles, clientRect.Left, clientRect.Top, clientRect.Width, clientRect.Height);
            pdfPage.AddRenderObject(render, renderArea);
        }
    }
}
