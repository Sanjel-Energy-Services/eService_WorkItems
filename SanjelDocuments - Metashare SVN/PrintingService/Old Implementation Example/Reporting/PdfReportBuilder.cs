
using System.IO;

using Sanjel.Jdt.Domain;
using Sanjel.PrintingService;

namespace Sanjel.Jdt.Reporting
{
    public class PdfReportBuilder
    {
        public static FileInfo BuildPdfReport(JobDesign jobDesign, string outputFile)
        {
            JobDesignReportDataSource jobDesignDataSource = new JobDesignReportDataSource(jobDesign);

            DataReport report = new DataReport(jobDesignDataSource, ReportUtilities.ReportingConfigurationPath,
                ReportUtilities.PricingPageLayoutFilePath, ReportUtilities.PricingPageStyleFilePath, outputFile);
            ReportBuilder builder = new ReportBuilder(report);
            builder.BuildReport();

            return new FileInfo(report.OutputFilePath);
        }
    }
}
