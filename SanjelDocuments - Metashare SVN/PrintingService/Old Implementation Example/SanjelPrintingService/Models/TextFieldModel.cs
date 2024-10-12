
namespace Sanjel.PrintingService.Models
{
    public class TextFieldModel : IModel
    {
        private TextField _dataSet;

        public object DataSet
        {
            get { return _dataSet; }
            set
            {
                var temp = value as TextField;
                if (temp != null) _dataSet = temp;
            }
        }

        public TextField TextField
        {
            get { return _dataSet; }
            set { _dataSet = value; }
        }

        public IModel Parent { get; set; }

        public string GetText()
        {
            return _dataSet.ToString(this);
        }

        public object GetPropertyValue(string propertyPath)
        {
            return (Parent != null) ? Parent.GetPropertyValue(propertyPath) : null;
        }

        public TextFieldModel(TextField field)
        {
            _dataSet = field;
        }
    }
}
