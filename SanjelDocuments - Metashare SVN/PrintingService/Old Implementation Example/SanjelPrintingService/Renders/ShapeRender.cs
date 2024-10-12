
using System.Linq;
using System.Windows;
using System.Collections.Generic;

using O2S.Components.PDF4NET;
using O2S.Components.PDF4NET.Graphics;

using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public class ShapeRender : Render
    {
        public List<PDFPoint> Points { get; set; } 

        public ShapeRender(string id, IEnumerable<Point> points, StyleModel style, double left, double top, double width, double height)
            : base(id, style, left, top, width, height)
        {
            Points = new List<PDFPoint>();
            foreach (Point point in points)
            {
                Points.Add(new PDFPoint(point.X, point.Y));
            }
        }

        public override Render Clone()
        {
            List<Point> points = Points.Select(point => new Point(point.X, point.Y)).ToList();
            ShapeRender renderClone = new ShapeRender(Id, points, Styles.Clone(), OriginX, OriginY, Width, Height);
            return renderClone;
        }

        public override void RenderBorders(SanjelPdfPage pdfPage)
        {
            if (Styles == null || Points == null)
            {
                return;
            }

            if (Styles.Line.Visible)
            {
                PDFPen linePen = PdfUtilities.LinePen(Styles.Line);
                pdfPage.Canvas.DrawLines(linePen, Points.ToArray());
            }
        }
    }
}
