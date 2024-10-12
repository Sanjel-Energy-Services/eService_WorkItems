
using System.Text;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public class CssFunction
    {
        #region Instance Variables

        private string _name;
        private CssExpression _expression;
        
        #endregion Instance Variables

        #region Instance Properties

        [XmlAttribute("name")]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        [XmlElement("Expression")]
        public CssExpression Expression
        {
            get { return _expression; }
            set { _expression = value; }
        }

        #endregion Instance Properties

        #region Instance Methods

        public override string ToString()
        {
            StringBuilder txt = new StringBuilder();
            txt.AppendFormat("{0}(", _name);
            if (_expression != null)
            {
                bool first = true;
                foreach (CssTerm t in _expression.Terms)
                {
                    if (first)
                    {
                        first = false;
                    }
                    else if (!t.Value.EndsWith("="))
                    {
                        txt.Append(", ");
                    }

                    bool quoteMe = (t.Type == EnumTermType.String && !t.Value.EndsWith("="));
                    if (quoteMe) { txt.Append("'"); }
                    txt.Append(t.ToString());
                    if (quoteMe) { txt.Append("'"); }
                }
            }
            txt.Append(")");
            return txt.ToString();
        }

        #endregion Instance Methods
    }
}