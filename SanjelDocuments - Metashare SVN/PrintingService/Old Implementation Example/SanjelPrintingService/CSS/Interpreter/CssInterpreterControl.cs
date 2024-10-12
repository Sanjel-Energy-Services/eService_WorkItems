
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;

using Sanjel.PrintingService.CSS.Model;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public class CssBinding
    {
        public Type InterpreterType { get; set; }
        public Type ValueType { get; set; }
        public List<string> ValueBindings { get; set; }
        public List<string> UnitBindings { get; set; }

        public CssBinding(Type interpreterType, Type valueType, List<string> values, List<string> uints = null)
        {
            ValueType = valueType;
            InterpreterType = interpreterType;
            ValueBindings = values;
            UnitBindings = uints ?? new List<string>();
        }
    }

    public class CssInterpreterControl
    {
        #region Singleton

        private static readonly CssInterpreterControl _instance = new CssInterpreterControl();

        public static CssInterpreterControl Instance { get { return _instance; } }

        /// <summary>
        /// key is declaration ID of CSS declaration
        /// </summary>
        public static Dictionary<string, CssBinding> Bindings { get; set; }

        #endregion Singleton

        #region Constructor

        private CssInterpreterControl()
        {
            Bindings = new Dictionary<string, CssBinding>();

            #region Line Group

            Bindings.Add("line-width",          new CssBinding(typeof(CssBorderWidthInterpreter),   typeof(double),          new List<string> { "Line.Width" }));
            Bindings.Add("line-style",          new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumBorderStyle), new List<string> { "Line.Style" }));
            Bindings.Add("line-color",          new CssBinding(typeof(CssColorInterpreter),         typeof(Color),           new List<string> { "Line.Color" }));

            #endregion Line Group

            #region Background Group

            Bindings.Add("background-color",    new CssBinding(typeof(CssColorInterpreter),         typeof(Color),           new List<string> { "Background.Color" }));

            #endregion Background Group

            #region Block Group

            Bindings.Add("width",               new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Width" }));
            Bindings.Add("height",              new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Height" }));
            Bindings.Add("top",                 new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "OriginY" }));
            Bindings.Add("left",                new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "OriginX" }));

            #endregion Block Group

            #region Border Group

            Bindings.Add("border-width",        new CssBinding(typeof(CssBorderWidthInterpreter),   typeof(double),          new List<string> { "Border.Width",
                                                                                                                                                "Border.Top.Width",
                                                                                                                                                "Border.Left.Width",
                                                                                                                                                "Border.Bottom.Width",
                                                                                                                                                "Border.Right.Width"}));
            Bindings.Add("border-top-width",    new CssBinding(typeof(CssBorderWidthInterpreter),   typeof(double),          new List<string> { "Border.Top.Width" }));
            Bindings.Add("border-left-width",   new CssBinding(typeof(CssBorderWidthInterpreter),   typeof(double),          new List<string> { "Border.Left.Width" }));
            Bindings.Add("border-bottom-width", new CssBinding(typeof(CssBorderWidthInterpreter),   typeof(double),          new List<string> { "Border.Bottom.Width" }));
            Bindings.Add("border-right-width",  new CssBinding(typeof(CssBorderWidthInterpreter),   typeof(double),          new List<string> { "Border.Right.Width" }));
            Bindings.Add("border-style",        new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumBorderStyle), new List<string> { "Border.Style",
                                                                                                                                                "Border.Top.Style",
                                                                                                                                                "Border.Left.Style",
                                                                                                                                                "Border.Bottom.Style",
                                                                                                                                                "Border.Right.Style"}));
            Bindings.Add("border-top-style",    new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumBorderStyle), new List<string> { "Border.Top.Style" }));
            Bindings.Add("border-left-style",   new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumBorderStyle), new List<string> { "Border.Left.Style" }));
            Bindings.Add("border-bottom-style", new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumBorderStyle), new List<string> { "Border.Bottom.Style" }));
            Bindings.Add("border-right-style",  new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumBorderStyle), new List<string> { "Border.Right.Style" }));
            Bindings.Add("border-color",        new CssBinding(typeof(CssColorInterpreter),         typeof(Color),           new List<string> { "Border.Color",
                                                                                                                                                "Border.Top.Color",
                                                                                                                                                "Border.Left.Color",
                                                                                                                                                "Border.Bottom.Color",
                                                                                                                                                "Border.Right.Color"}));
            Bindings.Add("border-top-color",    new CssBinding(typeof(CssColorInterpreter),         typeof(Color),           new List<string> { "Border.Top.Color" }));
            Bindings.Add("border-left-color",   new CssBinding(typeof(CssColorInterpreter),         typeof(Color),           new List<string> { "Border.Left.Color" }));
            Bindings.Add("border-bottom-color", new CssBinding(typeof(CssColorInterpreter),         typeof(Color),           new List<string> { "Border.Bottom.Color" }));
            Bindings.Add("border-right-color",  new CssBinding(typeof(CssColorInterpreter),         typeof(Color),           new List<string> { "Border.Right.Color" }));

            #endregion Border Group

            #region Box Model Group

            Bindings.Add("margin-top",          new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Margin.Top" }));
            Bindings.Add("margin-left",         new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Margin.Left" }));
            Bindings.Add("margin-bottom",       new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Margin.Bottom" }));
            Bindings.Add("margin-right",        new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Margin.Right" }));

            Bindings.Add("padding-top",         new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Padding.Top" }));
            Bindings.Add("padding-left",        new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Padding.Left" }));
            Bindings.Add("padding-bottom",      new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Padding.Bottom" }));
            Bindings.Add("padding-right",       new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "Padding.Right" }));

            #endregion Box Model Group

            #region Font Group

            Bindings.Add("font-family",         new CssBinding(typeof(CssTextInterpreter),          typeof(string),          new List<string> { "TextFont.Name" }));
            Bindings.Add("font-size",           new CssBinding(typeof(CssNumberInterpreter),        typeof(double),          new List<string> { "TextFont.Size" }));
            Bindings.Add("font-style",          new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumFontStyle),   new List<string> { "TextFont.Style" }));
            Bindings.Add("font-weight",         new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumFontWeight),  new List<string> { "TextFont.Weight" }));

            #endregion Font Group

            #region Text Group

            Bindings.Add("color",               new CssBinding(typeof(CssColorInterpreter),         typeof(Color),                   new List<string> { "TextFormat.Color" }));
            Bindings.Add("line-height",         new CssBinding(typeof(CssNumberInterpreter),        typeof(double),                  new List<string> { "TextFormat.LineSpacing" }));
            Bindings.Add("orientation",         new CssBinding(typeof(CssNumberInterpreter),        typeof(double),                  new List<string> { "TextFormat.Orientation" }));
            Bindings.Add("text-align",          new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumHorizontalAlignment), new List<string> { "TextFormat.HorAlignment" }));
            Bindings.Add("text-decoration",     new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumFontDecoration),      new List<string> { "TextFont.Decoration" }));
            Bindings.Add("vertical-align",      new CssBinding(typeof(CssEnumInterpreter),          typeof(EnumVerticalAlignment),   new List<string> { "TextFormat.VerAlignment" }));

            #endregion Text Group
        }

        #endregion Constructor

        public List<CssInterpreterModel> BuildInterpreterModels(List<KeyValuePair<string, CssTerm>> pairs)
        {
            return (from pair in pairs where Bindings.ContainsKey(pair.Key.ToLower()) select new CssInterpreterModel(pair.Value, Bindings[pair.Key])).ToList();
        }
    }
}
