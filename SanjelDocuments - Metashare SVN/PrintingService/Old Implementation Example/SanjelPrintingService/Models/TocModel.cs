
using System;
using System.Collections.Generic;
using System.Data;

using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Models
{
    public class TocModel : IModel
    {
        private DataTable _tocTable;

        public object DataSet { get; set; }
        public IModel Parent { get; set; }
        public List<SanjelPdfBookmark> Bookmarks { get; set; }

        public TocModel(List<SanjelPdfBookmark> bookmarks)
        {
            Bookmarks = bookmarks;
        }

        public object GetPropertyValue(string propertyPath)
        {
            return (Parent != null) ? Parent.GetPropertyValue(propertyPath) : null;
        }

        public bool CreateDataSet()
        {
            BuildTocTable();
            DataSet = _tocTable;
            return _tocTable.Rows.Count != 0;
        }

        private void BuildTocTable()
        {
            InitTocTable();
            foreach (SanjelPdfBookmark bookmark in Bookmarks)
            {
                _tocTable.Rows.Add(CreateCategoryRow(bookmark));
                foreach (SanjelPdfBookmark headerBookmark in bookmark.Bookmarks)
                {
                    _tocTable.Rows.Add(CreateHeaderRow(headerBookmark));
                }
            }
        }

        private void InitTocTable()
        {
            // create data table
            _tocTable = new DataTable();
            _tocTable.Columns.Add("RowName", typeof(string));
            _tocTable.Columns.Add("Title", typeof(string));
            _tocTable.Columns.Add("PageNumber", typeof(Int32));
        }

        private DataRow CreateCategoryRow(SanjelPdfBookmark bookmark)
        {
            DataRow row = _tocTable.NewRow();
            row["RowName"] = "rowTocCategory";
            row["Title"] = bookmark.Title;
            row["PageNumber"] = bookmark.PageNumber;
            return row;
        }

        private DataRow CreateHeaderRow(SanjelPdfBookmark bookmark)
        {
            DataRow row = _tocTable.NewRow();
            row["RowName"] = "rowTocHeader";
            row["Title"] = bookmark.Title;
            row["PageNumber"] = bookmark.PageNumber;
            return row;
        }
    }
}
