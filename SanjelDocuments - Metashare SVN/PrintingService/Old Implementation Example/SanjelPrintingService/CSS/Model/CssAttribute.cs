
using System;
using System.Text;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public class CssAttribute
    {
        #region Instance Variables

        private string _operand;
        private EnumOperator? _operator;
        private string _value;

        #endregion Instance Variables

        #region Instance Properties

        [XmlAttribute("operand")]
        public string Operand
        {
            get { return _operand; }
            set { _operand = value; }
        }

        [XmlIgnore]
        public EnumOperator? Operator
        {
            get { return _operator; }
            set { _operator = value; }
        }

        [XmlAttribute("operator")]
        public string OperatorString
        {
            get { return _operator.HasValue ? _operator.Value.ToString() : null; }
            set { _operator = (EnumOperator) Enum.Parse(typeof (EnumOperator), value); }
        }

        [XmlAttribute("value")]
        public string Value
        {
            get { return _value; }
            set { _value = value; }
        }

        #endregion Instance Properties

        #region Instance Methods

        public override string ToString()
        {
            StringBuilder txt = new StringBuilder();
            txt.AppendFormat("[{0}", _operand);
            if (_operator.HasValue)
            {
                switch (_operator.Value)
                {
                    case EnumOperator.Equals:
                        txt.Append("=");
                        break;
                    case EnumOperator.InList:
                        txt.Append("~=");
                        break;
                    case EnumOperator.Hyphenated:
                        txt.Append("|=");
                        break;
                    case EnumOperator.BeginsWith:
                        txt.Append("$=");
                        break;
                    case EnumOperator.EndsWith:
                        txt.Append("^=");
                        break;
                    case EnumOperator.Contains:
                        txt.Append("*=");
                        break;
                }
                txt.Append(_value);
            }
            txt.Append("]");
            return txt.ToString();
        }

        #endregion Instance Methods
    }
}