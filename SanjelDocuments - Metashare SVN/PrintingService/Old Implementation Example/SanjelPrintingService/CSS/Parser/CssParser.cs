
using System;
using System.Globalization;
using System.IO;
using Sanjel.PrintingService.CSS.Model;

namespace Sanjel.PrintingService.CSS.Parser
{
    public class CssParser
    {
        #region Constants

        private const int Eof = 0;
        private const int Ident = 1;
        private const int Newline = 2;
        private const int Digit = 3;
        private const int Whitespace = 4;
        private const int MaxT = 49;

        private const int MinErrDist = 2;

        private const bool T = true;
        private const bool F = false;

        #endregion Constants

        #region Instance Variables

        private readonly CssScanner _scanner;
        private Token _lastToken; // last recognized token
        private Token _predictedToken; // lookahead token

        private int _errDist = MinErrDist;

        private readonly bool[,] _set = {
                                  {
                                      T, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F
                                      , F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, T, F, F, F, F, F, F, F, T, F, F, T, T, T, T, T, T, T, T, T, T, T, T, T, F, F, F, F
                                      , F, F, F, T, T, T, T, F, F, F, F, F, F, F, T, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, T, F, F, F, F, F, F, F, T, F, F, T, T, T, T, T, T, T, T, T, T, T, F, T, F, F, F, F
                                      , F, F, F, T, T, T, T, F, F, F, F, F, F, F, T, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, T, F, F, F, F, F, F, F, T, F, F, T, T, T, T, T, T, T, T, T, T, T, F, T, F, F, F, F
                                      , F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, T, F, T, T, F, F, T, T, T, F, F, T, T, T, T, T, T, T, T, T, T, T, F, T, T, T, T, F
                                      , T, F, F, F, T, T, F, F, F, F, F, F, F, F, F, F, F, T, T, T, F, F
                                  },
                                  {
                                      F, F, F, F, F, F, F, F, F, F, F, F, T, T, T, T, T, T, T, T, T, T, F, F, F, F, F, F, F
                                      , F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, T, F, F, F, F, F, F, F, T, F, F, T, T, T, T, T, T, T, T, T, T, T, T, T, F, F, F, T
                                      , F, F, F, T, T, T, T, F, F, F, F, F, F, F, T, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, T, T, T, T, T, T, F, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T
                                      , T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, F
                                  },
                                  {
                                      F, T, T, T, T, T, T, T, F, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T
                                      , T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, F
                                  },
                                  {
                                      F, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T
                                      , T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, F
                                  },
                                  {
                                      F, T, T, T, F, T, T, F, F, T, T, F, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T
                                      , T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, F
                                  },
                                  {
                                      F, T, F, T, T, F, F, T, T, T, F, F, T, T, T, T, T, T, T, T, T, T, T, F, T, T, F, F, F
                                      , T, F, F, F, T, T, F, F, F, F, F, F, F, F, F, F, F, T, T, T, F, F
                                  },
                                  {
                                      F, T, F, F, T, F, F, F, F, T, F, F, T, T, T, T, T, T, T, T, T, T, T, F, T, F, F, F, F
                                      , T, T, T, T, T, T, T, F, F, F, F, F, F, F, T, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F
                                      , F, F, F, F, T, T, T, F, F, F, F, F, F, F, T, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F
                                      , F, F, F, F, F, F, F, T, T, T, T, T, T, F, F, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, T, F, T, T, F, F, T, T, T, F, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T
                                      , T, F, F, T, T, T, T, F, F, F, F, F, F, F, T, T, F, T, T, T, F, F
                                  },
                                  {
                                      F, T, F, F, F, F, F, F, F, T, F, F, T, T, T, T, T, T, T, T, T, T, T, F, F, F, F, F, F
                                      , F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, F, F, F, F, F, F, F, F, F, T, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F
                                      , F, F, F, F, F, T, F, T, F, F, F, F, F, F, T, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, T, F, F, F, F, F, F, F, T, F, F, T, T, T, T, T, T, T, T, T, T, T, F, T, F, F, F, F
                                      , F, F, F, F, F, F, F, F, F, F, F, F, F, F, T, F, F, F, F, F, F, F
                                  },
                                  {
                                      F, T, F, T, T, F, F, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T, T
                                      , T, F, F, T, T, T, T, T, F, F, F, F, F, F, T, T, F, T, T, T, F, F
                                  },
                                  {
                                      F, T, F, F, F, F, F, F, F, T, F, F, T, T, T, T, T, T, T, T, T, T, T, F, F, F, F, F, F
                                      , F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, T, F, F
                                  }
                              };

