
using System;
using System.Linq;
using System.Collections.Generic;
using System.Reflection;

namespace Sanjel.PrintingService.Models
{
    public enum EnumTextFieldType
    {
        ConstantText,
        PropertyPath,
    }

    public class TextField
    {
        public string FieldValue { get; set; }
        public EnumTextFieldType FieldType { get; set; }
        public string FormatPattern { get; set; }

        public TextField(EnumTextFieldType type, string text, string pattern)
        {
            FieldType = type;
            FieldValue = text;
            FormatPattern = pattern;
        }

        public string ToString(IModel model)
        {
            string text = "";
            switch (FieldType)
            {
                case EnumTextFieldType.ConstantText:
                    text = FieldValue;
                    break;
                case EnumTextFieldType.PropertyPath:
                    text = GetValueByPath(model);
                    break;
            }
            return text;
        }

        protected string GetValueByPath(IModel model)
        {
            string text = "";
            if (model != null)
            {
                object data = model.GetPropertyValue(FieldValue);
                if (data != null)
                {
                    text = FormatObject(data, FormatPattern);
                }
            }
            return text;
        }

        protected string FormatObject(object data, string pattern)
        {
            string text = "";
            Type type = data.GetType();
            MethodInfo[] infos = type.GetMethods();
            IEnumerable<MethodInfo> toStringMethods = infos.Where(a => string.Compare(a.Name, "ToString", StringComparison.Ordinal) == 0);
            foreach (MethodInfo toStringMethod in toStringMethods)
            {
                ParameterInfo[] parameterInfos = toStringMethod.GetParameters();
                if (parameterInfos.Length == 1 && parameterInfos[0].ParameterType == typeof (string))
                {
                    object result = toStringMethod.Invoke(data, new object[] {pattern});
                    if (result != null)
                    {
                        text = result.ToString();
                    }
                }
            }
            return string.IsNullOrEmpty(text) ? data.ToString() : text;
        }
    }
}
