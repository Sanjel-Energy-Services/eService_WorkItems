
using System.Windows;

using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Layouts
{
    public class TextBoxControl : Control
    {
        #region Instance Variables

        private TextBoxModel _model;

        #endregion Instance Variables

        #region Instance Properties

        public override IModel Model
        {
            get { return _model; }
            set { _model = value as TextBoxModel; }
        }

        #endregion Instance Properties

        #region Constructors

        public TextBoxControl(string id)
            : base(id)
        {
        }

        #endregion Constructors

        #region Public Methods

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            Render render = BuildRenderObject(device.CurrentPage, device.Section.Model);
            if (renderArea == EnumRenderArea.Client && !device.CurrentPage.IsContentFitCurrentPage(render, renderArea))
            {
                device.AddNewPage();
                OriginY = device.CurrentPage.GetClientRect(renderArea).Top;
                render = BuildRenderObject(device.CurrentPage, device.Section.Model);
            }
            device.CurrentPage.AddRenderObject(render, renderArea);
        }

        public Render BuildRenderObject(SanjelPdfPage pdfPage, IModel model)
        {
            Rect clientRect = GetClientRect();
            Model.Parent = model;
            HtmlTextRender render = new HtmlTextRender(Id, _model.GetText(), Styles, clientRect.Left, clientRect.Top, clientRect.Width, 0);
            render.Height = render.ComputeRenderHeight(pdfPage);
            Height = render.Height + Styles.Padding.Top + Styles.Padding.Bottom;
            return render;
        }

        #endregion Public Methods
    }
}
