
using System.Windows;

using O2S.Components.PDF4NET.Graphics;
using O2S.Components.PDF4NET.Graphics.Fonts;
using O2S.Components.PDF4NET.Graphics.Shapes;

using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public class TrailLineRender : TextRender
    {
        public TrailLineRender(string id, string text, StyleModel style, double left, double top, double width, double height)
            : base(id, text, style, left, top, width, height)
        {
        }

        public double ExtWidth { get; set; }

        public override void RenderText(SanjelPdfPage pdfPage)
        {
            if (Styles != null && Text != null)
            {
                PDFBrush textColor = new PDFBrush(new PDFRgbColor(Styles.TextFormat.Color));
                PDFPen lineColor = PdfUtilities.LinePen(Styles.Line);
                PDFTextFormatOptions options = PdfUtilities.FormatOptions(Styles.TextFormat);
                TrueTypeFont font = FontFactory.Instance.GetTrueTypeFont(Styles.TextFont);
                Rect clientRect = GetClientRect();

                double textWidth = clientRect.Width*0.7;
                double lastWidth = pdfPage.Canvas.GetTextBoxLastLineWidth(Text, font, textWidth, options);
                double height = pdfPage.Canvas.GetTextBoxHeight(Text, font, textWidth, options);
                pdfPage.Canvas.DrawTextBox(Text, font, null, textColor, clientRect.Left, clientRect.Top, textWidth, clientRect.Height, options);

                double[] dashPattern = { Styles.Line.Width, 3 };
                double lengthPattern = Styles.Line.Width + 3;
                lineColor.DashStyle = PDFDashStyle.Custom;
                lineColor.DashPattern = dashPattern;

                // doesn't support vertical align by middle
                double lineTop = clientRect.Top + height - font.Size*(1000 - font.Metrics.Ascent)/1000;// vertical align by Top
                if (Styles.TextFormat.VerAlignment == EnumVerticalAlignment.Bottom)
                {
                    lineTop = clientRect.Bottom;
                }

                double lineLeft = clientRect.Left + lastWidth + Styles.Padding.Left;// horizontal align by left
                if (Styles.TextFormat.HorAlignment == EnumHorizontalAlignment.Right)
                {
                    lineLeft = clientRect.Left + textWidth;
                }
                else if (Styles.TextFormat.HorAlignment == EnumHorizontalAlignment.Center)
                {
                    lineLeft = clientRect.Left + (textWidth + lastWidth)/2;
                }

                if (lineLeft % lengthPattern != 0)
                {
                    lineLeft = (((int)(lineLeft / lengthPattern)) + 1) * lengthPattern;
                }
                double lineRight = clientRect.Right;

                pdfPage.Canvas.DrawLine(lineColor, lineLeft, lineTop, lineRight, lineTop);
            }
        }

        public override double ComputeRenderHeight(SanjelPdfPage pdfPage)
        {
            var options = PdfUtilities.FormatOptions(Styles.TextFormat);
            var font = FontFactory.Instance.GetTrueTypeFont(Styles.TextFont);
            var virticalPadding = Styles.Padding.Top + Styles.Padding.Bottom;
            var clientRect = GetClientRect();
            double textWidth = clientRect.Width * 0.7;
            return (Text == null) ? 0 : pdfPage.Canvas.GetTextBoxHeight(Text, font, textWidth, options) + virticalPadding;
        }
    }
}
