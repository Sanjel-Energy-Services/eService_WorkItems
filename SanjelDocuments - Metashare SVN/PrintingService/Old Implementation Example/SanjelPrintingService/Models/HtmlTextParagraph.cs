
using System.Linq;
using System.Collections.Generic;

namespace Sanjel.PrintingService.Models
{
    public class HtmlTextField : TextField
    {
        public string Prefix { get; set; }
        public string Suffix { get; set; }

        public HtmlTextField(EnumTextFieldType type, string text, string pattern, string prefix, string suffix)
            : base(type, text, pattern)
        {
            Prefix = prefix;
            Suffix = suffix;
        }

        public string ToHtmlString(IModel model)
        {
            return Prefix + ToString(model) + Suffix;
        }
    }

    public class HtmlTextParagraph
    {
        private List<HtmlTextField> _textPieces = new List<HtmlTextField>();

        public List<HtmlTextField> TextPieces
        {
            get { return _textPieces; }
            set { _textPieces = value; }
        }

        public string GetHtmlString(IModel model)
        {
            return TextPieces.Aggregate("", (current, textPiece) => current + textPiece.ToHtmlString(model));
        }
    }
}