        #endregion Instance Variables

        #region Instance Properties

        public Errors Errors { get; set; }

        public CssDocument CssDoc { get; set; }

        #endregion Instance Properties

        #region Constructors

        public CssParser(CssScanner scanner)
        {
            _scanner = scanner;
            Errors = new Errors();
        }

        #endregion Constructors

        #region Instance Methods

        public void Parse()
        {
            _predictedToken = new Token {Val = ""};
            Get();
            Css3();
            Expect(0);
        }

        #endregion Instance Methods

        #region Private Methods

        private bool PartOfHex(string value)
        {
            if (value.Length == 7)
            {
                return false;
            }
            if (value.Length + _predictedToken.Val.Length > 7)
            {
                return false;
            }

            System.Collections.Generic.List<string> hexes =
                new System.Collections.Generic.List<string>(new[]
                                                                {
                                                                    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A",
                                                                    "B", "C", "D", "E", "F", "a", "b", "c", "d", "e", "f"
                                                                });
            foreach (char c in _predictedToken.Val)
            {
                if (!hexes.Contains(c.ToString(CultureInfo.InvariantCulture)))
                {
                    return false;
                }
            }
            return true;
        }

        private bool IsUnit()
        {
            if (_predictedToken.Kind != 1)
            {
                return false;
            }
            System.Collections.Generic.List<string> units =
                new System.Collections.Generic.List<string>(new[]
                                                                {
                                                                    "em", "ex", "px", "gd", "rem", "vw", "vh", "vm", "ch",
                                                                    "mm", "cm", "in", "pt", "pc", "deg", "grad", "rad",
                                                                    "turn", "ms", "s", "hz", "khz"
                                                                });
            return units.Contains(_predictedToken.Val.ToLower());
        }

        private bool IsNumber()
        {
            if (_predictedToken.Val.Length > 0)
            {
                return char.IsDigit(_predictedToken.Val[0]);
            }
            return false;
        }

        private void SynErr(int n)
        {
            if (_errDist >= MinErrDist) Errors.SynErr(_predictedToken.Line, _predictedToken.Col, n);
            _errDist = 0;
        }

        private void SemErr(string msg)
        {
            if (_errDist >= MinErrDist) Errors.SemErr(_lastToken.Line, _lastToken.Col, msg);
            _errDist = 0;
        }

        private void Get()
        {
            for (;;)
            {
                _lastToken = _predictedToken;
                _predictedToken = _scanner.Scan();
                if (_predictedToken.Kind <= MaxT)
                {
                    ++_errDist;
                    break;
                }

                _predictedToken = _lastToken;
            }
        }

        private void Expect(int n)
        {
            if (_predictedToken.Kind == n) Get();
            else
            {
                SynErr(n);
            }
        }

        private bool StartOf(int s)
        {
            return _set[s, _predictedToken.Kind];
        }

        private void ExpectWeak(int n, int follow)
        {
            if (_predictedToken.Kind == n) Get();
            else
            {
                SynErr(n);
                while (!StartOf(follow)) Get();
            }
        }

        private bool WeakSeparator(int n, int syFol, int repFol)
        {
            int kind = _predictedToken.Kind;
            if (kind == n)
            {
                Get();
                return true;
            }
            else if (StartOf(repFol))
            {
                return false;
            }
            else
            {
                SynErr(n);
                while (!(_set[syFol, kind] || _set[repFol, kind] || _set[0, kind]))
                {
                    Get();
                    kind = _predictedToken.Kind;
                }
                return StartOf(syFol);
            }
        }

        private void Css3()
        {
            CssDoc = new CssDocument();
            string cset = null;

            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            while (_predictedToken.Kind == 5 || _predictedToken.Kind == 6)
            {
                if (_predictedToken.Kind == 5)
                {
                    Get();
                }
                else
                {
                    Get();
                }
            }
            while (StartOf(1))
            {
                if (StartOf(2))
                {
                    CssRuleSet rset = null;
                    RuleSet(out rset);
                    CssDoc.RuleSets.Add(rset);
                }
                else
                {
                    CssDirective dir = null;
                    Directive(out dir);
                    CssDoc.Directives.Add(dir);
                }
                while (_predictedToken.Kind == 5 || _predictedToken.Kind == 6)
                {
                    if (_predictedToken.Kind == 5)
                    {
                        Get();
                    }
                    else
                    {
                        Get();
                    }
                }
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
            }
        }

