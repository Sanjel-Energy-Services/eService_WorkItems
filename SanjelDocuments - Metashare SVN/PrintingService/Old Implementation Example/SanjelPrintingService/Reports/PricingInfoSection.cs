
using System;
using System.Linq;
using System.Reflection;
using System.Collections.Generic;

using Sanjel.Common.Domain.PriceBook;

using Sanjel.PrintingService.Layouts;
using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Reports
{
    public class PricingInfoSection : ISection
    {
        public string Id { get; set; }
        public bool FromNewPaper { get; set; }

        public Panel MainPanel { get; set; }
        public Frame FrontSeparator { get; set; }
        public Frame PageHeader { get; set; }
        public Frame PageFooter { get; set; }

        public StyleModel PaperInfo { get; set; }

        public IModel Model
        {
            get { return BookModel; }
            set { BookModel = value as PriceBookModel; }
        }
        public PriceBookModel BookModel;
        public PageNumberModel NumberModel { get; set; }

        public List<SanjelPdfBookmark> Bookmarks { get; set; }

        public PricingInfoSection(string id)
        {
            Id = id;
            FromNewPaper = true;
            Bookmarks = new List<SanjelPdfBookmark>();
        }

        public object GetPropertyValue(string propertyPath)
        {
            return GetPropertyValueByPath(BookModel, propertyPath);
        }

        public void SetupSection()
        {
            double clientWidth = PaperInfo.Width - PaperInfo.Margin.Left - PaperInfo.Margin.Right;
            double clientHeight = PaperInfo.Height - PaperInfo.Margin.Top - PaperInfo.Margin.Bottom;
            double clientTop = PaperInfo.Margin.Top;
            double clientLeft = PaperInfo.Margin.Left;
            if (FrontSeparator != null)
            {
                FrontSeparator.OriginX = clientLeft;
                FrontSeparator.OriginY = clientTop;
                FrontSeparator.Width = clientWidth;
                FrontSeparator.Height = clientHeight;
            }
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

            foreach (PricingInfoGridControl control in MainPanel.Frames.OfType<PricingInfoGridControl>().Select(frame => frame))
            {
                control.Model = BookModel;
            }
        }

        public void DrawSection(PdfDevice device)
        {
            device.Section = this;
            foreach (PriceCategory serviceCategory in BookModel.ServiceCategories)
            {
                if (!BookModel.CreateDataSet(serviceCategory.Id)) continue;

                IEnumerable<SanjelPdfPage> pages = device.PagesBySection(this);
                int count = pages.ToList().Count;
                if (count % 2 != 0)
                {
                    device.AddNewPage(true);
                }

                if (FrontSeparator != null)
                {
                    device.AddNewPage(true);
                    FrontSeparator.BuildRenderObject(device, EnumRenderArea.Client);
                    device.AddNewPage(true);
                }

                device.AddNewPage();

                SanjelPdfBookmark bookmark = new SanjelPdfBookmark(serviceCategory.Description);
                bookmark.UpdateHostPage(device.CurrentPage);
                Bookmarks.Add(bookmark);

                MainPanel.BuildRenderObject(device, EnumRenderArea.Client);
            }
        }

        public void AddBookmark(SanjelPdfBookmark bookmark)
        {
            if (Bookmarks.Count > 0)
            {
                SanjelPdfBookmark currentRoot = Bookmarks[Bookmarks.Count - 1];
                if (!currentRoot.Bookmarks.Any(a => string.Compare(a.Title, bookmark.Title, StringComparison.OrdinalIgnoreCase) == 0))
                {
                    currentRoot.Bookmarks.Add(bookmark);
                }
            }
        }

        public static object GetPropertyValueByPath(object source, string propertyPath)
        {
            if (source != null && !string.IsNullOrEmpty(propertyPath))
            {
                PropertyInfo propertyInfo = null;
                Type type = source.GetType();
                object currentSource = source;
                object lastSource = source;
                foreach (string propertyName in propertyPath.Split('.'))
                {
                    propertyInfo = type.GetProperty(propertyName);
                    if (propertyInfo == null)
                    {
                        break;
                    }

                    lastSource = currentSource;
                    currentSource = propertyInfo.GetValue(currentSource, null);
                    type = propertyInfo.PropertyType;
                }

                if (propertyInfo != null)
                {
                    return propertyInfo.GetValue(lastSource, null);
                }
            }
            return null;
        }

        public void SetCurrentReportDataSource(ReportDataSource source) { }
    }
}