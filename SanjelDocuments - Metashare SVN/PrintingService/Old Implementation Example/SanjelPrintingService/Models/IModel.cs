
namespace Sanjel.PrintingService.Models
{
    public interface IModel
    {
        object DataSet { get; set; }
        IModel Parent { get; set; }

        object GetPropertyValue(string propertyPath);
    }
}
