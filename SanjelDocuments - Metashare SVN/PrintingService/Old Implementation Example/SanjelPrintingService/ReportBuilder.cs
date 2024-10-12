
using O2S.Components.PDF4NET;
using Sanjel.PrintingService.CSS.Interpreter;
using Sanjel.PrintingService.Reports;

namespace Sanjel.PrintingService
{
    public class ReportBuilder
    {
        public Report ReportData { get; set; }

        public PDFDocument PdfDoc
        {
            get { return ReportData.PdfDoc; }
        }

        public ReportBuilder(Report report)
        {
            ReportData = report;
        }

        public void BuildReport()
        {
            RegisterInterpreters.RegisterAll(InterpreterFactory.Instance);
            RegisterDisassemblers.RegisterAll(DisassemblerFactory.Instance);

            ReportData.BuildReport();
        }
    }
}
