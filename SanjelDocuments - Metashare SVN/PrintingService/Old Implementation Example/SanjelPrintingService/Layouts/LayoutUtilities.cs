
namespace Sanjel.PrintingService.Layouts
{
    public class LayoutUtilities
    {
        public static double LimitChildValue(double parentValue, double childValue)
        {
            if (childValue <= double.Epsilon)
            {
                childValue = parentValue;
            }
            return (childValue > parentValue) ? parentValue : childValue;
        }

        public static double InitializeChildSize(double parentValue, double childValue)
        {
            if (childValue <= double.Epsilon)
            {
                childValue = parentValue;
            }
            return childValue;
        }
    }
}
