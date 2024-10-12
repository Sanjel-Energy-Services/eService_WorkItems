
using System;
using System.Linq;
using System.Collections.Generic;
using System.Collections.Specialized;

using Sanjel.PrintingService.Reports;

namespace Sanjel.PrintingService
{
    public class PrintingOption
    {
        public string LayoutFile { get; set; }
        public string StyleFile { get; set; }

        public List<string> Sections { get; set; }

        public PrintingOption()
        {
            Sections = new List<string>();
        }

        public PrintingOption(string layout, string style, List<string> sections)
        {
            LayoutFile = layout;
            StyleFile = style;
            Sections = sections;
        }

        public PrintingOption Clone()
        {
            PrintingOption option = new PrintingOption();
            option.LayoutFile = String.Copy(LayoutFile);
            option.StyleFile = String.Copy(StyleFile);
            foreach(string section in Sections)
            {
                option.Sections.Add(section);
            }
            return option;
        }

        public bool HasSection(string section)
        {
            return Sections.Any(a=> a == section);
        }

        public void AddSection(string section)
        {
            if (!(Sections.Any(a => a == section)))
            {
                Sections.Add(section);
            }
        }

        public void RemoveSection(string section)
        {
            if (Sections.Any(a => a == section))
            {
                Sections.Remove(section);
            }
        }
    }

    public class PrintingOptionFactory
    {
        public static string CanXmlFileName = "CanPriceBook.xml";
        public static string UsaXmlFileName = "UsaPriceBook.xml";
        public static string CanCssFileName = "CanPriceBook.css";
        public static string UsaCssFileName = "UsaPriceBook.css";

        public static string FrontCoverSectionId = "frontCoverSection";
        public static string InsideFrontCoverSectionId = "insideFrontCoverSection";
        public static string BackCoverSectionId = "backCoverSection";
        public static string InsideBackCoverSectionId = "insideBackCoverSection";
        public static string AreaSectionId = "areaSection";
        public static string TermSectionId = "termSection";
        public static string InfoSectionId = "infoSection";
        public static string TocSectionId = "tocSection";
        public static string PricingSectionId = "pricingSection";
        public static string FrontSeparatorId = "frontSeparator";

        private readonly HybridDictionary _options = new HybridDictionary();

        private static readonly PrintingOptionFactory _instance = new PrintingOptionFactory();

        protected PrintingOptionFactory()
        {
            _options.Add(1, new PrintingOption(CanXmlFileName, CanCssFileName, new List<string>
                                                {
                                                    FrontCoverSectionId,
                                                    InsideFrontCoverSectionId,
                                                    AreaSectionId,
                                                    TermSectionId,
                                                    InfoSectionId,
                                                    TocSectionId,
                                                    PricingSectionId,
                                                    FrontSeparatorId,
                                                    InsideBackCoverSectionId,
                                                    BackCoverSectionId
                                                }));
            _options.Add(2, new PrintingOption(UsaXmlFileName, UsaCssFileName, new List<string>
                                                {
                                                    FrontCoverSectionId,
                                                    InsideFrontCoverSectionId,
                                                    AreaSectionId,
                                                    TermSectionId,
                                                    InfoSectionId,
                                                    TocSectionId,
                                                    PricingSectionId,
                                                    FrontSeparatorId,
                                                    InsideBackCoverSectionId,
                                                    BackCoverSectionId
                                                }));
        }

        public static PrintingOptionFactory Instance
        {
            get { return _instance; }
        }

        public PrintingOption GetDefaultOption(int countryCode)
        {
            return _options[countryCode] as PrintingOption;
        }
    }
}
