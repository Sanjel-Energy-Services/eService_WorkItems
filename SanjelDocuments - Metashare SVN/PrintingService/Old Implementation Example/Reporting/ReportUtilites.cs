
using System.IO;
using Sanjel.Jdt.SolutionItems;

namespace Sanjel.Jdt.Reporting
{
    static public class ModelKey
    {
        public const string JobDesign = "CurrentJob";
        public const string Fluids = "Fluids";
        public const string SaleQuote = "SaleQuote";
        public const string CommonData = "CommonData";
    }

    static public class ReportUtilities
    {
        public static string ReportingConfigurationPath
        {
            get { return ApplicationConfiguration.FileDirectory; }
        }

        public static string PricingPageLayoutFilePath
        {
            get { return Path.Combine(ReportingConfigurationPath, ApplicationConfiguration.Instance.PricingPageLayoutFileName); }
        }

        public static string OverviewPageLayoutFilePath
        {
            get { return Path.Combine(ReportingConfigurationPath, ApplicationConfiguration.Instance.OverviewPageLayoutFileName); }
        }

        public static string CoverPageLayoutFilePath
        {
            get { return Path.Combine(ReportingConfigurationPath, ApplicationConfiguration.Instance.CoverPageLayoutFileName); }
        }

        public static string PricingPageStyleFilePath
        {
            get { return Path.Combine(ReportingConfigurationPath, ApplicationConfiguration.Instance.PricingPageStyleFileName); }
        }

        public static string OverviewPageStyleFilePath
        {
            get { return Path.Combine(ReportingConfigurationPath, ApplicationConfiguration.Instance.OverviewPageStyleFileName); }
        }

        public static string CoverPageTemplateFilePath
        {
            get { return Path.Combine(ReportingConfigurationPath, ApplicationConfiguration.Instance.CoverPageTemplateName); }
        }
    }
}
