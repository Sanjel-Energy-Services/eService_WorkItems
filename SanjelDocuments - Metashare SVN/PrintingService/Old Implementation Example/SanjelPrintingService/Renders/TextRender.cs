
using System.Windows;

using O2S.Components.PDF4NET.Graphics;
using O2S.Components.PDF4NET.Graphics.Fonts;
using O2S.Components.PDF4NET.Graphics.Shapes;

using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public class TextRender : Render
    {
        public string Text { get; set; }

        public TextRender(string id, string text, StyleModel style, double left, double top, double width, double height)
            : base(id, style, left, top, width, height)
        {
            Text = text;
        }

        public override Render Clone()
        {
            TextRender renderClone = new TextRender(Id, Text, Styles.Clone(), OriginX, OriginY, Width, Height);
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

                pdfPage.Canvas.DrawTextBox(Text, font, null, textColor, clientRect.Left, clientRect.Top,
                                           clientRect.Width, clientRect.Height, options);
            }
        }

        public override double ComputeRenderHeight(SanjelPdfPage pdfPage)
        {
            var options = PdfUtilities.FormatOptions(Styles.TextFormat);
            var font = FontFactory.Instance.GetTrueTypeFont(Styles.TextFont);
            var virticalPadding = Styles.Padding.Top + Styles.Padding.Bottom;
            var rect = GetClientRect();
            return string.IsNullOrEmpty(Text) ? 0 : pdfPage.Canvas.GetTextBoxHeight(Text, font, rect.Width, options) + virticalPadding;
        }

        public static Size EstimateRenderSize(SanjelPdfPage pdfPage, string text, StyleModel styleModel, double maxWidth)
        {
            var options = PdfUtilities.FormatOptions(styleModel.TextFormat);
            var font = FontFactory.Instance.GetTrueTypeFont(styleModel.TextFont);
            var horPadding = styleModel.Padding.Left + styleModel.Padding.Right;
            var virPadding = styleModel.Padding.Top + styleModel.Padding.Bottom;
            double width = font.MeasureString(text) + horPadding;
            width = width > maxWidth ? maxWidth : width;
            double height = pdfPage.Canvas.GetTextBoxHeight(text, font, width - horPadding, options) + virPadding;
            return new Size(width, height);
        }
    }
}
