
using System.Linq;
using System.Collections.Generic;

using Sanjel.PrintingService.Layouts;
using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Reports
{
    public class TocSection : ISection
    {
        public Panel MainPanel { get; set; }
        public Frame FrontSeparator { get; set; }
        public Frame PageHeader { get; set; }
        public Frame PageFooter { get; set; }
        public StyleModel PaperInfo { get; set; }

        public string Id { get; set; }
        public bool FromNewPaper { get; set; }

        public IModel Model
        {
            get { return TableModel; }
            set { TableModel = value as TocModel; }
        }
        public TocModel TableModel;
        public List<SanjelPdfBookmark> Bookmarks { get; set; }
        public PageNumberModel NumberModel { get; set; }

        public object GetPropertyValue(string propertyPath)
        {
            return null;
        }
        public void AddBookmark(SanjelPdfBookmark bookmark) { }

        public TocSection(string id)
        {
            Id = id;
            FromNewPaper = true;
        }

        public void SetupSection()
        {
            double clientWidth = PaperInfo.Width - PaperInfo.Margin.Left - PaperInfo.Margin.Right;
            double clientHeight = PaperInfo.Height - PaperInfo.Margin.Top - PaperInfo.Margin.Bottom;
            double clientTop = PaperInfo.Margin.Top;
            double clientLeft = PaperInfo.Margin.Left;
            if (PageHeader != null)
            {
                PageHeader.InitializeRect();
                PageHeader.Width = LayoutUtilities.LimitChildValue(clientWidth, PageHeader.Width);
                PageHeader.OriginX = PaperInfo.Margin.Left;
                PageHeader.OriginY = (PageHeader.Styles).Margin.Top;

                double newTop = PageHeader.Height + PageHeader.OriginY;
                if (newTop > PaperInfo.Margin.Top)
                {
                    clientTop = newTop;
                    clientHeight = PaperInfo.Height - newTop - PaperInfo.Margin.Bottom;
                }
            }
            if (PageFooter != null)
            {
                PageFooter.InitializeRect();
                PageFooter.Width = LayoutUtilities.LimitChildValue(clientWidth, PageFooter.Width);
                PageFooter.OriginX = PaperInfo.Margin.Left;
                PageFooter.OriginY = PaperInfo.Height - PageFooter.Height - (PageFooter.Styles).Margin.Bottom;

                double oldBottom = PaperInfo.Height - PaperInfo.Margin.Bottom;
                if (oldBottom < PaperInfo.Margin.Top)
                {
                    clientHeight = PageFooter.OriginY - clientTop;
                }
            }

            MainPanel.OriginX = clientLeft;
            MainPanel.OriginY = clientTop;
            MainPanel.Width = clientWidth;
            MainPanel.Height = clientHeight;
        }

        public void DrawSection(PdfDevice device)
        {
            TableModel.CreateDataSet();
            foreach (TocGridControl control in MainPanel.Frames.OfType<TocGridControl>().Select(frame => frame))
            {
                control.Model = Model;
            }

            device.Section = this;
            device.AddNewPage();

            MainPanel.BuildRenderObject(device, EnumRenderArea.Client);
        }

        public void SetCurrentReportDataSource(ReportDataSource source) { }
    }
}
