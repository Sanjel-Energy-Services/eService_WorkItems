
using System.Collections.Generic;
using System.Globalization;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public class CssExpression
    {
        #region Instance Variables

        private List<CssTerm> _terms = new List<CssTerm>();

        #endregion Instance Variables

        #region Instance Properties

        [XmlArrayItem("CssTerm", typeof(CssTerm))]
        [XmlArray("Terms")]
        public List<CssTerm> Terms
        {
            get { return _terms; }
            set { _terms = value; }
        }

        #endregion Instance Properties

        #region Instance Methods

        public override string ToString()
        {
            System.Text.StringBuilder txt = new System.Text.StringBuilder();
            bool first = true;
            foreach (CssTerm term in _terms)
            {
                if (first)
                {
                    first = false;
                }
                else
                {
                    txt.AppendFormat("{0} ", term.Seperator.HasValue ? term.Seperator.Value.ToString(CultureInfo.InvariantCulture) : "");
                }
                txt.Append(term.ToString());
            }
            return txt.ToString();
        }

        #endregion Instance Methods
    }
}