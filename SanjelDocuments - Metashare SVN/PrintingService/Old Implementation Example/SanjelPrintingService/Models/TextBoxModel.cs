
using System.Collections.Generic;

namespace Sanjel.PrintingService.Models
{
    public class TextBoxModel : IModel
    {
        private List<HtmlTextParagraph> _dataSet = new List<HtmlTextParagraph>();

        public object DataSet
        {
            get { return _dataSet; }
            set
            {
                var temp = value as List<HtmlTextParagraph>;
                if (temp != null) _dataSet = temp;
            }
        }

        public IModel Parent { get; set; }

        public object GetPropertyValue(string propertyPath)
        {
            return (Parent != null) ? Parent.GetPropertyValue(propertyPath) : null;
        }

        public string GetText()
        {
            string paragraphText = "";
            foreach (HtmlTextParagraph paragraph in Paragraphs)
            {
                if (paragraphText.Length > 0)
                {
                    paragraphText += "<br/>";
                }
                paragraphText += paragraph.GetHtmlString(this);
            }
            return paragraphText;
        }

        public List<HtmlTextParagraph> Paragraphs
        {
            get { return _dataSet; }
            set { _dataSet = value; }
        }
    }
}
