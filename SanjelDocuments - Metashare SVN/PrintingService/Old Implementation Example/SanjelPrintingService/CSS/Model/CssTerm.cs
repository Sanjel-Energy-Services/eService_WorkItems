
using System;
using System.Globalization;
using System.Text;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public class CssTerm
    {
        #region Instance Variables

        private char? _seperator;
        private char? _sign;
        private EnumTermType _type;//
        private string _value;//
        private EnumUnit? _unit;//
        private CssFunction _function;

        #endregion Instance Variables

        #region Instance Properties

        [XmlIgnore]
        public char? Seperator
        {
            get { return _seperator; }
            set { _seperator = value; }
        }

        [XmlAttribute("seperator")]
        public string SeperatorChar
        {
            get { return _seperator.HasValue ? _seperator.Value.ToString(CultureInfo.InvariantCulture) : null; }
            set { _seperator = !string.IsNullOrEmpty(value) ? value[0] : '\0'; }
        }

        [XmlIgnore]
        public char? Sign
        {
            get { return _sign; }
            set { _sign = value; }
        }

        [XmlAttribute("sign")]
        public string SignChar
        {
            get { return _sign.HasValue ? _sign.Value.ToString(CultureInfo.InvariantCulture) : null; }
            set { _sign = !string.IsNullOrEmpty(value) ? value[0] : '\0'; }
        }

        [XmlAttribute("type")]
        public EnumTermType Type
        {
            get { return _type; }
            set { _type = value; }
        }

        [XmlAttribute("value")]
        public string Value
        {
            get { return _value; }
            set { _value = value; }
        }

        [XmlIgnore]
        public EnumUnit? Unit
        {
            get { return _unit; }
            set { _unit = value; }
        }

        [XmlAttribute("unit")]
        public string UnitString
        {
            get { return _unit.HasValue ? _unit.ToString() : null; }
            set { _unit = (EnumUnit)Enum.Parse(typeof(EnumUnit), value); }
        }

        [XmlElement("Function")]
        public CssFunction Function
        {
            get { return _function; }
            set { _function = value; }
        }

        #endregion Instance Properties

        #region Instance Methods

        public override string ToString()
        {
            StringBuilder txt = new StringBuilder();

            if (_type == EnumTermType.Function)
            {
                txt.Append(_function.ToString());
            }
            else if (_type == EnumTermType.Url)
            {
                txt.AppendFormat("url('{0}')", _value);
            }
            else if (_type == EnumTermType.Unicode)
            {
                txt.AppendFormat("U\\{0}", _value.ToUpper());
            }
            else if (_type == EnumTermType.Hex)
            {
                txt.Append(_value.ToUpper());
            }
            else
            {
                if (_sign.HasValue) { txt.Append(_sign.Value); }
                txt.Append(_value);
                if (_unit.HasValue)
                {
                    txt.Append(_unit.Value == EnumUnit.Percent ? "%" : UnitOutput.ToString(_unit.Value));
                }
            }

            return txt.ToString();
        }

        #endregion Instance Methods
    }
}
