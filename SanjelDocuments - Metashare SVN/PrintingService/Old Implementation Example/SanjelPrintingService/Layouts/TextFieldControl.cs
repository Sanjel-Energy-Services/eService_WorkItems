
using System.Windows;

using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Layouts
{
    public class TextFieldControl : Control
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

        public TextFieldControl(string id)
            : base(id)
        {
        }

        #endregion Constructors

        #region Public Methods

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            _model.Parent = device.Section.Model;
            string text = _model.GetText();
            Size size = ComputeContentSize(device.CurrentPage, text);
            Rect rect = new Rect(OriginX, OriginY, size.Width, size.Height);
            if (renderArea == EnumRenderArea.Client && !device.CurrentPage.IsContentFitCurrentPage(rect, renderArea))
            {
                Rect rectAvailable = device.CurrentPage.GetAvailablePlotRect(OriginX, Width, renderArea);
                rect.Height = rectAvailable.Height - device.CurrentPage.Margin.Bottom - Styles.Margin.Top - Styles.Padding.Top;
                var font = FontFactory.Instance.GetTrueTypeFont(Styles.TextFont);
                int lastChar = device.CurrentPage.Canvas.FitText(text, font, Width, rect.Height);
                Render render1 = BuildRenderObject(device.CurrentPage, text.Substring(0, lastChar));
                device.CurrentPage.AddRenderObject(render1, renderArea);

                text = text.Substring(lastChar).Trim();
                if (text.Length > 0)
                {
                    device.AddNewPage();
                    if (groupFrame != null && groupFrame is ControlGroup)
                    {
                        groupFrame.OriginY = device.CurrentPage.GetClientRect(renderArea).Top;
                        ((ControlGroup) groupFrame).DrawHeader(device, renderArea);
                    }
                    rectAvailable = device.CurrentPage.GetAvailablePlotRect(OriginX, Width, renderArea);
                    OriginY = rectAvailable.Top;
                    Render render2 = BuildRenderObject(device.CurrentPage, text);
                    device.CurrentPage.AddRenderObject(render2, renderArea);
                }
            }
            else
            {
                Render render = BuildRenderObject(device.CurrentPage, _model.GetText());
                device.CurrentPage.AddRenderObject(render, renderArea);
            }
        }

        public Render BuildRenderObject(SanjelPdfPage pdfPage, string text)
        {
            Rect clientRect = GetClientRect();
            TextRender render = new TextRender(Id, text, Styles, clientRect.Left, clientRect.Top, clientRect.Width, 0);
            render.Height = render.ComputeRenderHeight(pdfPage);

            Height = render.Height + Styles.Padding.Top + Styles.Padding.Bottom;
            return render;
        }

        public Size ComputeContentSize(SanjelPdfPage pdfPage, string text)
        {
            if (string.IsNullOrEmpty(text))
            {
                return new Size(0, 0);
            }
            return TextRender.EstimateRenderSize(pdfPage, text, Styles, Width);
        }

        #endregion Public Methods
    }
}
