
using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Collections.Generic;
using System.Collections.ObjectModel;

using Sanjel.Common.Domain.PriceBook;
using Sanjel.Common.Domain.Reference;
using Sanjel.Common.Domain.Versioning;

namespace Sanjel.PrintingService.Models
{
    public class PriceBookModel : IModel
    {
        private class ItemSorter
        {
            private const long DefaultPosition = 9999999999;

            public readonly int CategoryId;
            public readonly int HeaderId;
            public readonly int ItemId;
            public readonly string Description;
            public readonly bool IsDiscountable;
            public readonly string UnitOfMeasureName;
            public long Position;

            public ItemSorter(int categoryId, int headerId, int itemId, string description, bool discountable, string unit)
            {
                CategoryId = categoryId;
                HeaderId = headerId;
                ItemId = itemId;
                Description = description;
                IsDiscountable = discountable;
                UnitOfMeasureName = unit;
            }

            public void ComputePositionValue(IEnumerable<PriceItem> items)
            {
                long? minValue = DefaultPosition;
                foreach (PriceItem item in items)
                {
                    if (item.SortOrder == null || item.SortOrder <= 0)
                    {
                        continue;
                    }
                    minValue = minValue < item.SortOrder ? minValue : item.SortOrder;
                }
                Position = minValue.GetValueOrDefault();
            }
        }

        private static readonly List<string> PorList = new List<string>{"Price On Request", "Prices On Request"};

        public VersionedObject BookVersion { get; set; }
        public PriceBook PriceBook { get; set; }
        public Collection<PriceCategory> ServiceCategories { get; set; }
        public Collection<PriceHeader> PriceHeaders { get; set; }
        public Collection<PriceItem> PriceItems { get; set; }
        public Collection<PricingArea> PricingAreas { get; set; }
        public Company SelectedCompany { get; set; }

        public PriceCategory CurrentCategory { get; set; }
        public object DataSet { get; set; }

        public IModel Parent { get; set; }

        public object GetPropertyValue(string propertyPath)
        {
            return PriceBookUtilities.GetPropertyValueByPath(this, propertyPath);
        }

        public PriceBookModel()
        {
            PriceItems = new Collection<PriceItem>();
            ServiceCategories = new Collection<PriceCategory>();
            PriceHeaders = new Collection<PriceHeader>();
            PricingAreas = new Collection<PricingArea>();
        }

        public PriceBookModel(VersionedObject bookVersion,
                              PriceBook priceBook,
                              VersionedCollection<PriceCategory> priceCategories,
                              VersionedCollection<PriceHeader> priceHeaders,
                              VersionedCollection<PricingArea> pricingAreas,
                              VersionedCollection<PriceItem> priceItems,
                              Company company)
        {
            BookVersion = bookVersion;
            PriceBook = priceBook;
            ServiceCategories = priceCategories;
            PriceHeaders = priceHeaders;
            PricingAreas = pricingAreas;
            PriceItems = priceItems;

            SelectedCompany = company;
        }

        public bool CreateDataSet(int categoryId)
        {
            CurrentCategory = ServiceCategories.SingleOrDefault(a => a.Id == categoryId);
            if (CurrentCategory == null)
            {
                return false;
            }

            DataTable table = BuildTableWithServiceCategory(categoryId);
            DataSet = table;
            return table.Rows.Count != 0;
        }

        private DataTable BuildTableWithServiceCategory(int categoryId)
        {
            DataTable dataTable = InitDataTableByArea();
            PriceCategory categoryEntity = ServiceCategories.SingleOrDefault(a => a.Id == categoryId);
            if (categoryEntity != null)
            {
                List<PriceItem> filteredPriceItems = PriceItems.Where(a =>((a.Price1 > 0 || a.Price2.Length > 0) && (a.ServicePointId == 0))).ToList();
                List<PriceItem> itemsByCategory = filteredPriceItems.Where(a => a.CategoryId == categoryEntity.Id).ToList();
                List<PriceHeader> headersByCategory = PriceHeaders.Where(a => a.CategoryId == categoryEntity.Id).ToList();
                if (headersByCategory.Any() && itemsByCategory.Any())
                {
                    List<PriceHeader> firstLevelHeaders =
                        (PriceHeaders.Where(a => a.CategoryId == categoryEntity.Id && a.Level == 1))
                            .OrderByDescending(a => a.SortOrder).ThenByDescending(a => a.Id).ToList();
                    List<DataRow> rows = new List<DataRow>();
                    foreach (var firstLevel in firstLevelHeaders)
                    {
                        FindItemsByHeader(dataTable, firstLevel, headersByCategory, itemsByCategory, ref rows);
                    }
                    if (rows.Count > 0)
                    {
                        for (int index = rows.Count - 1; index >= 0; index--)
                        {
                            dataTable.Rows.Add(rows[index]);
                        }
                        rows.Clear();
                    }
                }
            }

            return dataTable;
        }

