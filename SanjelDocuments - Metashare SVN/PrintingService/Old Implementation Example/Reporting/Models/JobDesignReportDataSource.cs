
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using Sanjel.Jdt.Domain;
using Sanjel.Jdt.Reporting.Models;
using Sanjel.Jdt.SolutionItems;
using Sanjel.Jdt.PDFGeneration;
using Sanjel.PrintingService;

namespace Sanjel.Jdt.Reporting
{
    public class JobDesignReportDataSource : ReportDataSource
    {
        private readonly JobDesign _jobDesign;
        public const string Bullet = "\u2022";

        public JobDesignReportDataSource(JobDesign design, string key = ModelKey.JobDesign)
            : base(key)
        {
            _jobDesign = design;
        }

        #region Header of Proposal Quote on Pricing Page, & Well Overview Page

        public string CustomerName
        {
            get
            {
                if (_jobDesign != null && _jobDesign.CurrentJob != null && _jobDesign.CurrentJob.SalesQuote != null)
                {
                    return _jobDesign.CurrentJob.SalesQuote.Customer != null
                        ? _jobDesign.CurrentJob.SalesQuote.Customer.Name
                        : "[Customer not selected]";
                }
                return "[Customer not selected]";
            }
        }

        public string JobDescription
        {
            get
            {
                if (_jobDesign != null && _jobDesign.CurrentJob != null)
                {
                    return _jobDesign.CurrentJob.JobDescription;
                }
                return string.Empty;
            }
        }

        public string WellNameAndLocation
        {
            get
            {
                if (_jobDesign != null && _jobDesign.CurrentJob != null && _jobDesign.CurrentJob.SalesQuote != null)
                {
                    return string.Format("{0} {1}", _jobDesign.CurrentJob.SalesQuote.WellName,
                        _jobDesign.CurrentJob.SalesQuote.SurfaceWellLSD);
                }
                return string.Empty;
            }
        }

        public string WellType
        {
            get
            {
                if (_jobDesign != null && _jobDesign.CurrentJob != null && _jobDesign.CurrentJob.SalesQuote != null)
                {
                    return _jobDesign.CurrentJob.SalesQuote.CommonJobData.WellType != null
                        ? _jobDesign.CurrentJob.SalesQuote.CommonJobData.WellType.Name
                        : string.Empty;
                }
                return string.Empty;
            }
        }

        #endregion

        #region Formation Data on Well Overview Page

        private List<NameValuePair> _formationList;
        public List<NameValuePair> FormationList
        {
            get { return _formationList ?? (_formationList = BuildFormationList()); }
        }
        private List<NameValuePair> BuildFormationList()
        {
            List<NameValuePair> list = new List<NameValuePair>();
            if (_jobDesign != null && _jobDesign.Bore != null)
            {
                WellBore wellBore = _jobDesign.Bore;
                const char degree = (char) 176;
                SolutionEnums.MeasurementUnitType unitType = ApplicationConfiguration.Instance.MeasurementUnit;
                string gradientUnits = (unitType == SolutionEnums.MeasurementUnitType.Imperial)
                    ? degree + "F/100 ft"
                    : degree + "C/100 m";
                string temperatureUnits = (unitType == SolutionEnums.MeasurementUnitType.Imperial)
                    ? degree + "F"
                    : degree + "C";
                string pressureUnits = (unitType == SolutionEnums.MeasurementUnitType.Imperial) ? "psi" : "MPa";
                string lengthUnits = (unitType == SolutionEnums.MeasurementUnitType.Imperial) ? "ft" : "m";

                list.Add(new NameValuePair()
                {
                    Name = "Thermal Gradient",
                    Value = wellBore.MetricThermalGradient.ToString("N2"),
                    Unit = gradientUnits
                });
                list.Add(new NameValuePair()
                {
                    Name = "Bottom Hole Static Temperature",
                    Value = wellBore.BHST.ToString("N0"),
                    Unit = temperatureUnits
                });
                list.Add(new NameValuePair()
                {
                    Name = "Bottom Hole Circulating Temperature",
                    Value = wellBore.BHCT.ToString("N0"),
                    Unit = temperatureUnits
                });
                list.Add(new NameValuePair() {Name = "Bottom Hole Pressure", Value = "X", Unit = pressureUnits});
                list.Add(new NameValuePair()
                {
                    Name = "Fracture Gradient",
                    Value = "X",
                    Unit = pressureUnits + "/" + lengthUnits
                });
            }
            return list;
        }

