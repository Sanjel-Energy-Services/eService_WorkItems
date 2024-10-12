
using System.Collections.Generic;

using Sanjel.PrintingService.Layouts;
using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Reports
{
    public interface ISection
    {
        string Id { get; set; }
        bool FromNewPaper { get; set; }
        IModel Model { get; set; }
        Panel MainPanel { get; set; }
        Frame FrontSeparator { get; set; }
        Frame PageHeader { get; set; }
        Frame PageFooter { get; set; }
        StyleModel PaperInfo { get; set; }
        PageNumberModel NumberModel { get; set; }
        List<SanjelPdfBookmark> Bookmarks { get; set; }

        object GetPropertyValue(string propertyPath);
        void SetupSection();
        void DrawSection(PdfDevice device);
        void AddBookmark(SanjelPdfBookmark bookmark);
        void SetCurrentReportDataSource(ReportDataSource source);
    }
}
