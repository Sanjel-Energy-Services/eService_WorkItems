
using System;
using System.Collections.Generic;

using O2S.Components.PDF4NET;
using O2S.Components.PDF4NET.PDFFile;
using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Models
{
    public class ImportPageModel : IModel
    {
        private List<PDFImportedPage> _pages;

        public object DataSet
        {
            get { return _pages; }
            set
            {
                var temp = value as List<PDFImportedPage>;
                if (temp != null) _pages = temp;
            }
        }

        public List<PDFImportedPage> Pages
        {
            get { return _pages; }
            set { _pages = value; }
        }

        public IModel Parent { get; set; }

        public object GetPropertyValue(string propertyPath)
        {
            return (Parent != null) ? Parent.GetPropertyValue(propertyPath) : null;
        }

        public ImportPageModel(List<string> filePaths)
        {
            _pages = new List<PDFImportedPage>();
            foreach (string filePath in filePaths)
            {
                PDFDocument doc = PdfDevice.CreateNewDoc(filePath);
                foreach (PDFPage pdfPage in doc.Pages)
                {
                    _pages.Add(pdfPage as PDFImportedPage);
                }
            }
        }
    }
}