        private DataTable _formationTableLeft;
        public DataTable FormationTableLeft
        {
            get
            {
                if (_formationTableLeft == null && FormationList != null)
                {
                    _formationTableLeft = new DataTable("");
                    _formationTableLeft.Columns.Add("RowName", typeof(string));
                    _formationTableLeft.Columns.Add("Name", typeof(string));
                    _formationTableLeft.Columns.Add("Value", typeof(string));
                    _formationTableLeft.Columns.Add("Unit", typeof(string));

                    int count = FormationList.Count;
                    count = count - (int)(count/2);

                    for (int index = 0; index < count; index++)
                    {
                        NameValuePair pair = FormationList[index];
                        if (pair != null)
                        {
                            DataRow row = _formationTableLeft.NewRow();
                            row["RowName"] = "rowPriceItem";
                            row["Name"] = pair.Name;
                            row["Value"] = pair.Value;
                            row["Unit"] = pair.Unit;
                            _formationTableLeft.Rows.Add(row);
                        }
                    }
                }
                return _formationTableLeft;
            }
        }

        private DataTable _formationTableRight;
        public DataTable FormationTableRight
        {
            get
            {
                if (_formationTableRight == null && FormationList != null)
                {
                    int count = FormationList.Count;
                    count = count - (int)(count / 2);
                    if (FormationList.Count > count)
                    {
                        _formationTableRight = new DataTable("");
                        _formationTableRight.Columns.Add("RowName", typeof (string));
                        _formationTableRight.Columns.Add("Name", typeof (string));
                        _formationTableRight.Columns.Add("Value", typeof (string));
                        _formationTableRight.Columns.Add("Unit", typeof (string));

                        for (int index = count; index < FormationList.Count; index++)
                        {
                            NameValuePair pair = FormationList[index];
                            if (pair != null)
                            {
                                DataRow row = _formationTableRight.NewRow();
                                row["RowName"] = "rowPriceItem";
                                row["Name"] = pair.Name;
                                row["Value"] = pair.Value;
                                row["Unit"] = pair.Unit;
                                _formationTableRight.Rows.Add(row);
                            }
                        }
                    }
                }
                return _formationTableRight;
            }
        }

        #endregion

        #region Fluid of Cementing Data on Well Overview Page

        public bool HasFluids
        {
            get { return FluidsData != null && FluidsData.Count > 0; }
        }

        private List<FluidsReportDataSource> _fluidsData;
        public List<FluidsReportDataSource> FluidsData
        {
            get
            {
                if (_fluidsData == null)
                {
                    _fluidsData = new List<FluidsReportDataSource>();
                    foreach (var job in _jobDesign.Jobs)
                    {
                        foreach (var blend in job.BlendsContainer.Blends)
                        {
                            _fluidsData.Add(new FluidsReportDataSource(blend, job.Operation));
                        }

                        if (job.DrillingFluid != null)
                        {
                            _fluidsData.Add(new FluidsReportDataSource(job.DrillingFluid));
                        }

                        foreach (var nonDrillingFluid in job.PreflushAndSpacers)
                        {
                            _fluidsData.Add(new FluidsReportDataSource(nonDrillingFluid, job.Operation));
                        }
                    }
                }

                return _fluidsData;
            }
        }

