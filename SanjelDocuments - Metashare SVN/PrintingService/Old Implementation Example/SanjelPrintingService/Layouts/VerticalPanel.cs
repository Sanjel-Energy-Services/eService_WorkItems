
using System;
using System.Collections.Generic;
using System.Windows;

using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Layouts
{
    public class VerticalPanel : Panel
    {
        public VerticalPanel(string id)
            : base(id)
        {
        }

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            Rect clientRect = GetClientRect();
            foreach (var frame in Frames)
            {
                Rect rectAvailable = device.CurrentPage.GetAvailablePlotRect(clientRect.Left, clientRect.Width, renderArea);
                clientRect.Y = rectAvailable.Top;

                frame.InitializeRect(clientRect);
                frame.BuildRenderObject(device, renderArea, groupFrame);
            }

            RenderPanelObject(device, renderArea);
        }

        public void RenderPanelObject(PdfDevice device, EnumRenderArea renderArea)
        {
            Rect clientRect = GetClientRect();
            SanjelPdfPage pdfPage = device.CurrentPage;
            if (Styles.Border.Top.Visible)
            {
                Point point1 = new Point(clientRect.Left, clientRect.Top);
                Point point2 = new Point(clientRect.Right, clientRect.Top);
                StyleModel lineStyles = Styles.Clone();
                lineStyles.Line = Styles.Border.Top.Clone();
                CreateLineRender(pdfPage, renderArea, lineStyles, point1, point2);
            }
            if (Styles.Border.Left.Visible)
            {
                Point point1 = new Point(clientRect.Left, clientRect.Top);
                Point point2 = new Point(clientRect.Left, clientRect.Bottom);
                StyleModel lineStyles = Styles.Clone();
                lineStyles.Line = Styles.Border.Left.Clone();
                CreateLineRender(pdfPage, renderArea, lineStyles, point1, point2);
            }
            if (Styles.Border.Bottom.Visible)
            {
                Point point1 = new Point(clientRect.Left, clientRect.Bottom);
                Point point2 = new Point(clientRect.Right, clientRect.Bottom);
                StyleModel lineStyles = Styles.Clone();
                lineStyles.Line = Styles.Border.Bottom.Clone();
                CreateLineRender(pdfPage, renderArea, lineStyles, point1, point2);
            }
            if (Styles.Border.Right.Visible)
            {
                Point point1 = new Point(clientRect.Right, clientRect.Top);
                Point point2 = new Point(clientRect.Right, clientRect.Bottom);
                StyleModel lineStyles = Styles.Clone();
                lineStyles.Line = Styles.Border.Right.Clone();
                CreateLineRender(pdfPage, renderArea, lineStyles, point1, point2);
            }
        }

        public void CreateLineRender(SanjelPdfPage pdfPage, EnumRenderArea renderArea, StyleModel styles, Point point1, Point point2)
        {
            List<Point> points = new List<Point>{point1, point2};
            double left = Math.Min(point1.X, point2.X);
            double top = Math.Min(point1.Y, point2.Y);
            double width = Styles.Padding.Left + Styles.Padding.Right + 1 + Math.Abs(point1.X - point2.X);
            double height = Styles.Padding.Top + Styles.Padding.Bottom + 1 + Math.Abs(point1.Y - point2.Y);
            ShapeRender render = new ShapeRender(Id, points, styles, left, top, width, height);
            pdfPage.AddRenderObject(render, renderArea);
        }
    }
}
