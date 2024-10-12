
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace Sanjel.PrintingService.CSS.Model
{
    public class CssDocument : IRuleSetContainer
    {
        #region Instance Variables
        
        private List<CssDirective> _directives = new List<CssDirective>();
        private List<CssRuleSet> _ruleSets = new List<CssRuleSet>();

        #endregion Instance Variables

        #region Instance Properties

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
            get { return _ruleSets; }
            set { _ruleSets = value; }
        }

        #endregion Instance Properties

        #region Instance Methods

        public override string ToString()
        {
            StringBuilder txt = new StringBuilder();
            foreach (CssDirective dr in _directives)
            {
                txt.AppendFormat("{0}\r\n", dr);
            }
            if (txt.Length > 0) { txt.Append("\r\n"); }
            foreach (CssRuleSet rules in _ruleSets)
            {
                txt.AppendFormat("{0}\r\n", rules);
            }
            return txt.ToString();
        }

        #endregion Instance Methods
    }
}