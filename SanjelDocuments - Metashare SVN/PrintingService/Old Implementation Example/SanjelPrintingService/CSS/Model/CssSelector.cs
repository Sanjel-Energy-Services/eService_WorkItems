
using System;
using System.Diagnostics;
using System.Text;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public enum EnumSelectorType
    {
        Element,
        Id,
        Class,
        Combination
    }

    public class CssSelector : IEquatable<CssSelector>
    {
        #region Instance Variables

        private EnumCombinator? _combinator;
        private string _elementName;
        private string _id;
        private string _class;
        private CssAttribute _attribute;
        private string _pseudo;
        private CssFunction _function;
        private CssSelector _child;

        #endregion Instance Variables

        #region Instance Properties

        [XmlIgnore]
        public EnumCombinator? Combinator
        {
            get { return _combinator; }
            set { _combinator = value; }
        }

        [XmlAttribute("combinator")]
        public string CombinatorString
        {
            get { return _combinator.HasValue ? _combinator.ToString() : null; }
            set { _combinator = (EnumCombinator) Enum.Parse(typeof (EnumCombinator), value); }
        }

        [XmlAttribute("element")]
        public string ElementName
        {
            get { return _elementName; }
            set { _elementName = value; }
        }

        [XmlAttribute("id")]
        public string Id
        {
            get { return _id; }
            set { _id = value; }
        }

        [XmlAttribute("class")]
        public string Class
        {
            get { return _class; }
            set { _class = value; }
        }

        [XmlAttribute("pseudo")]
        public string Pseudo
        {
            get { return _pseudo; }
            set { _pseudo = value; }
        }

        [XmlElement("Attribute")]
        public CssAttribute Attribute
        {
            get { return _attribute; }
            set { _attribute = value; }
        }

        [XmlElement("Function")]
        public CssFunction Function
        {
            get { return _function; }
            set { _function = value; }
        }

        [XmlElement("Child")]
        public CssSelector Child
        {
            get { return _child; }
            set { _child = value; }
        }

        #endregion Instance Properties

        #region Constructors

        public CssSelector()
        {
        }

        public CssSelector(EnumSelectorType type, string name)
        {
            switch (type)
            {
                case EnumSelectorType.Element:
                    _elementName = name;
                    break;
                case EnumSelectorType.Id:
                    _id = name;
                    break;
                case EnumSelectorType.Class:
                    _class = name;
                    break;
                default:
                    // combination finding isn't supported for now
                    Debug.Assert(false);
                    break;
            }
        }

        #endregion Constructors

        #region Instance Methods

        public override string ToString()
        {
            StringBuilder txt = new StringBuilder();
            if (_combinator.HasValue)
            {
                switch (_combinator.Value)
                {
                    case EnumCombinator.PrecededImmediatelyBy: txt.Append(" + "); break;
                    case EnumCombinator.ChildOf: txt.Append(" > "); break;
                    case EnumCombinator.PrecededBy: txt.Append(" ~ "); break;
                }
            }
            if (_elementName != null) { txt.Append(_elementName); }
            if (_id != null) { txt.AppendFormat("#{0}", _id); }
            if (_class != null) { txt.AppendFormat(".{0}", _class); }
            if (_pseudo != null) { txt.AppendFormat(":{0}", _pseudo); }
            if (_attribute != null) { txt.Append(_attribute.ToString()); }
            if (_function != null) { txt.Append(_function.ToString()); }
            if (_child != null)
            {
                if (_child.ElementName != null) { txt.Append(" "); }
                txt.Append(_child.ToString());
            }
            return txt.ToString();
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            CssSelector objAsPart = obj as CssSelector;
            if (objAsPart == null) return false;
            else return Equals(objAsPart);
        }

        public bool Equals(CssSelector other)
        {
            if (other == null) return false;

            return (this == other);
        }

        public static bool operator != (CssSelector left, CssSelector right)
        {
            return !(left == right);
        }

        public static bool operator == (CssSelector left, CssSelector right)
        {
            if ((object)left == null && (object)right == null) return true;
            if ((object)left == null || (object)right == null) return false;

            return (String.Compare(left.ToString(), right.ToString(), StringComparison.OrdinalIgnoreCase) == 0);
        }

        public override int GetHashCode()
        {
            return ToString().GetHashCode();
        }

        #endregion Instance Methods
    }
}
