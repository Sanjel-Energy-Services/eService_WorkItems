
using System;
using System.Drawing;
using System.IO;
using O2S.Components.PDF4NET;
using O2S.Components.PDF4NET.Graphics;
using O2S.Components.PDF4NET.Graphics.Fonts;
using O2S.Components.PDF4NET.Graphics.Shapes;

using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public class PdfUtilities
    {
        public static PDFTextFormatOptions FormatOptions(TextFormatStyle textFormat)
        {
            PDFTextFormatOptions options = new PDFTextFormatOptions
                                               {
                                                   Align = TextAlignment(textFormat.GetAlignment()),
                                                   LineSpacing = textFormat.LineSpacing,
                                                   Orientation = textFormat.Orientation,

                                                   // TODO: HYang
                                                   ClipText = PDFClipText.ClipWords,
                                                   BreakLongWords = true,
                                                   FirstLineIndent = 0
                                               };
            return options;
        }

        public static PDFTextAlign TextAlignment(EnumTextAlignment enumText)
        {
            PDFTextAlign alignment;
            Enum.TryParse(enumText.ToString(), true, out alignment);
            return alignment;
        }
 
        public static TrueTypeFont TrueTypeFont(TextFontStyle style)
        {
            FontStyle fontStyle = FontStyle.Regular;
            if (style.Weight == EnumFontWeight.Bold)
            {
                fontStyle |= FontStyle.Bold;
            }
            if (style.Style == EnumFontStyle.Italic)
            {
                fontStyle |= FontStyle.Italic;
            }

            TrueTypeFont ttfFont = new TrueTypeFont(new Font(style.Name, (float) (style.Size), fontStyle), true)
                                       {
                                           Overline = (style.Decoration == EnumFontDecoration.Overline),
                                           Strikethrough = (style.Decoration == EnumFontDecoration.Linethrough),
                                           Underline = (style.Decoration == EnumFontDecoration.Underline)
                                       };
            return ttfFont;
        }

        public static PDFDashStyle DashStyle(EnumBorderStyle style)
        {
            PDFDashStyle dash;
            Enum.TryParse(style.ToString(), true, out dash);
            return dash;
        }

        public static PDFPen LinePen(LineStyle style)
        {
            return new PDFPen(new PDFRgbColor(style.Color), style.Width)
                       {DashStyle = DashStyle(style.Style)};
        }

        public static PDFDocument LoadFromFile(string path)
        {
            PDFDocument doc = new PDFDocument(path);
            doc.SerialNumber = "PDF4NET-8J6PH-19RQP-9RN8W-7CCKX-O0QB2";
            return doc;
        }

        public static PDFDocument Combine(PDFDocument doc1, PDFDocument doc2)
        {
            foreach (var page in doc2.Pages)
            {
                doc1.Pages.Add(page);
            }

            return doc1;
        }

        public static PDFDocument Combine(PDFDocument doc1, params PDFDocument[] docs)
        {
            foreach (var doc in docs)
            {
                foreach (var page in doc.Pages)
                {
                    doc1.Pages.Add(page);
                }
            }

            return doc1;
        }

        public static FileInfo SaveToTemporaryFile(PDFDocument doc)
        {
            var path = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString() + ".pdf");
            doc.Save(path);
            return new FileInfo(path);
        }
    }
}