        private void RuleSet(out CssRuleSet rset)
        {
            rset = new CssRuleSet();
            CssSelectorSet sel = null;

            SelectorSet(out sel);
            rset.SelectorSet.Add(sel);
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            while (_predictedToken.Kind == 25)
            {
                Get();
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
                SelectorSet(out sel);
                rset.SelectorSet.Add(sel);
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
            }
            Expect(26);
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            if (StartOf(3))
            {
                CssDeclaration dec = null;
                Declaration(out dec);
                rset.Declarations.Add(dec);
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
                while (_predictedToken.Kind == 27)
                {
                    Get();
                    while (_predictedToken.Kind == 4)
                    {
                        Get();
                    }
                    if (_predictedToken.Val.Equals("}"))
                    {
                        Get();
                        return;
                    }

                    Declaration(out dec);
                    rset.Declarations.Add(dec);
                    while (_predictedToken.Kind == 4)
                    {
                        Get();
                    }
                }
                if (_predictedToken.Kind == 27)
                {
                    Get();
                    while (_predictedToken.Kind == 4)
                    {
                        Get();
                    }
                }
            }
            Expect(28);
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
        }

        private void Directive(out CssDirective dir)
        {
            dir = new CssDirective();
            string ident = null;

            Expect(23);
            dir.Name = "@";
            if (_predictedToken.Kind == 24)
            {
                Get();
                dir.Name += "-";
            }
            Identity(out ident);
            dir.Name += ident;
            switch (dir.Name.ToLower())
            {
                case "@media":
                    dir.Type = EnumDirectiveType.Media;
                    break;
                case "@import":
                    dir.Type = EnumDirectiveType.Import;
                    break;
                case "@charset":
                    dir.Type = EnumDirectiveType.Charset;
                    break;
                case "@page":
                    dir.Type = EnumDirectiveType.Page;
                    break;
                case "@font-face":
                    dir.Type = EnumDirectiveType.FontFace;
                    break;
                case "@namespace":
                    dir.Type = EnumDirectiveType.Namespace;
                    break;
                default:
                    dir.Type = EnumDirectiveType.Other;
                    break;
            }

            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            if (StartOf(4))
            {
                if (StartOf(5))
                {
                    EnumMedium m;
                    Medium(out m);
                    dir.Mediums.Add(m);
                    while (_predictedToken.Kind == 4)
                    {
                        Get();
                    }
                    while (_predictedToken.Kind == 25)
                    {
                        Get();
                        while (_predictedToken.Kind == 4)
                        {
                            Get();
                        }
                        Medium(out m);
                        dir.Mediums.Add(m);
                        while (_predictedToken.Kind == 4)
                        {
                            Get();
                        }
                    }
                }
                else
                {
                    CssExpression exp = null;
                    Expr(out exp);
                    dir.Expression = exp;
                    while (_predictedToken.Kind == 4)
                    {
                        Get();
                    }
                }
            }
            if (_predictedToken.Kind == 26)
            {
                Get();
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
                if (StartOf(6))
                {
                    while (StartOf(1))
                    {
                        if (dir.Type == EnumDirectiveType.Page || dir.Type == EnumDirectiveType.FontFace)
                        {
                            CssDeclaration dec = null;
                            Declaration(out dec);
                            dir.Declarations.Add(dec);
                            while (_predictedToken.Kind == 4)
                            {
                                Get();
                            }
                            while (_predictedToken.Kind == 27)
                            {
                                Get();
                                while (_predictedToken.Kind == 4)
                                {
                                    Get();
                                }
                                if (_predictedToken.Val.Equals("}"))
                                {
                                    Get();
                                    return;
                                }
                                Declaration(out dec);
                                dir.Declarations.Add(dec);
                                while (_predictedToken.Kind == 4)
                                {
                                    Get();
                                }
                            }
                            if (_predictedToken.Kind == 27)
                            {
                                Get();
                                while (_predictedToken.Kind == 4)
                                {
                                    Get();
                                }
                            }
                        }
                        else if (StartOf(2))
                        {
                            CssRuleSet rset = null;
                            RuleSet(out rset);
                            dir.RuleSets.Add(rset);
                            while (_predictedToken.Kind == 4)
                            {
                                Get();
                            }
                        }
                        else
                        {
                            CssDirective dr = null;
                            Directive(out dr);
                            dir.Directives.Add(dr);
                            while (_predictedToken.Kind == 4)
                            {
                                Get();
                            }
                        }
                    }
                }
                Expect(28);
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
            }
            else if (_predictedToken.Kind == 27)
            {
                Get();
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
            }
            else SynErr(50);
        }

