
using System.Windows;

using O2S.Components.PDF4NET.Graphics;
using O2S.Components.PDF4NET.Graphics.Fonts;
using O2S.Components.PDF4NET.Graphics.Shapes;

using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public class HtmlTextRender : TextRender
    {
        public HtmlTextRender(string id, string text, StyleModel style, double left, double top, double width, double height)
            : base(id, text, style, left, top, width, height)
        {
        }

        public override Render Clone()
        {
            HtmlTextRender renderClone = new HtmlTextRender(Id, Text, Styles.Clone(), OriginX, OriginY, Width, Height);
            return renderClone;
        }

        public override void RenderText(SanjelPdfPage pdfPage)
        {
            if (Styles != null && Text != null)
            {
                PDFBrush textColor = new PDFBrush(new PDFRgbColor(Styles.TextFormat.Color));
                PDFTextFormatOptions options = PdfUtilities.FormatOptions(Styles.TextFormat);
                TrueTypeFont font = FontFactory.Instance.GetTrueTypeFont(Styles.TextFont);
                Rect clientRect = GetClientRect();

                pdfPage.Canvas.DrawHTMLTextBox(Text, font, null, textColor, clientRect.Left, clientRect.Top,
                                           clientRect.Width, clientRect.Height, options);
            }
        }

        public override double ComputeRenderHeight(SanjelPdfPage pdfPage)
        {
            var options = PdfUtilities.FormatOptions(Styles.TextFormat);
            var font = FontFactory.Instance.GetTrueTypeFont(Styles.TextFont);
            var virticalPadding = Styles.Padding.Top + Styles.Padding.Bottom;
            var rect = GetClientRect();
            return (Text == null) ? 0 : pdfPage.Canvas.GetHtmlTextBoxHeight(Text, 0, font, rect.Width, options) + virticalPadding;
        }
    }
}
