
using O2S.Components.PDF4NET;
using O2S.Components.PDF4NET.Actions;
using O2S.Components.PDF4NET.Graphics;

namespace Sanjel.PrintingService.Renders
{
    public class SanjelPdfBookmark : PDFBookmark
    {
        public int PageNumber { get; set; }
        public SanjelPdfPage HostPage { get; set; }

        public SanjelPdfBookmark(string title)
        {
            PDFRgbColor bookmarkColor = new PDFRgbColor(System.Drawing.Color.Black);
            const PDFBookmarkDisplayStyle displayStyle = PDFBookmarkDisplayStyle.Regular;
            Title = title;
            Color = bookmarkColor;
            DisplayStyle = displayStyle;
        }

        public void UpdateHostPage(SanjelPdfPage hostPage)
        {
            HostPage = hostPage;
            PDFGoToAction gotoAction = new PDFGoToAction
                                           {
                                               Destination = new PDFPageDestination {Page = hostPage}
                                           };
            Action = gotoAction;
        }

        public void UpdatePageNumber(PdfDevice pdfDevice)
        {
            for (int index = 0; index < pdfDevice.PageCount; index++)
            {
                SanjelPdfPage page = pdfDevice.GetPage(index);
                if (page.Id.Equals(HostPage.Id))
                {
                    PageNumber = page.PageNumber;
                    break;
                }
            }
        }
    }
}
