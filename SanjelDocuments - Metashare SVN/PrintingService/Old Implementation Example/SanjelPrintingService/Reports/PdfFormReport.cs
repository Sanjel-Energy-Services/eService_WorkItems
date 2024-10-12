
using System;
using System.Diagnostics;
using System.Collections.Generic;

using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Reports;

namespace Sanjel.PrintingService
{
    public class PdfFormReport : Report
    {
        private readonly ReportDataSource _reportModel;

        public string OutputFilePath { get; set; }
        private readonly string _pdfFormFile;

        public PdfFormReport(ReportDataSource reportModel, string xmlFile, string pdfFormFile, string outputFile)
        {
            _reportModel = reportModel;
            _pdfFormFile = pdfFormFile;
            LayoutFile = xmlFile;
            OutputFilePath = outputFile;

            Sections = new List<ISection>();
        }

        public override void BuildReport()
        {
            try
            {
                PdfDevice device = new PdfDevice(_pdfFormFile);
                PdfDoc = device.PdfDoc;
                PdfFormPage formPage = new PdfFormPage(_reportModel, LayoutFile);
                formPage.FillInForm(device);

                device.Output(OutputFilePath);
                //Process.Start(OutputFilePath);
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

        private void LoadPdfForm()
        {
            
        }
    }
}
