
using O2S.Components.PDF4NET.Graphics.Fonts;
using Sanjel.Common.Core;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public class FontFactory : Factory
    {
        private static readonly FontFactory _instance = new FontFactory();

        protected FontFactory() { }

        public static FontFactory Instance
        {
            get { return _instance; }
        }

        public TrueTypeFont GetTrueTypeFont(TextFontStyle style)
        {
            object font = GetProduct(style.GetHashCode());
            if (font == null)
            {
                font = PdfUtilities.TrueTypeFont(style);
                Register(style.GetHashCode(), font);
            }
            return font as TrueTypeFont;
        }
    }
}