        private DataTable _fluidsTable;
        public DataTable FluidsTable
        {
            get
            {
                if (_fluidsTable == null && FluidsData != null)
                {
                    _fluidsTable = new DataTable("");
                    _fluidsTable.Columns.Add("RowName", typeof(string));
                    _fluidsTable.Columns.Add("Name", typeof(string));
                    _fluidsTable.Columns.Add("Product", typeof(string));
                    _fluidsTable.Columns.Add("Density", typeof(string));
                    _fluidsTable.Columns.Add("MixWaterRequired", typeof(string));
                    _fluidsTable.Columns.Add("Yield", typeof(string));
                    _fluidsTable.Columns.Add("Tonnes", typeof(string));
                    _fluidsTable.Columns.Add("Volume", typeof(string));
                    _fluidsTable.Columns.Add("Rate", typeof(string));
                    _fluidsTable.Columns.Add("WaterRequired", typeof(string));
                    _fluidsTable.Columns.Add("PumpTime", typeof(string));

                    foreach (FluidsReportDataSource fluid in FluidsData)
                    {
                        DataRow row = _fluidsTable.NewRow();
                        row["RowName"] = "rowPriceItem";
                        row["Name"] = fluid.Name;
                        row["Product"] = fluid.Product;
                        row["Density"] = fluid.Density.ToString("N2");
                        row["MixWaterRequired"] = fluid.MixWaterRequired != null ? fluid.MixWaterRequired.Value.ToString("N3") : string.Empty;
                        row["Yield"] = fluid.Yield != null ? fluid.Yield.Value.ToString("N3") : string.Empty;
                        row["Tonnes"] = fluid.Tonnes != null ? fluid.Tonnes.Value.ToString("N1") : string.Empty;
                        row["Volume"] = fluid.Volume.ToString("N1");
                        row["Rate"] = fluid.Rate != null ? fluid.Rate.Value.ToString("N1") : string.Empty;
                        row["WaterRequired"] = fluid.WaterRequired != null ? fluid.WaterRequired.Value.ToString("N1") : string.Empty;
                        row["PumpTime"] = fluid.PumpTime != null ? fluid.PumpTime.Value.ToString("N1") : string.Empty;
                        _fluidsTable.Rows.Add(row);
                    }
                    if (FluidsData.Count > 0)
                    {
                        DataRow row = _fluidsTable.NewRow();
                        row["RowName"] = "rowTotal";
                        row["Name"] = string.Empty;
                        row["Product"] = string.Empty;
                        row["Density"] = string.Empty;
                        row["MixWaterRequired"] = string.Empty;
                        row["Yield"] = string.Empty;
                        row["Tonnes"] = FluidTonnesTotal;
                        row["Volume"] = FluidVolumeTotal;
                        row["Rate"] = string.Empty;
                        row["WaterRequired"] = FluidWaterRequiredTotal;
                        row["PumpTime"] = FluidPumpTimeTotal;
                        _fluidsTable.Rows.Add(row);
                    }
                }
                return _fluidsTable;
            }
        }

        public string FluidTonnesTotal
        {
            get
            {
                double total = 0.0;
                if (HasFluids)
                {
                    total += FluidsData.Sum(fluid => (fluid.Tonnes != null ? fluid.Tonnes.Value : 0));
                }
                return total.ToString("N1");
            }
        }

        public string FluidVolumeTotal
        {
            get
            {
                double total = 0.0;
                if (HasFluids)
                {
                    total += FluidsData.Sum(fluid => fluid.Volume);
                }
                return total.ToString("N1");
            }
        }

        public string FluidWaterRequiredTotal
        {
            get
            {
                double total = 0.0;
                if (HasFluids)
                {
                    total += FluidsData.Sum(fluid => (fluid.WaterRequired != null ? fluid.WaterRequired.Value : 0));
                }
                return total.ToString("N1");
            }
        }

        public string FluidPumpTimeTotal
        {
            get
            {
                double total = 0.0;
                if (HasFluids)
                {
                    total += FluidsData.Sum(fluid => (fluid.PumpTime != null ? fluid.PumpTime.Value : 0));
                }
                return total.ToString("N1");
            }
        }

        #endregion

        #region Tubulars of Cementing Data on Well Overview Page

        public bool HasTubulars
        {
            get { return TubularsList.Length > 0; }
        }

