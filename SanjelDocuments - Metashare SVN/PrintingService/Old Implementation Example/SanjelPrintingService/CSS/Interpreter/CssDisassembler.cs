
using System.Collections.Generic;

using Sanjel.PrintingService.CSS.Model;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public interface ICssDisassembler
    {
        List<KeyValuePair<string, CssTerm>> DisassembleExpression(CssDeclaration declaration);
    }

    public class CssLineDisassembler : ICssDisassembler
    {
        private static readonly CssLineDisassembler _instance = new CssLineDisassembler();

        public static CssLineDisassembler Instance
        {
            get { return _instance; }
        }

        public List<KeyValuePair<string, CssTerm>> DisassembleExpression(CssDeclaration declaration)
        {
            List<KeyValuePair<string, CssTerm>> pairs = new List<KeyValuePair<string, CssTerm>>();
            switch (declaration.Expression.Terms.Count)
            {
                case 3:
                    pairs.Add(new KeyValuePair<string, CssTerm>("line-" + "width", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("line-" + "style", declaration.Expression.Terms[1]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("line-" + "color", declaration.Expression.Terms[2]));
                    break;
            }

            return pairs;
        }
    }

    public class CssBorderDisassembler : ICssDisassembler
    {
        private static readonly CssBorderDisassembler _instance = new CssBorderDisassembler();

        public static CssBorderDisassembler Instance
        {
            get { return _instance; }
        }

        public List<KeyValuePair<string, CssTerm>> DisassembleExpression(CssDeclaration declaration)
        {
            string groupName = "";
            string[] names = declaration.Name.Split('-');
            if (names.Length > 1)
            {
                groupName = names[1] + "-";
            }

            List<KeyValuePair<string, CssTerm>> pairs = new List<KeyValuePair<string, CssTerm>>();
            switch (declaration.Expression.Terms.Count)
            {
                case 3:
                    pairs.Add(new KeyValuePair<string, CssTerm>("border-" + groupName + "width", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("border-" + groupName + "style", declaration.Expression.Terms[1]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("border-" + groupName + "color", declaration.Expression.Terms[2]));
                    break;
            }

            return pairs;
        }
    }

    public class CssMarginDisassembler : ICssDisassembler
    {
        private static readonly CssMarginDisassembler _instance = new CssMarginDisassembler();

        public static CssMarginDisassembler Instance
        {
            get { return _instance; }
        }

        public List<KeyValuePair<string, CssTerm>> DisassembleExpression(CssDeclaration declaration)
        {
            List<KeyValuePair<string, CssTerm>> pairs = new List<KeyValuePair<string, CssTerm>>();
            switch (declaration.Expression.Terms.Count)
            {
                case 4:
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-top", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-right", declaration.Expression.Terms[1]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-bottom", declaration.Expression.Terms[2]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-left", declaration.Expression.Terms[3]));
                    break;
                case 3:
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-top", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-right", declaration.Expression.Terms[1]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-bottom", declaration.Expression.Terms[2]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-left", declaration.Expression.Terms[1]));
                    break;
                case 2:
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-top", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-right", declaration.Expression.Terms[1]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-bottom", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-left", declaration.Expression.Terms[1]));
                    break;
                case 1:
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-top", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-right", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-bottom", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("margin-left", declaration.Expression.Terms[0]));
                    break;
            }
            return pairs;
        }
    }

    public class CssPaddingDisassembler : ICssDisassembler
    {
        private static readonly CssPaddingDisassembler _instance = new CssPaddingDisassembler();

        public static CssPaddingDisassembler Instance
        {
            get { return _instance; }
        }

        public List<KeyValuePair<string, CssTerm>> DisassembleExpression(CssDeclaration declaration)
        {
            List<KeyValuePair<string, CssTerm>> pairs = new List<KeyValuePair<string, CssTerm>>();
            switch (declaration.Expression.Terms.Count)
            {
                case 4:
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-top", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-right", declaration.Expression.Terms[1]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-bottom", declaration.Expression.Terms[2]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-left", declaration.Expression.Terms[3]));
                    break;
                case 3:
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-top", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-right", declaration.Expression.Terms[1]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-bottom", declaration.Expression.Terms[2]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-left", declaration.Expression.Terms[1]));
                    break;
                case 2:
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-top", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-right", declaration.Expression.Terms[1]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-bottom", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-left", declaration.Expression.Terms[1]));
                    break;
                case 1:
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-top", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-right", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-bottom", declaration.Expression.Terms[0]));
                    pairs.Add(new KeyValuePair<string, CssTerm>("padding-left", declaration.Expression.Terms[0]));
                    break;
            }
            return pairs;
        }
    }
}
