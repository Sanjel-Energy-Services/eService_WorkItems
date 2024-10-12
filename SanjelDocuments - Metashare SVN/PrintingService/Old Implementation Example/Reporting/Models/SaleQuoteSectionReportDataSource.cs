
using System.Data;
using System.Linq;

using Sanjel.Jdt.Domain;
using Sanjel.Jdt.SolutionItems;
using Sanjel.PrintingService;

namespace Sanjel.Jdt.Reporting.Models
{
    public class SaleQuoteSectionReportDataSource : ReportDataSource
    {
        private readonly JobSalesQuote _salesQuote;
        private readonly JobSalesQuoteSection _quoteSection;

        public SaleQuoteSectionReportDataSource(JobSalesQuote quote, JobSalesQuoteSection section, string key = ModelKey.SaleQuote)
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

        private DataTable _quoteSectionTable;

        public DataTable QuoteSectionTable
        {
            get
            {
                if (_quoteSectionTable == null)
                {
                    if (SectionType == SolutionEnums.SectionType.Details)
                    {
                        _quoteSectionTable = new DataTable(TemplateName);
                        _quoteSectionTable.Columns.Add("RowName", typeof(string));
                        _quoteSectionTable.Columns.Add("Code", typeof(string));
                        _quoteSectionTable.Columns.Add("Description", typeof (string));
                        _quoteSectionTable.Columns.Add("SalesQty", typeof (string));
                        _quoteSectionTable.Columns.Add("UnitOfMeasure", typeof (string));
                        _quoteSectionTable.Columns.Add("PrimaryQty", typeof (string));
                        _quoteSectionTable.Columns.Add("SecondaryQty", typeof (string));
                        _quoteSectionTable.Columns.Add("SalesPrice", typeof (string));
                        _quoteSectionTable.Columns.Add("LinePercent", typeof (string));
                        _quoteSectionTable.Columns.Add("LineDisc", typeof (string));
                        _quoteSectionTable.Columns.Add("TotalAmount", typeof (string));

                        foreach (var item in SalesQuoteLineItems)
                        {
                            ProductLineItem product = item as ProductLineItem;
                            if (product != null)
                            {
                                DataRow row = _quoteSectionTable.NewRow();
                                row["RowName"] = "rowPriceItem";
                                row["Code"] = product.PriceBookPricingItem.ItemId.ToString();
                                row["Description"] = product.Description;
                                row["SalesQty"] = product.SalesQty.ToString();
                                row["UnitOfMeasure"] = product.UnitOfMeasure.ToString();
                                row["PrimaryQty"] = product.PrimaryQty.ToString();
                                row["SecondaryQty"] = product.SecondaryQty.ToString();
                                row["SalesPrice"] = product.SalesPrice.ToString();
                                row["LinePercent"] = product.LinePercent.ToString();
                                row["LineDisc"] = product.LineDisc.ToString();
                                row["TotalAmount"] = product.TotalAmount.ToString();
                                _quoteSectionTable.Rows.Add(row);
                            }
                        }
                    }
                    else if (SectionType == SolutionEnums.SectionType.Summary)
                    {
                        _quoteSectionTable = new DataTable(TemplateName);
                        _quoteSectionTable.Columns.Add("RowName", typeof(string));
                        _quoteSectionTable.Columns.Add("Code", typeof(string));
                        _quoteSectionTable.Columns.Add("LineItemDescription", typeof(string));
                        _quoteSectionTable.Columns.Add("ApbAmountText", typeof(string));

                        DataRow row = _quoteSectionTable.NewRow();
                        row["RowName"] = "rowPriceItem";
                        row["Code"] = "";
                        row["LineItemDescription"] = _quoteSection.LineItemDescription;
                        row["ApbAmountText"] = _quoteSection.ApbAmountText;
                        _quoteSectionTable.Rows.Add(row);
                    }
                    else if (SectionType == SolutionEnums.SectionType.SummaryWithDetails)
                    {
                        _quoteSectionTable = new DataTable(TemplateName);
                        _quoteSectionTable.Columns.Add("RowName", typeof(string));
                        _quoteSectionTable.Columns.Add("Code", typeof(string));
                        _quoteSectionTable.Columns.Add("Description", typeof(string));
                        _quoteSectionTable.Columns.Add("SalesQty", typeof(string));
                        _quoteSectionTable.Columns.Add("UnitOfMeasure", typeof(string));
                        _quoteSectionTable.Columns.Add("ApbAmountText", typeof(string));

                        foreach (var item in SalesQuoteLineItems)
                        {
                            ProductLineItem product = item as ProductLineItem;
                            if (product != null)
                            {
                                DataRow row = _quoteSectionTable.NewRow();
                                row["RowName"] = "rowPriceItem";
                                row["Code"] = product.PriceBookPricingItem.ItemId.ToString();
                                row["Description"] = product.Description;
                                row["SalesQty"] = product.SalesQty.ToString();
                                row["UnitOfMeasure"] = product.UnitOfMeasure.ToString();
                                row["ApbAmountText"] = ProductLineItem.ApbAmountText;
                                _quoteSectionTable.Rows.Add(row);
                            }
                        }
                    }
                }
                return _quoteSectionTable;
            }
        }

        public string TemplateName
        {
            get
            {
                switch (SectionType)
                {
                    case SolutionEnums.SectionType.Details:
                        return CompositeUomIncluded ? "BookLessDiscountMultipleUom" : "BookLessDiscountSingleUom";
                    case SolutionEnums.SectionType.Summary:
                        return "AsPerBidSummary";
                    case SolutionEnums.SectionType.SummaryWithDetails:
                        return "AsPerBidDetail";
                }
                return string.Empty;
            }
        }
    }
}
