
using System.Text;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public class CssDeclaration
    {
        #region Instance Variables

        private string _name;
        private CssExpression _expression;
        private bool _important;

        #endregion Instance Variables

        #region Instance Properties

        [XmlAttribute("name")]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        [XmlAttribute("important")]
        public bool Important
        {
            get { return _important; }
            set { _important = value; }
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
            txt.AppendFormat("{0}: {1}{2}", _name, _expression, _important ? " !important" : "");
            return txt.ToString();
        }

        #endregion Instance Methods
    }
}
