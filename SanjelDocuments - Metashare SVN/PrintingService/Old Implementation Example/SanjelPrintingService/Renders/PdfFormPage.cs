
using System;
using System.Collections.Generic;
using System.Xml;

using O2S.Components.PDF4NET.Forms;

using Sanjel.PrintingService.Layouts;

namespace Sanjel.PrintingService.Renders
{
    public class BindingPair
    {
        public BindingPair(string name, string data)
        {
            FieldName = name;
            DataField = data;
        }

        public string FieldName { get; set; }
        public string DataField { get; set; }
    }

    public class PdfFormPage
    {
        private readonly string _xmlFile;
        private readonly ReportDataSource _reportModel;

        public List<BindingPair> Bindings = new List<BindingPair>();

        public PdfFormPage(ReportDataSource model, string xmlFile)
        {
            _reportModel = model;
            _xmlFile = xmlFile;
            LoadXmlFile();
        }

        public void FillInForm(PdfDevice device)
        {
            PDFForm form = device.Form;
            ClearFields(form);

            foreach (BindingPair pair in Bindings)
            {
                form.Fields[pair.FieldName].Value = _reportModel.GetPropertyValue(pair.DataField);
            }
            SetAllFieldsToReadOnly(form);
        }

        private bool LoadXmlFile()
        {
            XmlDocument xmlDoc = XmlUtilities.ReadXmlFile(_xmlFile);
            if (xmlDoc != null && xmlDoc.DocumentElement != null && string.Compare(PriceBookDefinition.TagFields, xmlDoc.DocumentElement.Name, StringComparison.OrdinalIgnoreCase) == 0)
            {
                XmlNode fieldsNode = xmlDoc.DocumentElement;
                if (fieldsNode != null)
                {
                    foreach (XmlNode fieldNode in fieldsNode.ChildNodes)
                    {
                        if (String.Compare(PriceBookDefinition.TagField, fieldNode.Name, StringComparison.OrdinalIgnoreCase) == 0 && fieldsNode.Attributes != null)
                        {
                            string name = (fieldNode.Attributes[PriceBookDefinition.AttId] == null) ? "" : fieldNode.Attributes[PriceBookDefinition.AttId].Value;
                            string data = (fieldNode.Attributes[PriceBookDefinition.AttDataField] == null) ? "" : fieldNode.Attributes[PriceBookDefinition.AttDataField].Value;
                            Bindings.Add(new BindingPair(name, data));
                        }
                    }
                }
            }
            return Bindings.Count > 0;
        }

        private void ClearFields(PDFForm form)
        {
            foreach (var field in form.Fields)
            {
                field.Value = string.Empty;
            }
        }

        private void SetAllFieldsToReadOnly(PDFForm form)
        {
            foreach (var field in form.Fields)
            {
                field.ReadOnly = true;
            }
        }
    }
}
