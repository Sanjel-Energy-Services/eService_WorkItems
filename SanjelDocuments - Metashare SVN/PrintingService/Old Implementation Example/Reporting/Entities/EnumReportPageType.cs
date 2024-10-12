using System.Collections.Generic;

namespace Sanjel.Jdt.PDFGeneration
{
    public enum EnumReportPageType
    {
        CoverPage,
        OverviewPage,
        JobProcedurePage,
        PricingPage,
        TermConditionPage,
        SentToCustomer
    }

    public class ProposalPageTypeUtilities
    {
        public static List<EnumReportPageType> BuildDefaultList()
        {
            List<EnumReportPageType> pageTypeList = new List<EnumReportPageType>
            {
                EnumReportPageType.CoverPage,
                EnumReportPageType.OverviewPage,
                EnumReportPageType.JobProcedurePage,
                EnumReportPageType.PricingPage,
                EnumReportPageType.TermConditionPage,
                EnumReportPageType.SentToCustomer,
            };
            return pageTypeList;
        }
    }
}
