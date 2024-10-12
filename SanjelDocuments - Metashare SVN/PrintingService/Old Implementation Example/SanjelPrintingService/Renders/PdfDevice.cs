
using System;
using System.Drawing;
using System.Linq;
using System.Collections.Generic;
using System.Windows.Forms;

using O2S.Components.PDF4NET;
using O2S.Components.PDF4NET.Forms;
using O2S.Components.PDF4NET.Graphics;
using O2S.Components.PDF4NET.Graphics.Fonts;
using O2S.Components.PDF4NET.Graphics.Shapes;

using Sanjel.PrintingService.Layouts;
using Sanjel.PrintingService.Reports;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public class PdfDevice
    {
        #region Instance Variables

        private readonly PDFDocument _pdfDoc;
        private readonly List<SanjelPdfPage> _pdfPages;

        #endregion Instance Variables

        #region Instance Properties

        public PDFForm Form
        {
            get { return _pdfDoc.Form; }
        }

        public ISection Section { get; set; }

        public StyleModel PaperInfo { get; set; }

        public StyleModel StyleModel
        {
            get { return Section != null ? Section.MainPanel.Styles : null; }
        }

        public double ClientWidth{ get { return StyleModel != null ? StyleModel.Width : _pdfDoc.PageWidth; } }

        public double ClientHeight { get { return StyleModel != null ? StyleModel.Height : _pdfDoc.PageHeight; } }

        public Frame PageHeader { get { return Section != null ? Section.PageHeader : null; } }

        public Frame PageFooter { get { return Section != null ? Section.PageFooter : null; } }

        public SanjelPdfPage CurrentPage
        {
            get
            {
                if (_pdfPages.Count == 0)
                {
                    AddNewPage();
                }
                return _pdfPages[_pdfPages.Count - 1];
            }
        }

        public SanjelPdfPage GetPage(int index)
        {
            return (index < _pdfPages.Count) ? _pdfPages[index] : null;
        }

        public int PageCount { get { return _pdfPages.Count; } }

        public int FlushedPageCount { get { return _pdfDoc.Pages.Count; } }

        #endregion Instance Properties

        #region Constructor

        public PdfDevice(StyleModel paperInfo)
        {
            _pdfPages = new List<SanjelPdfPage>();
            _pdfDoc = CreateNewDoc();
            PaperInfo = paperInfo;
            ConfigurePageNumber();
        }

        public PdfDevice(string sourceFileName)
        {
            _pdfDoc = CreateNewDoc(sourceFileName);
        }

        #endregion Constructor

        #region Static Methods

        public static PDFDocument CreateNewDoc(string filePath = null)
        {
            try
            {
                PDFDocument doc = string.IsNullOrEmpty(filePath) ? new PDFDocument() : new PDFDocument(filePath);
                doc.SerialNumber = "PDF4NET-8J6PH-19RQP-9RN8W-7CCKX-O0QB2";
                doc.PageOrientation = PDFPageOrientation.Portrait;
                return doc;
            }
            catch (Exception)
            {
                throw new Exception("Cannot load the PDF file, " + filePath);
            }
        }

        #endregion Static Methods

        #region Public Methods

        public PDFDocument PdfDoc
        {
            get { return _pdfDoc; }
        }

        public void Output(string filePath)
        {
            // Save the document to disk
            try
            {
                _pdfDoc.Save(filePath);
            }
            catch (Exception)
            {
                MessageBox.Show("Cannot save the file: " + filePath);
            }
        }
        
        public SanjelPdfPage AddNewPage(bool blank = false)
        {
            SanjelPdfPage page = new SanjelPdfPage(this, blank);
            _pdfPages.Add(page);
            if (!blank)
            {
                page.DrawHeaderAndFooter(this);
            }
            //DrawWatermark1(page);
            return page;
        }

        public void InsertNewPage(PDFPage page, int index)
        {
            _pdfDoc.Pages.Insert(index, page);
        }

        public void SetBookMarks(List<SanjelPdfBookmark> bookmarks)
        {
            foreach (SanjelPdfBookmark bookmark in bookmarks)
            {
                _pdfDoc.Bookmarks.Add(bookmark);
            }
        }

        public IEnumerable<SanjelPdfPage> PagesBySection(ISection section)
        {
            return _pdfPages.Where(a => string.Compare(a.Section.MainPanel.Id, section.MainPanel.Id, StringComparison.OrdinalIgnoreCase) == 0);
        }

        public void FlushOneBlankPage()
        {
            SanjelPdfPage page = new SanjelPdfPage(this, true);
            _pdfDoc.Pages.Add(page);
        }

        public void FlushPage(ISection section)
        {
            IEnumerable<SanjelPdfPage> pages = PagesBySection(section);
            foreach (SanjelPdfPage page in pages)
            {
                _pdfDoc.Pages.Add(page);
                page.FlushPage();
            }
        }

        #endregion Public Methods

        #region Private Methods

        private void ConfigurePageNumber()
        {
            PDFPageNumberingRange numberingRange = new PDFPageNumberingRange
                                                       {
                                                           NumberingStyle = PDFNumberingStyle.Arabic,
                                                           StartPageIndex = 1,
                                                           StartPageNumber = 1
                                                       };
            _pdfDoc.PageNumberingRanges.Add(numberingRange);

            PDFPageNumber pageNumber = new PDFPageNumber
                                           {
                                               Font = PdfUtilities.TrueTypeFont(PaperInfo.TextFont),
                                               Brush = new PDFBrush(new PDFRgbColor(PaperInfo.TextFormat.Color)),
                                               Align = PdfUtilities.TextAlignment(PaperInfo.TextFormat.GetAlignment())
                                           };
            _pdfDoc.PageNumber = pageNumber;
        }

        private void DrawWatermark1(PDFPage page)
        {
            page.Canvas.SetTransparency(80);

            float width = (float)(page.Width / 2.0);
            float height = (float)(page.Height / 2.0);

            TrueTypeFont watermarkFont = new TrueTypeFont(new Font("Arial", 120), true);
            PDFBrush brush = new PDFBrush(new PDFRgbColor(0, 0, 200));
            PDFPen pen = new PDFPen(new PDFRgbColor(200, 100, 0));
            PDFTextFormatOptions options = new PDFTextFormatOptions
                                               {Orientation = 45, Align = PDFTextAlign.MiddleCenter};
            PointF origin = RotatePoint(65, new PointF(-width, height));
            float newWidth = origin.X + width;
            float newHeight = origin.Y + height;
            page.Canvas.DrawTextBox("Watermark", watermarkFont, pen, brush, newWidth, newHeight, page.Width, page.Height, options);

            page.Canvas.SetTransparency(0);
        }

        private void DrawWatermark2(PDFPage page)
        {
            PDFImage image = new PDFImage(".\\Watermark_Background.png");

            page.Canvas.SetTransparency(90);

            page.Canvas.DrawImage(image, 0, 0, page.Width, page.Height);

            page.Canvas.SetTransparency(0);
        }

        private void DrawWatermark3(PDFPage page)
        {
            page.Canvas.SetTransparency(70);

            PDFHatchBrush hatch = new PDFHatchBrush(PDFHatchType.Cross)
                                      {
                                          HatchBackColor = new PDFRgbColor(220, 220, 200),
                                          HatchForeColor = new PDFRgbColor(150, 150, 250),
                                          HatchHorizontalSize = 30,
                                          HatchVerticalSize = 30
                                      };
            RectangleF rectangle = new RectangleF(0, 0, (float)(page.Width), (float)(page.Height));
            page.Canvas.DrawRectangle(null, hatch, rectangle);

            page.Canvas.SetTransparency(0);
        }

        private static PointF RotatePoint(double angle, PointF pt)
        {
            double rotate = angle * Math.PI / 180.0;
            double cosa = Math.Cos(rotate);
            double sina = Math.Sin(rotate);
            return new PointF((float)(pt.X * cosa - pt.Y * sina), (float)(pt.X * sina + pt.Y * cosa));
        }

        #endregion Private Methods
    }
}
