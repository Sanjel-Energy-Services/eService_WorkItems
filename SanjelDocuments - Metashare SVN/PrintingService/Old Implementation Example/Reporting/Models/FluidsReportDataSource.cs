
using System.Collections.Generic;

using Sanjel.Jdt.Domain;
using Sanjel.PrintingService;

namespace Sanjel.Jdt.Reporting
{
    public class FluidsReportDataSource : ReportDataSource
    {
        private static Dictionary<DrillingFluid.FluidTypes, string> _drillingFluidNameLookup = null;
        private static Dictionary<NonDrillingFluid.PreflushSpacerTypes, string> _nonDrillingFluidNameLookup = null;

        public FluidsReportDataSource(CementBlend blend, Operations ops, string key = ModelKey.Fluids)
            : base(key)
        {
            this.Name = blend.PrimaryName.ToString() + " " + blend.NameQualifier;
            this.Product = blend.Components[0].Name;
            this.Density = blend.Metrics.Density;
            this.MixWaterRequired = blend.Metrics.MixWater;
            this.Yield = blend.Metrics.Yield;
            this.Tonnes = blend.Weight; // divided by 1000?
            this.Volume = blend.GaugeCementVolume;
            this.Rate = ops.MixingAndPumpingRate;
        }

        public FluidsReportDataSource(DrillingFluid fluid)
        {
            this.Name = DrillingFluidNameLookup[fluid.FluidType]; 

            // Replace with lookups.
            if (fluid.WbmBaseFluid.HasValue) { this.Product = fluid.WbmBaseFluid.ToString(); }
            else if (fluid.ObmBaseFluid.HasValue) { this.Product = fluid.ObmBaseFluid.ToString(); }
            else if (fluid.AdBaseFluid.HasValue) { this.Product = fluid.AdBaseFluid.ToString(); }

            this.Volume = fluid.Volume;
            this.Density = fluid.Density;
        }

        public FluidsReportDataSource(NonDrillingFluid fluid, Operations ops)
        {
            this.Name = fluid.FluidType.ToString();
            this.Product = NonDrillingFluidNameLookup[fluid.Fluid];
            this.Density = fluid.Density;
            this.Volume = fluid.Volume;
            this.Rate = ops.MixingAndPumpingRate;
        }

        public string Name { get; set; }
        public string Product { get; set; }
        public double Density { get; set; }
        public double? MixWaterRequired { get; set; }
        public double? Yield { get; set; }
        public double? Tonnes { get; set; }
        public double Volume { get; set; }
        public double? Rate { get; set; }
        public double? WaterRequired
        {
            get
            {
                if (MixWaterRequired == null || Tonnes == null) { return null; }
                return MixWaterRequired.Value * Tonnes.Value;
            }
        }

        public double? PumpTime
        {
            get
            {
                if (Rate == null) { return null; }
                if (Rate.Value == 0.0) { return 0.0; }
                return Volume / Rate.Value;
            }
        }

        private static Dictionary<DrillingFluid.FluidTypes, string> DrillingFluidNameLookup
        {
            get
            {
                if (_drillingFluidNameLookup == null)
                {
                    _drillingFluidNameLookup = new Dictionary<DrillingFluid.FluidTypes, string>();
                    _drillingFluidNameLookup.Add(DrillingFluid.FluidTypes.DrillingFluid, "Drilling Fluid");
                    _drillingFluidNameLookup.Add(DrillingFluid.FluidTypes.Preflush1, "Preflush 1");
                    _drillingFluidNameLookup.Add(DrillingFluid.FluidTypes.Preflush2, "Preflush 2");
                    _drillingFluidNameLookup.Add(DrillingFluid.FluidTypes.Preflush3, "Preflush 3");
                    _drillingFluidNameLookup.Add(DrillingFluid.FluidTypes.Spacer1, "Spacer 1");
                    _drillingFluidNameLookup.Add(DrillingFluid.FluidTypes.Spacer2, "Spacer 2");
                    _drillingFluidNameLookup.Add(DrillingFluid.FluidTypes.Spacer3, "Spacer 3");
                }
                return _drillingFluidNameLookup;
            }
        }

        private static Dictionary<NonDrillingFluid.PreflushSpacerTypes, string> NonDrillingFluidNameLookup
        {
            get
            {
                if (_nonDrillingFluidNameLookup == null)
                {
                    _nonDrillingFluidNameLookup = new Dictionary<NonDrillingFluid.PreflushSpacerTypes, string>();
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.BaseOil, "Base Oil");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.FreshWater, "Fresh Water");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.IndicatorDye, "Indicator Dye");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.InvertSpacer, "Invert Spacer");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.Mudflush, "Mud Flush");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.None, "None");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.RP20, "RP20");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.Scavenger, "Scavenger");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.VisweepSpacer, "Visweep Spacer");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.WellSeal, "Well Seal");
                    _nonDrillingFluidNameLookup.Add(NonDrillingFluid.PreflushSpacerTypes.WellSealG, "Well Seal G");
                }
                return _nonDrillingFluidNameLookup;
            }
        }
    }
}
