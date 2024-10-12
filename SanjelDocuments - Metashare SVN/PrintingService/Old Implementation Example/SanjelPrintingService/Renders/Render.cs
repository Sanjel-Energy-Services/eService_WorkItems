
using System.Windows;

using O2S.Components.PDF4NET;
using O2S.Components.PDF4NET.Graphics;

using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public enum EnumRenderingLayer
    {
        Background,
        Image,
        Text,
        Line
    }

    public class Render
    {
        public string Id { get; set; }
        public StyleModel Styles { get; set; }

        // in graphic coordinate
        public double Width { get; set; }
        public double Height { get; set; }
        public double OriginX { get; set; }
        public double OriginY { get; set; }

        public Render(string id, StyleModel style, double left, double top, double width, double height)
        {
            Id = id;
            Styles = style;

            OriginX = left;
            OriginY = top;
            Width = width;
            Height = height;
        }

        public Rect GetControlRect()
        {
            return new Rect(OriginX, OriginY, Width, Height);
        }

        public Rect GetClientRect()
        {
            double width = Width - Styles.Padding.Left - Styles.Padding.Right;
            double height = Height - Styles.Padding.Top - Styles.Padding.Bottom;

            // width and height cannot be negative values
            width = width > 0 ? width : 0;
            height = height > 0 ? height : 0;
            return new Rect(OriginX + Styles.Padding.Left, OriginY + Styles.Padding.Top, width, height);
        }

        public void SetObjectRect(double left, double top, double width, double height)
        {
            OriginX = left;
            OriginY = top;
            Width = width;
            Height = height;
        }

        public virtual Render Clone()
        {
            Render renderClone = new Render(Id, Styles.Clone(), OriginX, OriginY, Width, Height);
            return renderClone;
        }

        public virtual void RenderText(SanjelPdfPage pdfPage)
        {
        }

        public virtual void RenderBorders(SanjelPdfPage pdfPage)
        {
            if (Styles == null)
            {
                return;
            }

            if (Styles.Border.Top.Visible)
            {
                PDFPen linePen = PdfUtilities.LinePen(Styles.Border.Top);
                PDFPoint[] points = {
                                        new PDFPoint(OriginX + Width, OriginY), // top right
                                        new PDFPoint(OriginX, OriginY) // top left
                                    };
                pdfPage.Canvas.DrawLines(linePen, points);
            }
            if (Styles.Border.Bottom.Visible)
            {
                PDFPen linePen = PdfUtilities.LinePen(Styles.Border.Bottom);
                PDFPoint[] points = {
                                        new PDFPoint(OriginX + Width, OriginY + Height), // bottom right
                                        new PDFPoint(OriginX, OriginY + Height) // bottom left
                                    };
                pdfPage.Canvas.DrawLines(linePen, points);
            }
            if (Styles.Border.Left.Visible)
            {
                PDFPen linePen = PdfUtilities.LinePen(Styles.Border.Left);
                PDFPoint[] points = {
                                        new PDFPoint(OriginX, OriginY + Height), // bottom left
                                        new PDFPoint(OriginX, OriginY) // top left
                                    };
                pdfPage.Canvas.DrawLines(linePen, points);
            }
            if (Styles.Border.Right.Visible)
            {
                PDFPen linePen = PdfUtilities.LinePen(Styles.Border.Right);
                PDFPoint[] points = {
                                        new PDFPoint(OriginX + Width, OriginY + Height), // bottom right
                                        new PDFPoint(OriginX + Width, OriginY) // top right
                                    };
                pdfPage.Canvas.DrawLines(linePen, points);
            }
        }

        public virtual void RenderImage(SanjelPdfPage pdfPage)
        {
        }

        public virtual void RenderBackground(SanjelPdfPage pdfPage)
        {
            if (Styles != null && Styles.Background.Visible)
            {
                PDFBrush backgroundColor = new PDFBrush(new PDFRgbColor(Styles.Background.Color));
                pdfPage.Canvas.DrawRectangle(null, backgroundColor, OriginX, OriginY, Width, Height);
            }
        }

        public virtual void RenderingByLayer(SanjelPdfPage pdfPage, EnumRenderingLayer layer)
        {
            switch (layer)
            {
                case EnumRenderingLayer.Background:
                    RenderBackground(pdfPage);
                    break;
                case EnumRenderingLayer.Image:
                    RenderImage(pdfPage);
                    break;
                case EnumRenderingLayer.Text:
                    RenderText(pdfPage);
                    break;
                case EnumRenderingLayer.Line:
                    RenderBorders(pdfPage);
                    break;
            }
        }

        public virtual double ComputeRenderHeight(SanjelPdfPage pdfPage)
        {
            return 0;
        }
    }
}
