
using System;
using Sanjel.PrintingService.CSS.Model;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public interface ICssInterpreter
    {
        ValueUnitPair InterpretTerm(Type targetType, CssTerm term);
    }

    #region Common Group

    // color
    public class CssColorInterpreter : ICssInterpreter
    {
        private static readonly CssColorInterpreter _instance = new CssColorInterpreter();

        public static CssColorInterpreter Instance
        {
            get { return _instance; }
        }

        public ValueUnitPair InterpretTerm(Type targetType, CssTerm term)
        {
            return new ValueUnitPair(CssInterpreterUtilities.TryParseColor(term));
        }
    }

    // enum
    public class CssEnumInterpreter : ICssInterpreter
    {
        private static readonly CssEnumInterpreter _instance = new CssEnumInterpreter();

        public static CssEnumInterpreter Instance
        {
            get { return _instance; }
        }

        public ValueUnitPair InterpretTerm(Type targetType, CssTerm term)
        {
            var method = typeof (CssInterpreterUtilities).GetMethod("TryParseEnumText");
            object target = method.MakeGenericMethod(targetType).Invoke(null, new object[] {term.Value});
            return new ValueUnitPair(target);
        }
    }

    // number
    public class CssNumberInterpreter : ICssInterpreter
    {
        private static readonly CssNumberInterpreter _instance = new CssNumberInterpreter();

        public static CssNumberInterpreter Instance
        {
            get { return _instance; }
        }

        public ValueUnitPair InterpretTerm(Type targetType, CssTerm term)
        {
            double spacing;
            Double.TryParse(term.Value, out spacing);
            return new ValueUnitPair(spacing);
        }
    }

    // text
    public class CssTextInterpreter : ICssInterpreter
    {
        private static readonly CssTextInterpreter _instance = new CssTextInterpreter();

        public static CssTextInterpreter Instance
        {
            get { return _instance; }
        }

        public ValueUnitPair InterpretTerm(Type targetType, CssTerm term)
        {
            return new ValueUnitPair(term.Value);
        }
    }

    #endregion Common Group

    #region Special Group

    // number + text
    public class CssBorderWidthInterpreter : ICssInterpreter
    {
        private static readonly CssBorderWidthInterpreter _instance = new CssBorderWidthInterpreter();

        public static CssBorderWidthInterpreter Instance
        {
            get { return _instance; }
        }

        public ValueUnitPair InterpretTerm(Type targetType, CssTerm term)
        {
            if (term.Type == EnumTermType.Number)
            {
                double width;
                Double.TryParse(term.Value, out width);
                EnumLengthUnit unit = CssInterpreterUtilities.FromCssUnit(term.Unit);
                return new ValueUnitPair(width, unit);
            }
            if (term.Type == EnumTermType.String)
            {
                double width = 0;
                if (String.Compare(term.Value, "Thin", StringComparison.OrdinalIgnoreCase) == 0)
                {
                    width = CssInterpreterUtilities.ThinWidth;
                }
                else if (String.Compare(term.Value, "Medium", StringComparison.OrdinalIgnoreCase) == 0)
                {
                    width = CssInterpreterUtilities.MediumWidth;
                }
                else if (String.Compare(term.Value, "Thick", StringComparison.OrdinalIgnoreCase) == 0)
                {
                    width = CssInterpreterUtilities.ThickWidth;
                }
                return new ValueUnitPair(width, EnumLengthUnit.Pixel);
            }
            return null;
        }
    }

    #endregion Special Group
}