        private string _tubularsList;
        public string TubularsList
        {
            get
            {
                if (string.IsNullOrEmpty(_tubularsList))
                {
                    // No need to check Diameter and Weight for .HasValue because at this point they must have values.
                    string lengthUnit = ApplicationConfiguration.Instance.MeasurementUnit == SolutionEnums.MeasurementUnitType.Imperial ? "ft" : "m";
                    string weightUnit = ApplicationConfiguration.Instance.MeasurementUnit == SolutionEnums.MeasurementUnitType.Imperial ? "lb/ft" : "kg/m";

                    _tubularsList = string.Empty;
                    WellBore bore = _jobDesign.Bore;
                    foreach (var oh in bore.OpenHoles)
                    {
                        _tubularsList += (string.Format("\u2022  {0:N1} mm OH ({1:N} to {2:N} {3})\r", oh.Diameter.Value, oh.TopMeasuredDepth, oh.BottomMeasuredDepth, lengthUnit));
                    }

                    foreach (var casing in bore.Casings)
                    {
                        _tubularsList += (string.Format("\u2022  {0:N1} mm casing ({1:N} to {2:N} {3}) {4:N} {5}\r", casing.Diameter.Value,
                            casing.TopMeasuredDepth, casing.BottomMeasuredDepth, lengthUnit, casing.Weight.Value, weightUnit));
                    }

                    foreach (var tubing in bore.Tubing)
                    {
                        _tubularsList += (string.Format("\u2022  {0:N1} mm casing ({1:N} to {2:N} {3}) {4:N} {5}\r", tubing.Diameter.Value,
                            tubing.TopMeasuredDepth, tubing.BottomMeasuredDepth, lengthUnit, tubing.Weight.Value, weightUnit));
                    }
                }
                return _tubularsList;
            }
        }

        #endregion

        #region High Profile Well for Well Overview Page

        public bool IsHighProfileWell
        {
            get { return _jobDesign.CommonData.HighProfileWell == SolutionEnums.NoYes.Yes; }
        }

        public string HighProfileWellLabel
        {
            get { return IsHighProfileWell ? Bullet + "  This is a high profile well" : ""; }
        }

        #endregion

        #region Implementation Notes & Operational Objectives on Well Overview Page

