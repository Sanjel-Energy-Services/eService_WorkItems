
using System;

namespace Sanjel.PrintingService.Models
{
    public enum EnumPageNumberStyle
    {
        Arabic,
        UpperCaseRoman,
        LowerCaseRoman,
    }

    public class PageNumberModel : IModel
    {
        private int _pageCount;

        public string Prefix { get; set; }
        public string Suffix { get; set; }
        public int StartNumber { get; set; }
        public EnumPageNumberStyle Style { get; set; }

        public object DataSet { get; set; }

        public IModel Parent { get; set; }

        public PageNumberModel()
        {
            StartNumber = 1;
            Style = EnumPageNumberStyle.Arabic;
            Prefix = "";
            Suffix = "";
        }

        public PageNumberModel(int start, EnumPageNumberStyle style, string prefix, string suffix)
        {
            StartNumber = start;
            Style = style;
            Prefix = prefix;
            Suffix = suffix;
        }

        public object GetPropertyValue(string propertyPath)
        {
            return (Parent != null) ? Parent.GetPropertyValue(propertyPath) : null;
        }

        public int GetCurrentNumber()
        {
            return StartNumber + _pageCount;
        }

        public string GetAndPlusPageNumberString()
        {
            int currentNumber = GetCurrentNumber();
            string text = currentNumber.ToString();
            switch (Style)
            {
                case EnumPageNumberStyle.UpperCaseRoman:
                    text = ToRoman(currentNumber);
                    break;
                case EnumPageNumberStyle.LowerCaseRoman:
                    text = ToRoman(currentNumber).ToLower();
                    break;
            }
            _pageCount++;
            return Prefix + text + Suffix;
        }

        public static string ToRoman(int number)
        {
            if ((number < 0) || (number > 3999)) throw new Exception("Page number is out of range. (1-3999)");
            if (number < 1) return string.Empty;
            if (number >= 1000) return "M" + ToRoman(number - 1000);
            if (number >= 900) return "CM" + ToRoman(number - 900);
            if (number >= 500) return "D" + ToRoman(number - 500);
            if (number >= 400) return "CD" + ToRoman(number - 400);
            if (number >= 100) return "C" + ToRoman(number - 100);
            if (number >= 90) return "XC" + ToRoman(number - 90);
            if (number >= 50) return "L" + ToRoman(number - 50);
            if (number >= 40) return "XL" + ToRoman(number - 40);
            if (number >= 10) return "X" + ToRoman(number - 10);
            if (number >= 9) return "IX" + ToRoman(number - 9);
            if (number >= 5) return "V" + ToRoman(number - 5);
            if (number >= 4) return "IV" + ToRoman(number - 4);
            if (number >= 1) return "I" + ToRoman(number - 1);
            throw new Exception("Page number is out of range. (1-3999)");
        }
    }
}
