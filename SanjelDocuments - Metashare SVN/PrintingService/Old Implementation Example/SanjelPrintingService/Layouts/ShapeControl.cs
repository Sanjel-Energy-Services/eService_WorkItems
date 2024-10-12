
using System.Windows;
using System.Collections.Generic;

using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Layouts
{
    public class ShapeControl : Control
    {
        #region Constructors

        public ShapeControl(string id)
            : base(id)
        {
        }

        #endregion Constructors

        #region Public Methods

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            Rect clientRect = GetClientRect();
            SanjelPdfPage pdfPage = device.CurrentPage;
            List<Point> points = new List<Point>
                                     {
                                         new Point(clientRect.Left, clientRect.Top ),
                                         new Point(clientRect.Right, clientRect.Top)
                                     };

            Height = Styles.Line.Width + Styles.Padding.Bottom;
            ShapeRender render = new ShapeRender(Id, points, Styles, clientRect.Left, clientRect.Top, clientRect.Width, Height);
            pdfPage.AddRenderObject(render, renderArea);
        }

        #endregion Public Methods
    }
}