        private void FindItemsByHeader(DataTable table, PriceHeader parent, List<PriceHeader> parentHeaders, List<PriceItem> parentItems, ref List<DataRow> parentRows)
        {
            if (parentHeaders != null)
            {
                IEnumerable<PriceHeader> childHeaders = parentHeaders.Where(a => (a.ParentHeaderId == parent.Id)).
                    OrderByDescending(a => a.SortOrder).ThenByDescending(a => a.Id);

                List<PriceHeader> listTest = childHeaders.ToList();

                List<DataRow> childRows = new List<DataRow>();
                foreach (PriceHeader header in childHeaders)
                {
                    FindItemsByHeader(table, header, parentHeaders, parentItems, ref childRows);
                }

                IEnumerable<ItemSorter> groupList = parentItems.Where(a => a.HeaderId == parent.Id)
                    .GroupBy(a => new {a.CategoryId, a.HeaderId, a.ItemId, a.Description, a.IsDiscountable, a.UnitOfMeasureName})
                    .Select(grp => new ItemSorter(
                                          grp.Key.CategoryId,
                                          grp.Key.HeaderId,
                                          grp.Key.ItemId,
                                          grp.Key.Description,
                                          grp.Key.IsDiscountable,
                                          grp.Key.UnitOfMeasureName));

                bool hasChild = false;
                if (groupList.Any())
                {
                    foreach (ItemSorter sorter in groupList)
                    {
                        IEnumerable<PriceItem> itemsInGroup = GetItemsInGroup(parentItems, sorter);
                        sorter.ComputePositionValue(itemsInGroup);
                    }
                    IEnumerable<ItemSorter> sortedList = groupList.OrderByDescending(grp => grp.Position).
                        ThenByDescending(grp => grp.ItemId).ThenByDescending(grp => grp.Description);

                    foreach (var group in sortedList)
                    {
                        IEnumerable<PriceItem> listInGroup = GetItemsInGroup(parentItems, group);

                        DataRow row = table.NewRow();
                        if (GetDataRowByArea(listInGroup, ref row))
                        {
                            string itemId = group.ItemId.ToString(CultureInfo.InvariantCulture);
                            row["RowName"] = "rowPriceItem";
                            row["ItemId"] = (group.IsDiscountable) ? itemId : itemId + "*";
                            row["Description"] = group.Description;
                            row["UOM"] = group.UnitOfMeasureName;
                            parentRows.Add(row);
                            hasChild = true;
                        }
                    }
                }

                if (childRows.Count > 0)
                {
                    parentRows.AddRange(childRows);
                }

                if ((parent.Level > 0) && (hasChild || childRows.Count > 0))
                {
                    DataRow rowHeader = table.NewRow();
                    rowHeader["RowName"] = "rowH" + parent.Level + "Title";
                    rowHeader["ItemId"] = parent.Id;
                    rowHeader["Description"] = parent.Description;
                    rowHeader["Notes"] = parent.Notes;

                    parentRows.Add(rowHeader);
                }
            }
        }

        private DataTable InitDataTableByArea()
        {
            // create data table
            DataTable table = new DataTable();
            table.Columns.Add("RowName", typeof(string));
            table.Columns.Add("ItemId", typeof(string));
            table.Columns.Add("Description", typeof(string));
            table.Columns.Add("UOM", typeof(string));
            for (int index = 0; index < PricingAreas.Count; index++)
            {
                table.Columns.Add(PricingAreas[index].Name, typeof(string));
            }
            table.Columns.Add("Notes", typeof(string));

            return table;
        }

        private IEnumerable<PriceItem> GetItemsInGroup(List<PriceItem> items, ItemSorter sorter)
        {
            return items.Where(a =>
                               a.CategoryId == sorter.CategoryId &&
                               a.HeaderId == sorter.HeaderId &&
                               a.ItemId == sorter.ItemId &&
                               a.Description == sorter.Description &&
                               a.IsDiscountable == sorter.IsDiscountable &&
                               a.UnitOfMeasureName == sorter.UnitOfMeasureName);
        }

        private bool GetDataRowByArea(IEnumerable<PriceItem> pricingList, ref DataRow row)
        {
            pricingList = FilterGroupItemWithSelectedCompany(pricingList);
            if (pricingList.Count() == 0)
            {
                return false;
            }

            Dictionary<string, string> priceGroup = new Dictionary<string, string>();
            List<PriceItem> donelist = new List<PriceItem>();
            foreach (var pricing in pricingList)
            {
                var area = PricingAreas.SingleOrDefault(a => a.Id == pricing.PricingAreaId);
                if (area != null && !string.IsNullOrEmpty(area.Name) && !priceGroup.ContainsKey(area.Name))
                {
                    priceGroup.Add(area.Name, (pricing.Price2.Length > 0) ? VerifyPrice2(pricing.Price2) : pricing.Price1.ToString("#,#0.00#"));
                    donelist.Add(pricing);
                }
            }

            if (priceGroup.Count <= PricingAreas.Count)
            {
                foreach (KeyValuePair<string, string> pair in priceGroup)
                {
                    row[pair.Key] = pair.Value;
                }
                for (int index = donelist.Count - 1; index >= 0; index--)
                {
                    PriceItems.Remove(donelist[index]);
                    //removedCount++;
                }
                return true;
            }
            return false;
        }

        private IEnumerable<PriceItem> FilterGroupItemWithSelectedCompany(IEnumerable<PriceItem> pricingList)
        {
            if (SelectedCompany == null)
            {
                return pricingList.Where(a => a.CusomerId == 0);
            }
            else
            {
                List<PriceItem> selectedItems = pricingList.Where(a => a.CusomerId == SelectedCompany.Id).ToList();
                IEnumerable<PriceItem> generalItems = pricingList.Where(a => a.CusomerId == 0);
                foreach (PriceItem generalItem in generalItems)
                {
                    if (!selectedItems.Any(a=>a.PricingAreaId == generalItem.PricingAreaId))
                    {
                        selectedItems.Add(generalItem);
                    }
                }
                return selectedItems;
            }
        }

        private string VerifyPrice2(string price2)
        {
            return PorList.Any(a=>string.Compare(a, price2, StringComparison.OrdinalIgnoreCase) == 0) ? "POR**" : price2;
        }
    }
}
