
using System;
using System.Collections.Generic;

using Sanjel.PrintingService.CSS.Model;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public class CssDisassemblerModel
    {
        public CssDeclaration Declaration { get; set; }
        public ICssDisassembler Disassembler { get; set; }

        public CssDisassemblerModel(CssDeclaration declaration, ICssDisassembler disassembler)
        {
            Declaration = declaration;
            Disassembler = disassembler;
        }

        public bool DisassembleExpression(ref List<KeyValuePair<string, CssTerm>> declarations)
        {
            if (Disassembler == null)
            {
                return false;
            }

            List<KeyValuePair<string, CssTerm>> pairs = Disassembler.DisassembleExpression(Declaration);
            if (pairs.Count > 0)
            {
                declarations.AddRange(pairs);
            }
            return true;
        }
    }

    public class CssDisassemblerControl
    {
        #region Singleton

        /// <summary>
        /// key is declaration ID of CSS declaration
        /// </summary>
        private static Dictionary<string, Type> Bindings { get; set; }

        private static readonly CssDisassemblerControl _instance = new CssDisassemblerControl();

        public static CssDisassemblerControl Instance
        {
            get { return _instance; }
        }

        #endregion Singleton

        #region Constructor

        private CssDisassemblerControl()
        {
            Bindings = new Dictionary<string, Type>
                           {
                               {"line", typeof (CssLineDisassembler)},
                               {"border", typeof (CssBorderDisassembler)},
                               {"border-top", typeof (CssBorderDisassembler)},
                               {"border-left", typeof (CssBorderDisassembler)},
                               {"border-bottom", typeof (CssBorderDisassembler)},
                               {"border-right", typeof (CssBorderDisassembler)},
                               {"margin", typeof (CssMarginDisassembler)},
                               {"padding", typeof (CssPaddingDisassembler)}
                           };
        }

        #endregion Constructor

        public List<KeyValuePair<string, CssTerm>> Declarations { get; set; }

        public List<KeyValuePair<string, CssTerm>> DisassembleExpression(List<CssRuleSet> ruleSets)
        {
            Declarations = new List<KeyValuePair<string, CssTerm>>();
            foreach (CssRuleSet ruleSet in ruleSets)
            {
                foreach (CssDeclaration declaration in ruleSet.Declarations)
                {
                    if (Bindings.ContainsKey(declaration.Name.ToLower()))
                    {
                        ICssDisassembler disassembler = DisassemblerFactory.Instance.GetDisassembler(Bindings[declaration.Name]);
                        if (disassembler != null)
                        {
                            List<KeyValuePair<string, CssTerm>> pairs = disassembler.DisassembleExpression(declaration);
                            if (pairs.Count > 0)
                            {
                                Declarations.AddRange(pairs);
                            }
                        }
                    }
                    else if (declaration.Expression.Terms.Count == 1)
                    {
                        Declarations.Add(new KeyValuePair<string, CssTerm>(declaration.Name, declaration.Expression.Terms[0]));
                    }
                }
            }
            return Declarations;
        }
    }
}
