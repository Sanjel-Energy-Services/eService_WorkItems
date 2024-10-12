using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sanjel.PrintingService.Models;

namespace Sanjel.PrintingService.JDT
{
    public class DataModel : IModel
    {
        public object DataSet { get; set; }
        public IModel Parent { get; set; }

        public DataModel(object dataSet, IModel parent = null)
        {
            DataSet = dataSet;
            Parent = parent;
        }

        public object GetPropertyValue(string propertyPath)
        {
            return PriceBookUtilities.GetPropertyValueByPath(DataSet, propertyPath);
        }

        public void SetCurrentReportModel(ReportDataSource reportData)
        {
            if (DataSet is ReportDataSource)
            {
                ((ReportDataSource) DataSet).CurrentReportModel = reportData;
            }
        }
    }
}
