
using System.Collections.Generic;
using System.IO;

using O2S.Components.PDF4NET;

using Sanjel.Jdt.Domain;
using Sanjel.Jdt.PDFGeneration;
using Sanjel.Jdt.SolutionItems;
using Sanjel.PrintingService;
using Sanjel.PrintingService.Renders;

namespace Sanjel.Jdt.Reporting
{
    public class DocumentCombiner
    {
        #region Private Members

        private readonly List<EnumReportPageType> _pageTypeList;
        private readonly JobDesign _jobDesign;

        #endregion

        #region Public Members

        public DocumentCombiner(List<EnumReportPageType> pageTypeList, JobDesign jobDesign)
        {
            _pageTypeList = pageTypeList;

            _jobDesign = jobDesign;
        }

        public FileInfo BuildDocument()
        {
            PDFDocument packageDoc = new PDFDocument();
            packageDoc.SerialNumber = "PDF4NET-8J6PH-19RQP-9RN8W-7CCKX-O0QB2";

            // Cover page -------------------
            if (_pageTypeList.Contains(EnumReportPageType.CoverPage))
            {
                var outputFile = Path.GetRandomFileName() + ".pdf";
                CommonDataReportDataSource jobDesignDataSource = new CommonDataReportDataSource(_jobDesign);
                PdfFormReport report = new PdfFormReport(jobDesignDataSource, ReportUtilities.CoverPageLayoutFilePath, ReportUtilities.CoverPageTemplateFilePath, outputFile);
                ReportBuilder builder = new ReportBuilder(report);
                builder.BuildReport();
                if (builder.PdfDoc != null && builder.PdfDoc.Pages.Count > 0)
                {
                    packageDoc = PdfUtilities.Combine(packageDoc, builder.PdfDoc);
                }
            }

            // Overview Page --------------------
            if (_pageTypeList.Contains(EnumReportPageType.OverviewPage))
            {
                var outputFile = Path.GetRandomFileName() + ".pdf";
                JobDesignReportDataSource jobDesignDataSource = new JobDesignReportDataSource(_jobDesign);
                DataReport report = new DataReport(jobDesignDataSource, ReportUtilities.ReportingConfigurationPath,
                    ReportUtilities.OverviewPageLayoutFilePath, ReportUtilities.OverviewPageStyleFilePath, outputFile);
                ReportBuilder builder = new ReportBuilder(report);
                builder.BuildReport();
                if (builder.PdfDoc != null && builder.PdfDoc.Pages.Count > 0)
                {
                    packageDoc = PdfUtilities.Combine(packageDoc, builder.PdfDoc);
                }
            }

            // Job Procedure Page --------------------
            if (_pageTypeList.Contains(EnumReportPageType.JobProcedurePage))
            {
            }

            // Price Page --------------------
            if (_pageTypeList.Contains(EnumReportPageType.PricingPage))
            {
                var outputFile = Path.GetRandomFileName() + ".pdf";
                JobDesignReportDataSource jobDesignDataSource = new JobDesignReportDataSource(_jobDesign);
                DataReport report = new DataReport(jobDesignDataSource, ReportUtilities.ReportingConfigurationPath,
                    ReportUtilities.PricingPageLayoutFilePath, ReportUtilities.PricingPageStyleFilePath, outputFile);
                ReportBuilder builder = new ReportBuilder(report);
                builder.BuildReport();
                if (builder.PdfDoc != null && builder.PdfDoc.Pages.Count > 0)
                {
                    packageDoc = PdfUtilities.Combine(packageDoc, builder.PdfDoc);
                }
            }

            // Terms and conditions ----------
            if (_pageTypeList.Contains(EnumReportPageType.TermConditionPage))
            {
                PDFDocument doc = null;
                int country = _jobDesign.CommonData.SanjelCompanyId ?? 1;
                if (country == 1)
                {
                    doc = PdfUtilities.LoadFromFile(Path.Combine(ApplicationConfiguration.FileDirectory, ApplicationConfiguration.Instance.CanadianTermsandConditionsFileName));
                }
                else
                {
                    doc = PdfUtilities.LoadFromFile(Path.Combine(ApplicationConfiguration.FileDirectory, ApplicationConfiguration.Instance.UsTermsandConditionsFileName));
                }
                if (doc != null && doc.Pages.Count > 0)
                {
                    packageDoc = PdfUtilities.Combine(packageDoc, doc);
                }
            }

            // Write the whole PDF file to disk ----------
            if (packageDoc.Pages.Count > 0)
            {
                return PdfUtilities.SaveToTemporaryFile(packageDoc);
            }
            return null;
        }

        #endregion
    }
}
