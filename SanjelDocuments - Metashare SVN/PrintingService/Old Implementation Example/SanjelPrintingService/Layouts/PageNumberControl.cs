
using System.Windows;

using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Layouts
{
    public class PageNumberControl : Control
    {
        #region Instance Variables

        private PageNumberModel _model;

        #endregion Instance Variables

        #region Instance Properties

        public override IModel Model
        {
            get { return _model; }
            set { _model = value as PageNumberModel; }
        }

        #endregion Instance Properties

        public PageNumberControl(string id)
            : base(id)
        {
        }

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            if (_model == null) return;
            SanjelPdfPage pdfPage = device.CurrentPage;
            pdfPage.PageNumber = _model.GetCurrentNumber();
            Rect clientRect = GetClientRect();
            TextRender render = new TextRender(Id, _model.GetAndPlusPageNumberString(), Styles, clientRect.Left, clientRect.Top, clientRect.Width, 0);
            render.Height = render.ComputeRenderHeight(pdfPage);
            pdfPage.AddRenderObject(render, renderArea);
            Height = render.Height + Styles.Padding.Top + Styles.Padding.Bottom;
        }
    }
}
