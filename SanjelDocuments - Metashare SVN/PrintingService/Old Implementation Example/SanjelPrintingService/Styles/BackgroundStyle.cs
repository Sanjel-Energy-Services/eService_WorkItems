
using System.Drawing;

namespace Sanjel.PrintingService.Styles
{
    public class BackgroundStyle : IStyle
    {
        public bool Visible
        {
            get { return !Color.IsEmpty; }
        }

        public Color Color { get; set; }

        public BackgroundStyle()
        {
            Color = Color.Empty;
        }

        public BackgroundStyle Clone()
        {
            return new BackgroundStyle {Color = Color};
        }
    }
}