        private void QuotedString(out string qs)
        {
            qs = "";
            char quote = '\n';
            if (_predictedToken.Kind == 7)
            {
                Get();
                quote = '\'';
                while (StartOf(7))
                {
                    Get();
                    qs += _lastToken.Val;
                    if (_predictedToken.Val.Equals("'") && !_lastToken.Val.Equals("\\"))
                    {
                        break;
                    }
                }
                Expect(7);
            }
            else if (_predictedToken.Kind == 8)
            {
                Get();
                quote = '"';
                while (StartOf(8))
                {
                    Get();
                    qs += _lastToken.Val;
                    if (_predictedToken.Val.Equals("\"") && !_lastToken.Val.Equals("\\"))
                    {
                        break;
                    }
                }
                Expect(8);
            }
            else SynErr(51);

        }

        private void Uri(out string url)
        {
            url = "";
            Expect(9);
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            if (_predictedToken.Kind == 10)
            {
                Get();
            }
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            if (_predictedToken.Kind == 7 || _predictedToken.Kind == 8)
            {
                QuotedString(out url);
            }
            else if (StartOf(9))
            {
                while (StartOf(10))
                {
                    Get();
                    url += _lastToken.Val;
                    if (_predictedToken.Val.Equals(")"))
                    {
                        break;
                    }
                }
            }
            else SynErr(52);
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            if (_predictedToken.Kind == 11)
            {
                Get();
            }
        }

        private void Medium(out EnumMedium m)
        {
            m = EnumMedium.All;
            switch (_predictedToken.Kind)
            {
                case 12:
                    {
                        Get();
                        m = EnumMedium.All;
                        break;
                    }
                case 13:
                    {
                        Get();
                        m = EnumMedium.Aural;
                        break;
                    }
                case 14:
                    {
                        Get();
                        m = EnumMedium.Braille;
                        break;
                    }
                case 15:
                    {
                        Get();
                        m = EnumMedium.Embossed;
                        break;
                    }
                case 16:
                    {
                        Get();
                        m = EnumMedium.Handheld;
                        break;
                    }
                case 17:
                    {
                        Get();
                        m = EnumMedium.Print;
                        break;
                    }
                case 18:
                    {
                        Get();
                        m = EnumMedium.Projection;
                        break;
                    }
                case 19:
                    {
                        Get();
                        m = EnumMedium.Screen;
                        break;
                    }
                case 20:
                    {
                        Get();
                        m = EnumMedium.Tty;
                        break;
                    }
                case 21:
                    {
                        Get();
                        m = EnumMedium.Tv;
                        break;
                    }
                default:
                    SynErr(53);
                    break;
            }
        }

        private void Identity(out string ident)
        {
            ident = "";
            switch (_predictedToken.Kind)
            {
                case 1:
                    {
                        Get();
                        break;
                    }
                case 22:
                    {
                        Get();
                        break;
                    }
                case 9:
                    {
                        Get();
                        break;
                    }
                case 12:
                    {
                        Get();
                        break;
                    }
                case 13:
                    {
                        Get();
                        break;
                    }
                case 14:
                    {
                        Get();
                        break;
                    }
                case 15:
                    {
                        Get();
                        break;
                    }
                case 16:
                    {
                        Get();
                        break;
                    }
                case 17:
                    {
                        Get();
                        break;
                    }
                case 18:
                    {
                        Get();
                        break;
                    }
                case 19:
                    {
                        Get();
                        break;
                    }
                case 20:
                    {
                        Get();
                        break;
                    }
                case 21:
                    {
                        Get();
                        break;
                    }
                default:
                    SynErr(54);
                    break;
            }
            ident += _lastToken.Val;
        }

        private void Expr(out CssExpression exp)
        {
            exp = new CssExpression();
            char? sep = null;
            CssTerm trm = null;

            Term(out trm);
            exp.Terms.Add(trm);
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            while (StartOf(11))
            {
                if (_predictedToken.Kind == 25 || _predictedToken.Kind == 46)
                {
                    if (_predictedToken.Kind == 46)
                    {
                        Get();
                        sep = '/';
                    }
                    else
                    {
                        Get();
                        sep = ',';
                    }
                    while (_predictedToken.Kind == 4)
                    {
                        Get();
                    }
                }
                Term(out trm);
                if (sep.HasValue)
                {
                    trm.Seperator = sep.Value;
                }
                exp.Terms.Add(trm);
                sep = null;

                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
            }
        }

        private void Declaration(out CssDeclaration dec)
        {
            dec = new CssDeclaration();
            CssExpression exp = null;
            string ident = "";

            if (_predictedToken.Kind == 24)
            {
                Get();
                dec.Name += "-";
            }
            Identity(out ident);
            dec.Name += ident;
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            Expect(43);
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            Expr(out exp);
            dec.Expression = exp;
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            if (_predictedToken.Kind == 44)
            {
                Get();
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
                Expect(45);
                dec.Important = true;
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
            }
        }

