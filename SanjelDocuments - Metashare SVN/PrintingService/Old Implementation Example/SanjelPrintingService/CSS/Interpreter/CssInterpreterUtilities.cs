
using System;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Reflection;
using Sanjel.PrintingService.CSS.Model;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.CSS.Interpreter
{
    public class CssInterpreterUtilities
    {
        public static double ThinWidth = 0.3;
        public static double MediumWidth = 1.2;
        public static double ThickWidth = 2.0;

        public static EnumLengthUnit FromCssUnit(EnumUnit? unit)
        {
            switch (unit)
            {
                case EnumUnit.None:
                    return EnumLengthUnit.None;
                case EnumUnit.Percent:
                    return EnumLengthUnit.Percent;
                case EnumUnit.IN:
                    return EnumLengthUnit.Inch;
                case EnumUnit.CM:
                    return EnumLengthUnit.Cm;
                case EnumUnit.PX:
                    return EnumLengthUnit.Pixel;
                default:
                    return EnumLengthUnit.None;
            }
        }

        public static PropertyInfo GetPropertyByPath(Type propertyType, string propertyPath)
        {
            PropertyInfo propertyInfo = null;
            Type type = propertyType;
            foreach (string propertyName in propertyPath.Split('.'))
            {
                propertyInfo = type.GetProperty(propertyName);
                type = propertyInfo.PropertyType;
            }
            return propertyInfo;
        }

        public static bool SetPropertyValueByPath(object target, object source, string propertyPath)
        {
            if (target != null && propertyPath != null)
            {
                PropertyInfo propertyInfo = null;
                Type type = target.GetType();
                object currentTarget = target;
                object lastTarget = target;
                foreach (string propertyName in propertyPath.Split('.'))
                {
                    propertyInfo = type.GetProperty(propertyName);
                    if (propertyInfo == null)
                    {
                        break;
                    }

                    lastTarget = currentTarget;
                    currentTarget = propertyInfo.GetValue(lastTarget, null);
                    type = propertyInfo.PropertyType;
                }

                if (propertyInfo != null)
                {
                    propertyInfo.SetValue(lastTarget, source, null);
                    return true;
                }
            }
            return false;
        }

        public static TEnum TryParseEnumText<TEnum>(string enumText)
            where TEnum : struct
        {
            TEnum result;
            return Enum.TryParse(enumText, true, out result) ? result : default(TEnum);
        }

        #region Color Static Members

        public static bool IsColor(CssTerm term)
        {
            if (((term.Type == EnumTermType.Hex) || (term.Type == EnumTermType.String && term.Value.StartsWith("#")))
                && (term.Value.Length == 6 || term.Value.Length == 3 || ((term.Value.Length == 7 || term.Value.Length == 4)
                                                             && term.Value.StartsWith("#"))))
            {
                return term.Value.All(c =>
                        char.IsDigit(c) || c == '#' || c == 'a' || c == 'A' || c == 'b' || c == 'B' || c == 'c' ||
                        c == 'C' || c == 'd' || c == 'D' || c == 'e' || c == 'E' || c == 'f' || c == 'F');
            }
            if (term.Type == EnumTermType.String)
            {
                bool number = term.Value.All(char.IsDigit);
                if (number)
                {
                    return false;
                }

                try
                {
                    KnownColor kc = (KnownColor)Enum.Parse(typeof(KnownColor), term.Value, true);
                    return true;
                }
                catch
                {
                    ;
                }
            }
            else if (term.Type == EnumTermType.Function)
            {
                if ((term.Function.Name.ToLower().Equals("rgb") && term.Function.Expression.Terms.Count == 3)
                    || (term.Function.Name.ToLower().Equals("rgba") && term.Function.Expression.Terms.Count == 4)
                    )
                {
                    return term.Function.Expression.Terms.All(t => t.Type == EnumTermType.Number);
                }
                if ((term.Function.Name.ToLower().Equals("hsl") && term.Function.Expression.Terms.Count == 3)
                         || (term.Function.Name.ToLower().Equals("hsla") && term.Function.Expression.Terms.Count == 4)
                    )
                {
                    return term.Function.Expression.Terms.All(t => t.Type == EnumTermType.Number);
                }
            }
            return false;
        }

        public static int GetRgbValue(CssTerm term)
        {
            try
            {
                if (term.Unit.HasValue && term.Unit.Value == EnumUnit.Percent)
                {
                    return (int)(255f * float.Parse(term.Value) / 100f);
                }
                return int.Parse(term.Value);
            }
            catch
            {
                ;
            }
            return 0;
        }

        public static int GetHueValue(CssTerm term)
        {
            // 0 - 360
            try
            {
                return (int)(float.Parse(term.Value) * 255f / 360f);
            }
            catch
            {
                ;
            }
            return 0;
        }

        public static Color TryParseColor(CssTerm term)
        {
            string hex = "000000";
            switch (term.Type)
            {
                case EnumTermType.Hex:
                    if ((term.Value.Length == 7 || term.Value.Length == 4) && term.Value.StartsWith("#"))
                    {
                        hex = term.Value.Substring(1);
                    }
                    else if (term.Value.Length == 6 || term.Value.Length == 3)
                    {
                        hex = term.Value;
                    }
                    break;
                case EnumTermType.Function:
                    if ((term.Function.Name.ToLower().Equals("rgb") && term.Function.Expression.Terms.Count == 3) ||
                        (term.Function.Name.ToLower().Equals("rgba") && term.Function.Expression.Terms.Count == 4))
                    {
                        int fr = 0, fg = 0, fb = 0;
                        for (int i = 0; i < term.Function.Expression.Terms.Count; i++)
                        {
                            if (term.Function.Expression.Terms[i].Type != EnumTermType.Number) { return Color.Black; }
                            switch (i)
                            {
                                case 0: fr = GetRgbValue(term.Function.Expression.Terms[i]); break;
                                case 1: fg = GetRgbValue(term.Function.Expression.Terms[i]); break;
                                case 2: fb = GetRgbValue(term.Function.Expression.Terms[i]); break;
                            }
                        }
                        return Color.FromArgb(fr, fg, fb);
                    }
                    if ((term.Function.Name.ToLower().Equals("hsl") && term.Function.Expression.Terms.Count == 3) ||
                        (term.Function.Name.Equals("hsla") && term.Function.Expression.Terms.Count == 4))
                    {
                        int h = 0, s = 0, v = 0;
                        for (int i = 0; i < term.Function.Expression.Terms.Count; i++)
                        {
                            if (term.Function.Expression.Terms[i].Type != EnumTermType.Number) { return Color.Black; }
                            switch (i)
                            {
                                case 0: h = GetHueValue(term.Function.Expression.Terms[i]); break;
                                case 1: s = GetRgbValue(term.Function.Expression.Terms[i]); break;
                                case 2: v = GetRgbValue(term.Function.Expression.Terms[i]); break;
                            }
                        }
                        HsvColor hsv = new HsvColor(h, s, v);
                        return hsv.Color;
                    }
                    break;
                default:
                    try
                    {
                        KnownColor kc = (KnownColor)Enum.Parse(typeof(KnownColor), term.Value, true);
                        Color c = Color.FromKnownColor(kc);
                        return c;
                    }
                    catch
                    {
                        ;
                    }
                    break;
            }
            if (hex.Length == 3)
            {
                string temp = hex.Aggregate("", (current, c) => current + (c.ToString(CultureInfo.InvariantCulture) + c.ToString(CultureInfo.InvariantCulture)));
                hex = temp;
            }
            int r = DeHex(hex.Substring(0, 2));
            int g = DeHex(hex.Substring(2, 2));
            int b = DeHex(hex.Substring(4));
            return Color.FromArgb(r, g, b);
        }

        public static int DeHex(string input)
        {
            int result = 0;
            for (int i = 0; i < input.Length; i++)
            {
                string chunk = input.Substring(i, 1).ToUpper();
                int val;
                switch (chunk)
                {
                    case "A":
                        val = 10; break;
                    case "B":
                        val = 11; break;
                    case "C":
                        val = 12; break;
                    case "D":
                        val = 13; break;
                    case "E":
                        val = 14; break;
                    case "F":
                        val = 15; break;
                    default:
                        val = int.Parse(chunk); break;
                }
                if (i == 0)
                {
                    result += val * 16;
                }
                else
                {
                    result += val;
                }
            }
            return result;
        }

        #endregion Color Static Members
    }
}

