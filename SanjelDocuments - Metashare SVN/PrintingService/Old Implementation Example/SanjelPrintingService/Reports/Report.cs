
using System.Collections.Generic;
using O2S.Components.PDF4NET;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Reports
{
    public abstract class Report
    {
        public string LayoutFile { get; set; }
        public string StyleFile { get; set; }

        public StyleModel PaperInfo { get; set; }
        public List<ISection> Sections { get; set; }
        public string ConfigurationsPath { get; set; }

        public PDFDocument PdfDoc { get; set; }

        public virtual void BuildReport()
        {
        }
    }
}