        private void SelectorSet(out CssSelectorSet sel)
        {
            sel = new CssSelectorSet();
            CssSelector ss = null;
            EnumCombinator? cb = null;

            Selector(out ss);
            sel.Selectors.Add(ss);
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            while (StartOf(12))
            {
                if (_predictedToken.Kind == 29 || _predictedToken.Kind == 30 || _predictedToken.Kind == 31)
                {
                    if (_predictedToken.Kind == 29)
                    {
                        Get();
                        cb = EnumCombinator.PrecededImmediatelyBy;
                    }
                    else if (_predictedToken.Kind == 30)
                    {
                        Get();
                        cb = EnumCombinator.ChildOf;
                    }
                    else
                    {
                        Get();
                        cb = EnumCombinator.PrecededBy;
                    }
                }
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
                Selector(out ss);
                if (cb.HasValue)
                {
                    ss.Combinator = cb.Value;
                }
                sel.Selectors.Add(ss);

                cb = null;
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
            }
        }

        private void Selector(out CssSelector ss)
        {
            ss = new CssSelector {ElementName = ""};
            string psd = null;
            CssAttribute atb = null;
            CssSelector parent = ss;
            string ident = null;

            if (StartOf(3))
            {
                if (_predictedToken.Kind == 24)
                {
                    Get();
                    ss.ElementName += "-";
                }
                Identity(out ident);
                ss.ElementName += ident;
            }
            else if (_predictedToken.Kind == 32)
            {
                Get();
                ss.ElementName = "*";
            }
            else if (StartOf(13))
            {
                if (_predictedToken.Kind == 33)
                {
                    Get();
                    if (_predictedToken.Kind == 24)
                    {
                        Get();
                        ss.Id = "-";
                    }
                    Identity(out ident);
                    if (ss.Id == null)
                    {
                        ss.Id = ident;
                    }
                    else
                    {
                        ss.Id += ident;
                    }
                }
                else if (_predictedToken.Kind == 34)
                {
                    Get();
                    ss.Class = "";
                    if (_predictedToken.Kind == 24)
                    {
                        Get();
                        ss.Class += "-";
                    }
                    Identity(out ident);
                    ss.Class += ident;
                }
                else if (_predictedToken.Kind == 35)
                {
                    Attribute(out atb);
                    ss.Attribute = atb;
                }
                else
                {
                    Pseudo(out psd);
                    ss.Pseudo = psd;
                }
            }
            else SynErr(55);
            while (StartOf(13))
            {
                CssSelector child = new CssSelector();
                if (_predictedToken.Kind == 33)
                {
                    Get();
                    if (_predictedToken.Kind == 24)
                    {
                        Get();
                        child.Id = "-";
                    }
                    Identity(out ident);
                    if (child.Id == null)
                    {
                        child.Id = ident;
                    }
                    else
                    {
                        child.Id += "-";
                    }
                }
                else if (_predictedToken.Kind == 34)
                {
                    Get();
                    child.Class = "";
                    if (_predictedToken.Kind == 24)
                    {
                        Get();
                        child.Class += "-";
                    }
                    Identity(out ident);
                    child.Class += ident;
                }
                else if (_predictedToken.Kind == 35)
                {
                    Attribute(out atb);
                    child.Attribute = atb;
                }
                else
                {
                    Pseudo(out psd);
                    child.Pseudo = psd;
                }
                parent.Child = child;
                parent = child;

            }
        }

        private void Attribute(out CssAttribute atb)
        {
            atb = new CssAttribute {Value = ""};
            string ident = null;

            Expect(35);
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            Identity(out ident);
            atb.Operand = ident;
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            if (StartOf(14))
            {
                switch (_predictedToken.Kind)
                {
                    case 36:
                        {
                            Get();
                            atb.Operator = EnumOperator.Equals;
                            break;
                        }
                    case 37:
                        {
                            Get();
                            atb.Operator = EnumOperator.InList;
                            break;
                        }
                    case 38:
                        {
                            Get();
                            atb.Operator = EnumOperator.Hyphenated;
                            break;
                        }
                    case 39:
                        {
                            Get();
                            atb.Operator = EnumOperator.EndsWith;
                            break;
                        }
                    case 40:
                        {
                            Get();
                            atb.Operator = EnumOperator.BeginsWith;
                            break;
                        }
                    case 41:
                        {
                            Get();
                            atb.Operator = EnumOperator.Contains;
                            break;
                        }
                }
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
                if (StartOf(3))
                {
                    if (_predictedToken.Kind == 24)
                    {
                        Get();
                        atb.Value += "-";
                    }
                    Identity(out ident);
                    atb.Value += ident;
                }
                else if (_predictedToken.Kind == 7 || _predictedToken.Kind == 8)
                {
                    string quote = null;
                    QuotedString(out quote);
                    atb.Value = quote;
                }
                else SynErr(56);
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
            }
            Expect(42);
        }

