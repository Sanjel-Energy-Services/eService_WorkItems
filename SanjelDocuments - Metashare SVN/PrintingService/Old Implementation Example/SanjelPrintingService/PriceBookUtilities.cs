
using System;
using System.Reflection;

namespace Sanjel.PrintingService
{
    public static class PriceBookUtilities
    {
        public static object GetPropertyValueByPath(object source, string propertyPath)
        {
            if (source != null && !string.IsNullOrEmpty(propertyPath))
            {
                PropertyInfo propertyInfo = null;
                Type type = source.GetType();
                object currentSource = source;
                object lastSource = source;
                foreach (string propertyName in propertyPath.Split('.'))
                {
                    propertyInfo = type.GetProperty(propertyName);
                    if (propertyInfo == null)
                    {
                        break;
                    }

                    lastSource = currentSource;
                    currentSource = propertyInfo.GetValue(currentSource, null);
                    if (currentSource == null)
                    {
                        return null;
                    }
                    type = currentSource.GetType();
                }

                if (propertyInfo != null)
                {
                    return propertyInfo.GetValue(lastSource, null);
                }
            }
            return null;
        }
    }
}
