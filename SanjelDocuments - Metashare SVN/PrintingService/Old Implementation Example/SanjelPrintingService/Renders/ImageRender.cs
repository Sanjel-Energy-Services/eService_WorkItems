
using O2S.Components.PDF4NET.Graphics.Shapes;

using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public class ImageRender : Render
    {
        public PDFImage Image { get; set; }

        public ImageRender(string id, PDFImage image, StyleModel style, double left, double top, double width, double height)
            : base(id, style, left, top, width, height)
        {
            Image = image;
        }

        public override Render Clone()
        {
            ImageRender renderClone = new ImageRender(Id, Image, Styles.Clone(), OriginX, OriginY, Width, Height);
            return renderClone;
        }

        public override void RenderImage(SanjelPdfPage pdfPage)
        {
            if (Styles == null || Image == null)
            {
                return;
            }

            var rect = GetClientRect();
            pdfPage.Canvas.DrawImage(Image, rect.Left, rect.Top, rect.Width, rect.Height, 0, PDFKeepAspectRatio.KeepBoth);
        }
    }
}