        private void Pseudo(out string pseudo)
        {
            pseudo = "";
            string ident = null;

            Expect(43);
            if (_predictedToken.Kind == 43)
            {
                Get();
            }
            while (_predictedToken.Kind == 4)
            {
                Get();
            }
            if (_predictedToken.Kind == 24)
            {
                Get();
                pseudo += "-";
            }
            Identity(out ident);
            pseudo += ident;
            if (_predictedToken.Kind == 10)
            {
                Get();
                pseudo += _lastToken.Val;
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
                CssExpression exp = null;
                Expr(out exp);
                pseudo += exp.ToString();
                while (_predictedToken.Kind == 4)
                {
                    Get();
                }
                Expect(11);
                pseudo += _lastToken.Val;
            }
        }

        private void Term(out CssTerm trm)
        {
            trm = new CssTerm();
            string val = "";
            string ident = null;

            if (_predictedToken.Kind == 7 || _predictedToken.Kind == 8)
            {
                QuotedString(out val);
                trm.Value = val;
                trm.Type = EnumTermType.String;
            }
            else if (_predictedToken.Kind == 9)
            {
                Uri(out val);
                trm.Value = val;
                trm.Type = EnumTermType.Url;
            }
            else if (_predictedToken.Kind == 47)
            {
                Get();
                Identity(out ident);
                trm.Value = "U\\" + ident;
                trm.Type = EnumTermType.Unicode;
            }
            else if (_predictedToken.Kind == 33)
            {
                HexValue(out val);
                trm.Value = val;
                trm.Type = EnumTermType.Hex;
            }
            else if (StartOf(15))
            {
                bool minus = false;
                if (_predictedToken.Kind == 24)
                {
                    Get();
                    minus = true;
                }
                if (StartOf(16))
                {
                    Identity(out ident);
                    trm.Value = ident;
                    trm.Type = EnumTermType.String;
                    if (minus)
                    {
                        trm.Value = "-" + trm.Value;
                    }
                    while (_predictedToken.Kind == 4)
                    {
                        Get();
                    }
                    if (StartOf(17))
                    {
                        while (_predictedToken.Kind == 34 || _predictedToken.Kind == 36 || _predictedToken.Kind == 43)
                        {
                            if (_predictedToken.Kind == 43)
                            {
                                Get();
                                trm.Value += _lastToken.Val;
                                if (StartOf(18))
                                {
                                    if (_predictedToken.Kind == 43)
                                    {
                                        Get();
                                        trm.Value += _lastToken.Val;
                                    }
                                    if (_predictedToken.Kind == 24)
                                    {
                                        Get();
                                        trm.Value += _lastToken.Val;
                                    }
                                    Identity(out ident);
                                    trm.Value += ident;
                                }
                                else if (_predictedToken.Kind == 33)
                                {
                                    HexValue(out val);
                                    trm.Value += val;
                                }
                                else if (StartOf(19))
                                {
                                    while (_predictedToken.Kind == 3)
                                    {
                                        Get();
                                        trm.Value += _lastToken.Val;
                                    }
                                    if (_predictedToken.Kind == 34)
                                    {
                                        Get();
                                        trm.Value += ".";
                                        while (_predictedToken.Kind == 3)
                                        {
                                            Get();
                                            trm.Value += _lastToken.Val;
                                        }
                                    }
                                }
                                else SynErr(57);
                            }
                            else if (_predictedToken.Kind == 34)
                            {
                                Get();
                                trm.Value += _lastToken.Val;
                                if (_predictedToken.Kind == 24)
                                {
                                    Get();
                                    trm.Value += _lastToken.Val;
                                }
                                Identity(out ident);
                                trm.Value += ident;
                            }
                            else
                            {
                                Get();
                                trm.Value += _lastToken.Val;
                                while (_predictedToken.Kind == 4)
                                {
                                    Get();
                                }
                                if (_predictedToken.Kind == 24)
                                {
                                    Get();
                                    trm.Value += _lastToken.Val;
                                }
                                if (StartOf(16))
                                {
                                    Identity(out ident);
                                    trm.Value += ident;
                                }
                                else if (StartOf(19))
                                {
                                    while (_predictedToken.Kind == 3)
                                    {
                                        Get();
                                        trm.Value += _lastToken.Val;
                                    }
                                }
                                else SynErr(58);
                            }
                        }
                    }
                    if (_predictedToken.Kind == 10)
                    {
                        Get();
                        while (_predictedToken.Kind == 4)
                        {
                            Get();
                        }
                        CssExpression exp = null;
                        Expr(out exp);
                        CssFunction func = new CssFunction {Name = trm.Value, Expression = exp};
                        trm.Value = null;
                        trm.Function = func;
                        trm.Type = EnumTermType.Function;

                        while (_predictedToken.Kind == 4)
                        {
                            Get();
                        }
                        Expect(11);
                    }
                }
                else if (StartOf(15))
                {
                    if (_predictedToken.Kind == 29)
                    {
                        Get();
                        trm.Sign = '+';
                    }
                    if (minus)
                    {
                        trm.Sign = '-';
                    }
                    while (_predictedToken.Kind == 3)
                    {
                        Get();
                        val += _lastToken.Val;
                    }
                    if (_predictedToken.Kind == 34)
                    {
                        Get();
                        val += _lastToken.Val;
                        while (_predictedToken.Kind == 3)
                        {
                            Get();
                            val += _lastToken.Val;
                        }
                    }
                    if (StartOf(20))
                    {
                        if (_predictedToken.Val.ToLower().Equals("n"))
                        {
                            Expect(22);
                            val += _lastToken.Val;
                            if (_predictedToken.Kind == 24 || _predictedToken.Kind == 29)
                            {
                                if (_predictedToken.Kind == 29)
                                {
                                    Get();
                                    val += _lastToken.Val;
                                }
                                else
                                {
                                    Get();
                                    val += _lastToken.Val;
                                }
                                Expect(3);
                                val += _lastToken.Val;
                                while (_predictedToken.Kind == 3)
                                {
                                    Get();
                                    val += _lastToken.Val;
                                }
                            }
                        }
                        else if (_predictedToken.Kind == 48)
                        {
                            Get();
                            trm.Unit = EnumUnit.Percent;
                        }
                        else
                        {
                            if (IsUnit())
                            {
                                Identity(out ident);
                                try
                                {
                                    trm.Unit = (EnumUnit) Enum.Parse(typeof (EnumUnit), ident, true);
                                }
                                catch
                                {
                                    Errors.SemErr(_lastToken.Line, _lastToken.Col, string.Format("Unrecognized unit '{0}'", ident));
                                }

                            }
                        }
                    }
                    trm.Value = val;
                    trm.Type = EnumTermType.Number;
                }
                else SynErr(59);
            }
            else SynErr(60);
        }

