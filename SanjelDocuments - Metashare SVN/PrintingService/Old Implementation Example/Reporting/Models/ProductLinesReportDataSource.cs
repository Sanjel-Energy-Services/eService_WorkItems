
using System.Collections.Generic;
using System.Linq;

using Sanjel.Jdt.Domain;
using Sanjel.Jdt.SolutionItems;
using Sanjel.PrintingService;

namespace Sanjel.Jdt.Reporting.Models
{
    public class ProductLinesReportDataSource : ReportDataSource
    {
        private readonly JobSalesQuote _salesQuote;
        private readonly JobSalesQuoteSection _quoteSection;

        public ProductLinesReportDataSource(JobSalesQuote quote, JobSalesQuoteSection section, string key = ModelKey.SaleQuote)
            : base(key)
        {
            _salesQuote = quote;
            _quoteSection = section;
        }

        public string SectionHeader
        {
            get { return _quoteSection.Header; }
        }

        public SolutionEnums.SectionType SectionType
        {
            get { return _quoteSection.Type; }
        }

        public decimal SectionTotal
        {
            get
            {
                return _quoteSection.Type == SolutionEnums.SectionType.Details ?
                    (from element in _quoteSection.SalesQuoteLineItems select element.TotalAmount).Sum() : _quoteSection.BidAmount;
            }
        }

        public decimal SectionMultipleTotal
        {
            get
            {
                decimal total;
                if (_quoteSection.Type == SolutionEnums.SectionType.Details)
                {
                    total = (from element in _quoteSection.SalesQuoteLineItems select element.TotalAmount).Sum() * NumOfJobShifts;
                }
                else
                {
                    total = _quoteSection.BidAmount * NumOfJobShifts;
                }
                return total;
            }
        }

        public int NumOfJobShifts
        {
            get { return _salesQuote.NumOfJobShifts ?? 1; }
        }

        public string SingleTotalsTitle
        {
            get
            {
                if (NumOfJobShifts < 2)
                {
                    return string.Format("Total {0}", _quoteSection.Header);
                }
                return "Total Per Shift";
            }
        }

        public string MultiplesTotalTitle
        {
            get
            {
                if (NumOfJobShifts < 2)
                {
                    return string.Empty;
                }
                return string.Format("Total {0} ({1} shifts)", _quoteSection.Header, NumOfJobShifts);
            }
        }

        public decimal BidAmount
        {
            get { return _quoteSection.BidAmount; }
        }

        public bool CompositeUomIncluded
        {
            get { return _quoteSection.SalesQuoteLineItems.Any(a => a.UnitOfMeasure.IsCompositeUnit); }
        }

        public JobSalesQuoteLineItemCollection SalesQuoteLineItems 
        {
            get { return _quoteSection.SalesQuoteLineItems; }
        }
    }
}
