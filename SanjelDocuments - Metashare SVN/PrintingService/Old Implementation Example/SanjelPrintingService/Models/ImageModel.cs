
using System;

using O2S.Components.PDF4NET.Graphics.Shapes;

namespace Sanjel.PrintingService.Models
{
    public class ImageModel : IModel
    {
        private PDFImage _image;

        public object DataSet
        {
            get { return _image; }
            set
            {
                var temp = value as PDFImage;
                if (temp != null) _image = temp;
            }
        }

        public PDFImage Image
        {
            get { return _image; }
            set { _image = value; }
        }

        public IModel Parent { get; set; }

        public object GetPropertyValue(string propertyPath)
        {
            return (Parent != null) ? Parent.GetPropertyValue(propertyPath) : null;
        }

        public ImageModel(string imageFilePath)
        {
            try
            {
                _image = new PDFImage(imageFilePath);
            }
            catch (Exception)
            {
                throw new Exception("Cannot build image from the file, " + imageFilePath);
            }
        }
    }
}