        private void HexValue(out string val)
        {
            val = "";
            bool found = false;

            Expect(33);
            val += _lastToken.Val;
            if (StartOf(19))
            {
                while (_predictedToken.Kind == 3)
                {
                    Get();
                    val += _lastToken.Val;
                }
            }
            else if (PartOfHex(val))
            {
                Expect(1);
                val += _lastToken.Val;
                found = true;
            }
            else SynErr(61);
            if (!found && PartOfHex(val))
            {
                Expect(1);
                val += _lastToken.Val;
            }
        }

        #endregion Private Methods
    }

    public delegate void ParserMessage(string msg);

    public class Errors
    {
        #region Instance Variables

        private event ParserMessage OnError;
        private event ParserMessage OnWarning;
        private int _count = 0; // number of errors detected
        private const string ErrMsgFormat = "-- line {0} col {1}: {2}"; // 0=line, 1=column, 2=text
        private TextWriter _errorStream = Console.Out; // error messages go to this stream

        #endregion Instance Variables

        #region Instance Properties

        public TextWriter ErrorStream
        {
            get { return _errorStream; }
            set { _errorStream = value; }
        }

        #endregion Instance Properties

        #region Instance Methods

        public void SynErr(int line, int col, int n)
        {
            string s;
            switch (n)
            {
                case 0:
                    s = "EOF expected";
                    break;
                case 1:
                    s = "ident expected";
                    break;
                case 2:
                    s = "newline expected";
                    break;
                case 3:
                    s = "digit expected";
                    break;
                case 4:
                    s = "whitespace expected";
                    break;
                case 5:
                    s = "\"<!--\" expected";
                    break;
                case 6:
                    s = "\"-->\" expected";
                    break;
                case 7:
                    s = "\"\'\" expected";
                    break;
                case 8:
                    s = "\"\"\" expected";
                    break;
                case 9:
                    s = "\"url\" expected";
                    break;
                case 10:
                    s = "\"(\" expected";
                    break;
                case 11:
                    s = "\")\" expected";
                    break;
                case 12:
                    s = "\"all\" expected";
                    break;
                case 13:
                    s = "\"aural\" expected";
                    break;
                case 14:
                    s = "\"braille\" expected";
                    break;
                case 15:
                    s = "\"embossed\" expected";
                    break;
                case 16:
                    s = "\"handheld\" expected";
                    break;
                case 17:
                    s = "\"print\" expected";
                    break;
                case 18:
                    s = "\"projection\" expected";
                    break;
                case 19:
                    s = "\"screen\" expected";
                    break;
                case 20:
                    s = "\"tty\" expected";
                    break;
                case 21:
                    s = "\"tv\" expected";
                    break;
                case 22:
                    s = "\"n\" expected";
                    break;
                case 23:
                    s = "\"@\" expected";
                    break;
                case 24:
                    s = "\"-\" expected";
                    break;
                case 25:
                    s = "\",\" expected";
                    break;
                case 26:
                    s = "\"{\" expected";
                    break;
                case 27:
                    s = "\";\" expected";
                    break;
                case 28:
                    s = "\"}\" expected";
                    break;
                case 29:
                    s = "\"+\" expected";
                    break;
                case 30:
                    s = "\">\" expected";
                    break;
                case 31:
                    s = "\"~\" expected";
                    break;
                case 32:
                    s = "\"*\" expected";
                    break;
                case 33:
                    s = "\"#\" expected";
                    break;
                case 34:
                    s = "\".\" expected";
                    break;
                case 35:
                    s = "\"[\" expected";
                    break;
                case 36:
                    s = "\"=\" expected";
                    break;
                case 37:
                    s = "\"~=\" expected";
                    break;
                case 38:
                    s = "\"|=\" expected";
                    break;
                case 39:
                    s = "\"$=\" expected";
                    break;
                case 40:
                    s = "\"^=\" expected";
                    break;
                case 41:
                    s = "\"*=\" expected";
                    break;
                case 42:
                    s = "\"]\" expected";
                    break;
                case 43:
                    s = "\":\" expected";
                    break;
                case 44:
                    s = "\"!\" expected";
                    break;
                case 45:
                    s = "\"important\" expected";
                    break;
                case 46:
                    s = "\"/\" expected";
                    break;
                case 47:
                    s = "\"U\\\\\" expected";
                    break;
                case 48:
                    s = "\"%\" expected";
                    break;
                case 49:
                    s = "??? expected";
                    break;
                case 50:
                    s = "invalid directive";
                    break;
                case 51:
                    s = "invalid QuotedString";
                    break;
                case 52:
                    s = "invalid URI";
                    break;
                case 53:
                    s = "invalid medium";
                    break;
                case 54:
                    s = "invalid identity";
                    break;
                case 55:
                    s = "invalid simpleselector";
                    break;
                case 56:
                    s = "invalid attrib";
                    break;
                case 57:
                    s = "invalid term";
                    break;
                case 58:
                    s = "invalid term";
                    break;
                case 59:
                    s = "invalid term";
                    break;
                case 60:
                    s = "invalid term";
                    break;
                case 61:
                    s = "invalid HexValue";
                    break;

                default:
                    s = "error " + n;
                    break;
            }
            ErrorStream.WriteLine(ErrMsgFormat, line, col, s);
            if (OnError != null)
            {
                OnError(string.Format(ErrMsgFormat, line, col, s));
            }
            _count++;
        }

        public void SemErr(int line, int col, string s)
        {
            ErrorStream.WriteLine(ErrMsgFormat, line, col, s);
            if (OnError != null)
            {
                OnError(string.Format(ErrMsgFormat, line, col, s));
            }
            _count++;
        }

        public void SemErr(string s)
        {
            ErrorStream.WriteLine(s);
            if (OnError != null)
            {
                OnError(s);
            }
            _count++;
        }

        public void Warning(int line, int col, string s)
        {
            ErrorStream.WriteLine(ErrMsgFormat, line, col, s);
            if (OnWarning != null)
            {
                OnWarning(string.Format(ErrMsgFormat, line, col, s));
            }
        }

        public void Warning(string s)
        {
            ErrorStream.WriteLine(s);
            if (OnWarning != null)
            {
                OnWarning(s);
            }
        }

        #endregion Instance Methods
    }

    public class FatalError : Exception
    {
        public FatalError(string m) : base(m)
        {
        }
    }
}