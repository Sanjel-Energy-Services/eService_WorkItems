
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Windows.Forms;
using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Layouts;
using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Reports
{
    public class PriceBookReport : Report
    {
        #region Instance Variables

        private const string LayoutFilePath = @"PriceBook.xml";
        private const string StyleFilePath = @"PriceBook.css";
        private const string OutputFilePath = @".\PriceBook.pdf";

        private readonly PriceBookModel _bookModel = new PriceBookModel();
        private readonly PrintingOption _printOption = new PrintingOption();

        #endregion Instance Variables

        #region Instance Properties

        #endregion Instance Properties

        #region Constructors

        public PriceBookReport()
        {
            var assembly = Assembly.GetExecutingAssembly();
            ConfigurationsPath = Path.GetDirectoryName(assembly.Location) + "\\Configurations\\";
            LayoutFile = ConfigurationsPath + LayoutFilePath;
            StyleFile = ConfigurationsPath + StyleFilePath;

            Sections = new List<ISection>();
        }

        public PriceBookReport(PriceBookModel model, PrintingOption option)
        {
            _bookModel = model;
            _printOption = option;

            var assembly = Assembly.GetExecutingAssembly();
            ConfigurationsPath = Path.GetDirectoryName(assembly.Location) + "\\Configurations\\";
            LayoutFile = Path.IsPathRooted(option.LayoutFile) ? option.LayoutFile : ConfigurationsPath + option.LayoutFile;
            StyleFile = Path.IsPathRooted(option.StyleFile) ? option.StyleFile : ConfigurationsPath + option.StyleFile;

            Sections = new List<ISection>();
        }

        #endregion Constructors

        public override void BuildReport()
        {
            ReportLayoutBuilder builder = new ReportLayoutBuilder(this);
            builder.BuildReportLayout();

            SetupSection();

            PdfDevice device = new PdfDevice(PaperInfo);
            DrawSection(device);
        }

        public void SetupSection()
        {
            for (int index = Sections.Count - 1; index >= 0; index--)
            {
                if (!_printOption.HasSection(Sections[index].Id))
                {
                    Sections.Remove(Sections[index]);
                }

                if (string.Compare(PrintingOptionFactory.PricingSectionId, Sections[index].Id, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    if (!_printOption.HasSection(PrintingOptionFactory.FrontSeparatorId))
                    {
                        Sections[index].FrontSeparator = null;
                    }
                }
            }

            foreach (ISection section in Sections)
            {
                if (section is PricingInfoSection)
                {
                    var pricingSection = section as PricingInfoSection;
                    pricingSection.BookModel = _bookModel;
                }
                else if (section is PdfSection)
                {
                    var pdfSection = section as PdfSection;
                    pdfSection.Model = _bookModel;
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
            Process.Start(OutputFilePath);
        }
    }
}