        private string _implementationText;
        public string ImplementationText
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_implementationText) && !string.IsNullOrWhiteSpace(_jobDesign.CommonData.ImplementationNotes))
                {
                    string[] list = _jobDesign.CommonData.ImplementationNotes.Split(new char[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string item in list)
                    {
                        _implementationText += (Bullet + "  " + item + "\n");
                    }
                }
                return _implementationText;
            }
        }

        public bool HasOperations
        {
            get { return !string.IsNullOrWhiteSpace(OperationsText); }
        }

        private string _operationsText;
        public string OperationsText
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_operationsText) && !string.IsNullOrWhiteSpace(_jobDesign.CommonData.OperationalObjectives))
                {
                    string[] list = _jobDesign.CommonData.OperationalObjectives.Split(new char[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string item in list)
                    {
                        _operationsText += (Bullet + "  " + item + "\n");
                    }
                }
                return _operationsText;
            }
        }

        #endregion

        #region Data for Agnostic Grid on Pricing Page

        private List<JobSalesQuoteSection> _selectedSections;

        public List<JobSalesQuoteSection> SelectedSections
        {
            get
            {
                if (_selectedSections == null)
                {
                    _selectedSections = new List<JobSalesQuoteSection>();
                    JobSalesQuote quote = _jobDesign.CurrentJob.SalesQuote;
                    var allSections = quote.Sections.Where(a => a.Ordinal < 100).OrderBy(a => a.Ordinal);
                    foreach (var section in allSections)
                    {
                        if ((section.SalesQuoteLineItems.Count > 0 && section.Type != SolutionEnums.SectionType.Summary)
                            || section.Type == SolutionEnums.SectionType.Summary)
                        {
                            _selectedSections.Add(section);
                        }
                    }
                }
                return _selectedSections;
            }
        }

        private List<ReportDataSource> _sectionReportModels;

        public List<ReportDataSource> SectionReportModels
        {
            get
            {
                if (_sectionReportModels == null)
                {
                    _sectionReportModels = new List<ReportDataSource>();
                    foreach (var section in SelectedSections)
                    {
                        SaleQuoteSectionReportDataSource sectionDataSource = new SaleQuoteSectionReportDataSource(_jobDesign.CurrentJob.SalesQuote, section);
                        _sectionReportModels.Add(sectionDataSource);
                    }
                }
                return _sectionReportModels;
            }
        }

        public decimal GrandTotal
        {
            get
            {
                var bldTotal = ((from section in SelectedSections
                                 where section.Type == SolutionEnums.SectionType.Details
                                 select section.SalesQuoteLineItems.Sum(c => c.TotalAmount)).Sum());

                var apbTotal = (from section in SelectedSections
                                where (section.Type == SolutionEnums.SectionType.SummaryWithDetails || section.Type == SolutionEnums.SectionType.Summary)
                                select section.BidAmount).Sum();

                return bldTotal + apbTotal;
            }
        }

        #endregion

        #region Additional Items Notes for Pricing Page

        public bool HasAdditionalItems
        {
            get { return !string.IsNullOrWhiteSpace(_jobDesign.CurrentJob.SalesQuote.ProposalAdditionalItemsNotes); }
        }

        public string AdditionalItemsNotes
        {
            get { return _jobDesign.CurrentJob.SalesQuote.ProposalAdditionalItemsNotes; }
        }

        public List<ReportDataSource> AdditionalItemsNotesModel
        {
            get
            {
                return string.IsNullOrEmpty(AdditionalItemsNotes) ? null : new List<ReportDataSource> {new ReportDataSource()};
            }
        }

        #endregion

        #region Data for Cover Page

        public int CountryId
        {
            get { return _jobDesign.CommonData.SanjelCompanyId ?? 1; }
        }

        #endregion

        #region To be deleted

        public string[] ImplementationNotes
        {
            get
            {
                if (!string.IsNullOrWhiteSpace(_jobDesign.CommonData.ImplementationNotes))
                {
                    return _jobDesign.CommonData.ImplementationNotes.Split(new char[] { '\r' }, StringSplitOptions.RemoveEmptyEntries);
                }
                return new string[] { };
            }
        }

        private List<string> _tubulars;

        public List<string> TubularsText
        {
            get
            {
                if (_tubulars == null)
                {
                    // No need to check Diameter and Weight for .HasValue because at this point they must have values.
                    string lengthUnit = ApplicationConfiguration.Instance.MeasurementUnit == SolutionEnums.MeasurementUnitType.Imperial ? "ft" : "m";
                    string weightUnit = ApplicationConfiguration.Instance.MeasurementUnit == SolutionEnums.MeasurementUnitType.Imperial ? "lb/ft" : "kg/m";

                    _tubulars = new List<string>();
                    WellBore bore = _jobDesign.Bore;
                    foreach (var oh in bore.OpenHoles)
                    {
                        _tubulars.Add(string.Format("{0:N1} mm OH ({1:N} to {2:N} {3})", oh.Diameter.Value,
                            oh.TopMeasuredDepth,
                            oh.BottomMeasuredDepth, lengthUnit));
                    }

                    foreach (var casing in bore.Casings)
                    {
                        _tubulars.Add(string.Format("{0:N1} mm casing ({1:N} to {2:N} {3}) {4:N} {5}", casing.Diameter.Value,
                            casing.TopMeasuredDepth, casing.BottomMeasuredDepth, lengthUnit, casing.Weight.Value,
                            weightUnit));
                    }

                    foreach (var tubing in bore.Tubing)
                    {
                        _tubulars.Add(string.Format("{0:N1} mm casing ({1:N} to {2:N} {3}) {4:N} {5}", tubing.Diameter.Value,
                            tubing.TopMeasuredDepth, tubing.BottomMeasuredDepth, lengthUnit, tubing.Weight.Value,
                            weightUnit));
                    }
                }
                return _tubulars;
            }
        }

        public string[] OperationalObjectives
        {
            get
            {
                if (!string.IsNullOrWhiteSpace(_jobDesign.CommonData.OperationalObjectives))
                {
                    return _jobDesign.CommonData.OperationalObjectives.Split(new char[] { '\r' }, StringSplitOptions.RemoveEmptyEntries);
                }
                return new string[] { };
            }
        }

        private IEnumerator<ReportDataSource> _currentEnumerator;

        public IEnumerator<ReportDataSource> FirstSection
        {
            get { return _currentEnumerator = SectionReportModels.GetEnumerator(); }
        }

        public ReportDataSource CurrentSaleQuoteSection
        {
            get
            {
                if (_currentEnumerator != null)
                {
                    if (_currentEnumerator.Current == null)
                    {
                        _currentEnumerator.MoveNext();
                    }
                    return _currentEnumerator.Current;
                }
                return null;
            }
        }

        #endregion
    }
}
