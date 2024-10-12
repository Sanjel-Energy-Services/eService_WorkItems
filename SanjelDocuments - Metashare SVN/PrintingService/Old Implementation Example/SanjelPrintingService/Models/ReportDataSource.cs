
using System;
using System.Collections.Specialized;
using System.Linq;
using System.Reflection;

namespace Sanjel.PrintingService
{
    public class ReportDataSource
    {
        #region Private Members

        private readonly HybridDictionary _subModels = new HybridDictionary();

        #endregion

        #region Public Properties

        public ReportDataSource CurrentReportModel { get; set; }

        #endregion

        #region Constructors

        public ReportDataSource(string key = null)
        {
            Key = string.IsNullOrEmpty(key) ? GetType().ToString() : key;
        }

        #endregion

        #region Public Methods

        public ReportDataSource AddSubModel(ReportDataSource subModel)
        {
            return AddSubModel(subModel.Key, subModel);
        }

        public ReportDataSource AddSubModel(string key, ReportDataSource subModel)
        {
            _subModels[key] = subModel;
            return subModel;
        }

        public object RemoveSubModel(string key)
        {
            object subModel = _subModels[key];
            if (subModel != null)
            {
                _subModels.Remove(key);
            }
            return subModel;
        }

        public void ClearSubModels()
        {
            _subModels.Clear();
        }

        public ReportDataSource GetSubModel(string key)
        {
            return _subModels[key] as ReportDataSource;
        }

        public bool SubModelExisting(string key)
        {
            return _subModels[key] != null;
        }

        #endregion

        #region Implementation of IReportModel

        public string Key { get; set; }

        public object GetPropertyValue(string propertyPath)
        {
            return GetPropertyValueByPath(this, propertyPath);
        }

        public object GetPropertyValue(string modelKey, string propertyPath)
        {
            if (string.Compare(Key, modelKey, StringComparison.OrdinalIgnoreCase) == 0)
            {
                return GetPropertyValueByPath(this, propertyPath);
            }

            ReportDataSource subModel = GetSubModel(modelKey);
            if (subModel != null)
            {
                return GetPropertyValueByPath(subModel, propertyPath);
            }

            return null;
        }

        public new string ToString()
        {
            return Key;
        }

        #endregion

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
                    type = propertyInfo.PropertyType;
                }

                if (propertyInfo != null)
                {
                    return propertyInfo.GetValue(lastSource, null);
                }
            }
            return null;
        }

        public static object GetFieldValueByPath(object source, string fieldPath)
        {
            if (source != null && !string.IsNullOrEmpty(fieldPath))
            {
                FieldInfo fieldInfo = null;
                Type type = source.GetType();
                object currentSource = source;
                object lastSource = source;
                foreach (string fieldName in fieldPath.Split('.'))
                {
                    FieldInfo[] fieldInfos = type.GetFields(BindingFlags.Public | BindingFlags.Static | BindingFlags.FlattenHierarchy);
                    fieldInfo = fieldInfos.FirstOrDefault(a => string.Compare(a.Name, fieldName, StringComparison.Ordinal) == 0);
                    if (fieldInfo == null)
                    {
                        break;
                    }

                    lastSource = currentSource;
                    currentSource = fieldInfo.GetValue(currentSource);
                    if (currentSource == null)
                    {
                        return null;
                    }
                    type = fieldInfo.FieldType;
                }

                if (fieldInfo != null)
                {
                    return fieldInfo.GetValue(lastSource);
                }
            }
            return null;
        }
    }
}
