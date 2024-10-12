
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public class CssSelectorSet
    {
        #region Instance Variables

        private List<CssSelector> _selectors = new List<CssSelector>();

        #endregion Instance Variables

        #region Instance Properties

        [XmlArrayItem("Selector", typeof(CssSelector))]
        [XmlArray("Selectors")]
        public List<CssSelector> Selectors
        {
            get { return _selectors; }
            set { _selectors = value; }
        }

        #endregion Instance Properties

        #region Instance Methods

        public override string ToString()
        {
            StringBuilder txt = new StringBuilder();
            bool first = true;
            foreach (CssSelector ss in _selectors)
            {
                if (first) { first = false; } else { txt.Append(" "); }
                txt.Append(ss.ToString());
            }
            return txt.ToString();
        }

        #endregion Instance Methods
    }
}