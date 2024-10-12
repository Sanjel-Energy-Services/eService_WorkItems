
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public class CssRuleSet : IDeclarationContainer
    {
        #region Instance Variables

        private List<CssSelectorSet> _selectorSet = new List<CssSelectorSet>();
        private List<CssDeclaration> _declarations = new List<CssDeclaration>();

        #endregion Instance Variables

        #region Instance Properties

        [XmlArrayItem("SelectorSet", typeof(CssSelectorSet))]
        [XmlArray("SelectorSet")]
        public List<CssSelectorSet> SelectorSet
        {
            get { return _selectorSet; }
            set { _selectorSet = value; }
        }

        [XmlArrayItem("Declaration", typeof(CssDeclaration))]
        [XmlArray("Declarations")]
        public List<CssDeclaration> Declarations
        {
            get { return _declarations; }
            set { _declarations = value; }
        }

        #endregion Instance Properties

        #region Instance Methods

        public override string ToString()
        {
            return ToString(0);
        }

        public string ToString(int nesting)
        {
            string start = "";
            for (int i = 0; i < nesting; i++)
            {
                start += "\t";
            }

            StringBuilder txt = new StringBuilder();
            bool first = true;
            foreach (CssSelectorSet sel in _selectorSet)
            {
                if (first) { first = false; txt.Append(start); } else { txt.Append(", "); }
                txt.Append(sel.ToString());
            }
            txt.Append(" {\r\n");
            txt.Append(start);

            foreach (CssDeclaration dec in _declarations)
            {
                txt.AppendFormat("\t{0};\r\n{1}", dec, start);
            }

            txt.Append("}");
            return txt.ToString();
        }

        #endregion Instance Methods
    }
}