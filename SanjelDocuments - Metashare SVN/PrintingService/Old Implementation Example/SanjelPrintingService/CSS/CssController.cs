
using System.Collections.Generic;
using System.Text;
using System.IO;
using Sanjel.PrintingService.CSS.Interpreter;
using Sanjel.PrintingService.CSS.Model;
using Sanjel.PrintingService.CSS.Parser;

namespace Sanjel.PrintingService.CSS
{
    public class CssController
    {
        #region Instance Variables

        private List<string> _errors = new List<string>();
        private CssDocument _document;

        #endregion Instance Variables

        #region Instance Properties

        public List<string> Errors
        {
            get { return _errors; }
        }

        #endregion Instance Properties

        #region Constructor

        public CssController(string file)
        {
            ParseFile(file);
        }

        #endregion Constructor

        #region Public Methods

        public List<CssInterpreterModel> GetInterpreterModels(string elementName, string idName, List<string> classNames)
        {
            if (_document == null)
            {
                return null;
            }

            CssRuleSetFinder finder = new CssRuleSetFinder(elementName, idName, classNames);
            finder.FindRuleSets(_document.RuleSets);
            CssDisassemblerControl.Instance.DisassembleExpression(finder.RuleSets);
            List<CssInterpreterModel> interpreterModels = CssInterpreterControl.Instance.BuildInterpreterModels(CssDisassemblerControl.Instance.Declarations);
            return interpreterModels;
        }

        #endregion Public Methods

        #region Private Methods

        private void ParseFile(string file)
        {
            StringBuilder sb = new StringBuilder();
            TextWriter errorCatch = new StringWriter(sb);
            CssScanner scanner = new CssScanner(file);
            CssParser parser = new CssParser(scanner) { Errors = { ErrorStream = errorCatch } };
            parser.Parse();
            _document = parser.CssDoc;
            SpitErrors(sb);
        }

        private List<Token> GetTokens(string file)
        {
            CssScanner scanner = new CssScanner(file);
            List<Token> ts = new List<Token>();
            Token t = scanner.Scan();
            if (t.Val != "\0") { ts.Add(t); }
            while (t.Val != "\0")
            {
                t = scanner.Scan();
                ts.Add(t);
            }
            return ts;
        }

        private CssDocument ParseText(string content)
        {
            MemoryStream mem = new MemoryStream();
            byte[] bytes = Encoding.ASCII.GetBytes(content);
            mem.Write(bytes, 0, bytes.Length);
            return ParseStream(mem);
        }

        private CssDocument ParseStream(Stream stream)
        {
            StringBuilder sb = new StringBuilder();
            TextWriter errorCatch = new StringWriter(sb);
            CssScanner scanner = new CssScanner(stream);
            CssParser parser = new CssParser(scanner) {Errors = {ErrorStream = errorCatch}};
            parser.Parse();
            _document = parser.CssDoc;
            SpitErrors(sb);
            return _document;
        }

        private void SpitErrors(StringBuilder sb)
        {
            _errors = new List<string>();
            string text = sb.ToString().Replace("\r", "");
            if (text.Length == 0) { return; }
            string[] lines = text.Split('\n');
            foreach (string line in lines)
            {
                _errors.Add(line);
            }
        }

        #endregion Private Methods
    }
}