
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public class CssDirective : IDeclarationContainer, IRuleSetContainer
    {
        #region Instance Variables

        private EnumDirectiveType _type;
        private string _name;
        private CssExpression _expression;
        private List<EnumMedium> _mediums = new List<EnumMedium>();
        private List<CssDirective> _directives = new List<CssDirective>();
        private List<CssRuleSet> _rulesets = new List<CssRuleSet>();
        private List<CssDeclaration> _declarations = new List<CssDeclaration>();

        #endregion Instance Variables

        #region Instance Properties

        [XmlAttribute("type")]
        public EnumDirectiveType Type
        {
            get { return _type; }
            set { _type = value; }
        }

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

        [XmlArrayItem("Medium", typeof(EnumMedium))]
        [XmlArray("Mediums")]
        public List<EnumMedium> Mediums
        {
            get { return _mediums; }
            set { _mediums = value; }
        }

        [XmlArrayItem("Directive", typeof(CssDirective))]
        [XmlArray("Directives")]
        public List<CssDirective> Directives
        {
            get { return _directives; }
            set { _directives = value; }
        }

        [XmlArrayItem("RuleSet", typeof(CssRuleSet))]
        [XmlArray("RuleSets")]
        public List<CssRuleSet> RuleSets
        {
            get { return _rulesets; }
            set { _rulesets = value; }
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

            switch (_type)
            {
                case EnumDirectiveType.Charset: return ToCharSetString(start);
                case EnumDirectiveType.Page: return ToPageString(start);
                case EnumDirectiveType.Media: return ToMediaString(nesting);
                case EnumDirectiveType.Import: return ToImportString();
                case EnumDirectiveType.FontFace: return ToFontFaceString(start);
            }

            StringBuilder txt = new StringBuilder();

            txt.AppendFormat("{0} ", _name);

            if (_expression != null) { txt.AppendFormat("{0} ", _expression); }

            bool first = true;
            foreach (EnumMedium m in _mediums)
            {
                if (first)
                {
                    first = false;
                    txt.Append(" ");
                }
                else
                {
                    txt.Append(", ");
                }
                txt.Append(m.ToString());
            }

            bool hasBlock = (_declarations.Count > 0 || _directives.Count > 0 || _rulesets.Count > 0);

            if (!hasBlock)
            {
                txt.Append(";");
                return txt.ToString();
            }

            txt.Append(" {\r\n" + start);

            foreach (CssDirective dir in _directives)
            {
                txt.AppendFormat("{0}\r\n", dir.ToCharSetString(start + "\t"));
            }

            foreach (CssRuleSet rules in _rulesets)
            {
                txt.AppendFormat("{0}\r\n", rules.ToString(nesting + 1));
            }

            first = true;
            foreach (CssDeclaration dec in _declarations)
            {
                if (first) { first = false; } else { txt.Append(";"); }
                txt.Append("\r\n\t" + start);
                txt.Append(dec.ToString());
            }

            txt.Append("\r\n}");
            return txt.ToString();
        }

        private string ToFontFaceString(string start)
        {
            StringBuilder txt = new StringBuilder();
            txt.Append("@font-face {");

            bool first = true;
            foreach (CssDeclaration dec in _declarations)
            {
                if (first) { first = false; } else { txt.Append(";"); }
                txt.Append("\r\n\t" + start);
                txt.Append(dec.ToString());
            }

            txt.Append("\r\n}");
            return txt.ToString();
        }

        private string ToImportString()
        {
            StringBuilder txt = new StringBuilder();
            txt.Append("@import ");
            if (_expression != null) { txt.AppendFormat("{0} ", _expression); }
            bool first = true;
            foreach (EnumMedium m in _mediums)
            {
                if (first)
                {
                    first = false;
                    txt.Append(" ");
                }
                else
                {
                    txt.Append(", ");
                }
                txt.Append(m.ToString());
            }
            txt.Append(";");
            return txt.ToString();
        }

        private string ToMediaString(int nesting)
        {
            StringBuilder txt = new StringBuilder();
            txt.Append("@media");

            bool first = true;
            foreach (EnumMedium m in _mediums)
            {
                if (first)
                {
                    first = false;
                    txt.Append(" ");
                }
                else
                {
                    txt.Append(", ");
                }
                txt.Append(m.ToString());
            }
            txt.Append(" {\r\n");

            foreach (CssRuleSet rules in _rulesets)
            {
                txt.AppendFormat("{0}\r\n", rules.ToString(nesting + 1));
            }

            txt.Append("}");
            return txt.ToString();
        }

        private string ToPageString(string start)
        {
            StringBuilder txt = new StringBuilder();
            txt.Append("@page ");
            if (_expression != null) { txt.AppendFormat("{0} ", _expression); }
            txt.Append("{\r\n");

            bool first = true;
            foreach (CssDeclaration dec in _declarations)
            {
                if (first) { first = false; } else { txt.Append(";"); }
                txt.Append("\r\n\t" + start);
                txt.Append(dec.ToString());
            }

            txt.Append("}");
            return txt.ToString();
        }

        private string ToCharSetString(string start)
        {
            return string.Format("{2}{0} {1}", _name, _expression, start);
        }

        #endregion Instance Methods
    }
}