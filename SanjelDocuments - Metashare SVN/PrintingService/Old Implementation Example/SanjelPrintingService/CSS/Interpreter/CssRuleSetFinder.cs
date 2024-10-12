
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using Sanjel.PrintingService.CSS.Model;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public class CssRuleSetFinder
    {
        #region Instance Variables

        private List<CssSelector> _selectors = new List<CssSelector>();
        private List<CssRuleSet> _ruleSets = new List<CssRuleSet>();

        #endregion Instance Variables

        #region Instance Properties

        public List<CssSelector> Selectors
        {
            get { return _selectors; }
            set { _selectors = value; }
        }

        public List<CssRuleSet> RuleSets
        {
            get { return _ruleSets; }
            set { _ruleSets = value; }
        }

        #endregion Instance Properties

        #region Constructors

        public CssRuleSetFinder(EnumSelectorType type, string name)
        {
            if (string.IsNullOrEmpty(name))
            {
                Debug.Assert(false);
            }
            _selectors.Add(new CssSelector(type, name));
        }

        public CssRuleSetFinder(EnumSelectorType type, List<string> names)
        {
            if (names == null || names.Count == 0)
            {
                Debug.Assert(false);
            }
            _selectors.AddRange(names.Select(name => new CssSelector(type, name)));
        }

        public CssRuleSetFinder(string elementName, string idName, string className)
        {
            if (!string.IsNullOrEmpty(elementName))
            {
                _selectors.Add(new CssSelector(EnumSelectorType.Element, elementName));
            }
            if (!string.IsNullOrEmpty(idName))
            {
                _selectors.Add(new CssSelector(EnumSelectorType.Id, idName));
            }
            if (!string.IsNullOrEmpty(className))
            {
                _selectors.Add(new CssSelector(EnumSelectorType.Class, className));
            }
        }

        public CssRuleSetFinder(string elementName, string idName, List<string> classNames)
        {
            if (!string.IsNullOrEmpty(elementName))
            {
                _selectors.Add(new CssSelector(EnumSelectorType.Element, elementName));
            }
            if (!string.IsNullOrEmpty(idName))
            {
                _selectors.Add(new CssSelector(EnumSelectorType.Id, idName));
            }
            if (classNames != null && classNames.Count > 0)
            {
                _selectors.AddRange(classNames.Select(name => new CssSelector(EnumSelectorType.Class, name)));
            }
        }

        public CssRuleSetFinder(List<string> elementNames, List<string> idNames, List<string> classNames)
        {
            if (elementNames != null && elementNames.Count > 0)
            {
                _selectors.AddRange(elementNames.Select(name => new CssSelector(EnumSelectorType.Element, name)));
            }
            if (idNames != null && idNames.Count > 0)
            {
                _selectors.AddRange(idNames.Select(name => new CssSelector(EnumSelectorType.Id, name)));
            }
            if (classNames != null && classNames.Count > 0)
            {
                _selectors.AddRange(classNames.Select(name => new CssSelector(EnumSelectorType.Class, name)));
            }
        }

        #endregion Constructors

        #region Instance Methods

        public int FindRuleSets(List<CssRuleSet> ruleSets)
        {
            _ruleSets.Clear();
            if (ruleSets != null && ruleSets.Count > 0 && _selectors.Count > 0)
            {
                _ruleSets.AddRange(ruleSets.Where(ruleSet =>
                                        (ruleSet.SelectorSet.Any(selectorSet =>
                                            selectorSet.Selectors.Any(selector =>
                                                _selectors.Any(finder => CompareSelector(selector, finder)))))));
            }
            return _ruleSets.Count;
        }

        public static bool CompareSelector(CssSelector selector, CssSelector finder)
        {
            // "*" works for universal selector
            string text = selector.ToString();
            //return String.Compare(text, "*", StringComparison.OrdinalIgnoreCase) == 0 || String.Compare(text, finder.ToString(), StringComparison.OrdinalIgnoreCase) == 0;
            return String.Compare(text, finder.ToString(), StringComparison.OrdinalIgnoreCase) == 0;
        }

        #endregion Instance Methods
    }
}
