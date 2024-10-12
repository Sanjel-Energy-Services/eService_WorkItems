
using System.Windows;

using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Layouts
{
    public class VerticalTextFieldControl : Control
    {
        #region Instance Variables

        private TextFieldModel _model;

        #endregion Instance Variables

        #region Instance Properties

        public override IModel Model
        {
            get { return _model; }
            set { _model = value as TextFieldModel; }
        }

        #endregion Instance Properties

        #region Constructors

        public VerticalTextFieldControl(string id)
            : base(id)
        {
        }

        #endregion Constructors

        #region Public Methods

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            Render render = BuildRenderObject(device.CurrentPage, device.Section.Model);
            if (!device.CurrentPage.IsContentFitCurrentPage(render, renderArea))
            {
                device.AddNewPage();
                OriginY = device.CurrentPage.GetClientRect(renderArea).Top;
                render = BuildRenderObject(device.CurrentPage, device.Section.Model);
            }
            device.CurrentPage.AddRenderObject(render, renderArea);
        }

        public Render BuildRenderObject(SanjelPdfPage pdfPage, IModel model)
        {
            Rect clientRect = GetFrameRect();
            _model.Parent = model;

            VerticalTextRender render = new VerticalTextRender(Id, _model.GetText(), Styles, clientRect.Left, clientRect.Top, clientRect.Width, 0);
            render.Height = render.ComputeRenderHeight(pdfPage);

            Height = render.Height + Styles.Padding.Top + Styles.Padding.Bottom;
            return render;
        }

        public Size ComputeContentSize(SanjelPdfPage pdfPage, IModel model)
        {
            _model.Parent = model;
            string text = _model.GetText();
            if (string.IsNullOrEmpty(text))
            {
                return new Size(0, 0);
            }
            return VerticalTextRender.EstimateRenderSize(pdfPage, text, Styles, Width);
        }

        #endregion Public Methods
    }
}
