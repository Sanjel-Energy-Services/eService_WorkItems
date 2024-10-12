
using System;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Collections.Generic;
using O2S.Components.PDF4NET;
using Sanjel.PrintingService.JDT;
using Sanjel.PrintingService.Layouts;
using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Reports;

namespace Sanjel.PrintingService
{
    public class DataReport : Report
    {
        private readonly ReportDataSource _reportModel;

        public string OutputFilePath { get; set; }

        public DataReport(ReportDataSource reportModel, string resourcePath, string xmlFile, string cssFile, string outputFile)
        {
            _reportModel = reportModel;
            ConfigurationsPath = resourcePath;
            LayoutFile = xmlFile;
            StyleFile = cssFile;
            OutputFilePath = outputFile;

            Sections = new List<ISection>();
        }

        public override void BuildReport()
        {
            try
            {
                ReportLayoutBuilder builder = new ReportLayoutBuilder(this);
                builder.BuildReportLayout();

                SetupSection();

                PdfDevice device = new PdfDevice(PaperInfo);
                PdfDoc = device.PdfDoc;
                DrawSection(device);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void SetupSection()
        {
            foreach (ISection section in Sections)
            {
                if (section is SectionBase)
                {
                    ((SectionBase)section).SetupDataSource(_reportModel);
                }
                section.PaperInfo = PaperInfo;
                section.SetupSection();
            }
        }

        public void DrawSection(PdfDevice device)
        {
            List<SanjelPdfBookmark> bookmarks = new List<SanjelPdfBookmark>();
            TocSection tocSection = null;
            foreach (ISection section in Sections)
            {
                if (section is TocSection)
                {
                    tocSection = section as TocSection;
                    continue;
                }
                section.DrawSection(device);
                bookmarks.AddRange(section.Bookmarks);
            }

            if (tocSection != null)
            {
                foreach (SanjelPdfBookmark bookmark in bookmarks)
                {
                    bookmark.UpdatePageNumber(device);
                    foreach (SanjelPdfBookmark header in bookmark.Bookmarks)
                    {
                        header.UpdatePageNumber(device);
                    }
                }
                tocSection.Model = new TocModel(bookmarks);
                tocSection.DrawSection(device);
            }

            device.SetBookMarks(bookmarks);

            foreach (ISection section in Sections)
            {
                if (device.FlushedPageCount % 2 != 0 && section.FromNewPaper)
                {
                    device.FlushOneBlankPage();
                }
                device.FlushPage(section);
            }

            device.Output(OutputFilePath);
            //Process.Start(OutputFilePath);
        }
    }
}
