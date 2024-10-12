
using System;
using System.Linq;
using System.Windows;
using System.Collections.Generic;

using Sanjel.PrintingService.JDT;
using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Renders;

namespace Sanjel.PrintingService.Layouts
{
    public class GroupHeader : VerticalPanel
    {
        public GroupHeader(string id)
            : base(id)
        {
        }
    }

    public class ControlGroup : VerticalPanel
    {
        #region Instance Variables

        private DataModel _model;

        #endregion Instance Variables

        #region Instance Properties

        public string DataField { get; set; }
        public string Condition { get; set; }

        public bool GetCondition(IModel model)
        {
            if (!string.IsNullOrEmpty(Condition))
            {
                object data = model.GetPropertyValue(Condition);
                return data != null && (bool) data;
            }
            return true;
        }

        public IModel Model
        {
            get { return _model; }
            set { _model = value as DataModel; }
        }

        #endregion Instance Properties

        public ControlGroup(string id)
            : base(id)
        {
        }

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            if (!GetCondition(device.Section.Model))
            {
                return;
            }

            if (!string.IsNullOrEmpty(DataField))
            {
                if (Model == null)
                {
                    object dataSource = device.Section.GetPropertyValue(DataField);
                    if (dataSource != null)
                    {
                        Model = new DataModel(dataSource);
                    }
                }

                if (Model != null && Model.DataSet != null)
                {
                    List<ReportDataSource> dataSources = Model.DataSet as List<ReportDataSource>;
                    if (dataSources != null)
                    {
                        foreach (ReportDataSource dataSource in dataSources)
                        {
                            device.Section.SetCurrentReportDataSource(dataSource);
                            AddNewPage(device, renderArea);
                            base.BuildRenderObject(device, renderArea, this);
                            Rect clientRect = GetClientRect();
                            Rect rectAvailable = device.CurrentPage.GetAvailablePlotRect(clientRect.Left, clientRect.Width, renderArea);
                            ReInitialize();
                            OriginX = rectAvailable.Left;
                            OriginY = rectAvailable.Top;
                            Width = rectAvailable.Width;
                            Height = rectAvailable.Height;
                        }
                    }
                }
            }
            else
            {
                AddNewPage(device, renderArea);
                base.BuildRenderObject(device, renderArea, this);
            }
        }

        public void DrawHeader(PdfDevice device, EnumRenderArea renderArea)
        {
            GroupHeader header = Header;
            if (header != null)
            {
                Rect clientRect = GetClientRect();
                Rect rectAvailable = device.CurrentPage.GetAvailablePlotRect(clientRect.Left, clientRect.Width, renderArea);
                header.ReInitialize();
                header.OriginX = rectAvailable.Left;
                header.OriginY = rectAvailable.Top;
                header.Width = rectAvailable.Width;
                header.Height = rectAvailable.Height;
                header.BuildRenderObject(device, renderArea);
            }
        }

        private void AddNewPage(PdfDevice device, EnumRenderArea renderArea)
        {
            double miniHeight = Header != null ? Header.Styles.Height : 0;
            double requiredHeight = device.PaperInfo.Margin.Bottom + miniHeight;
            Rect clientRect = GetClientRect();
            Rect rectAvailable = device.CurrentPage.GetAvailablePlotRect(clientRect.Left, clientRect.Width, renderArea);
            if (requiredHeight > rectAvailable.Height)
            {
                device.AddNewPage();
            }
        }

        private GroupHeader Header
        {
            get
            {
                Type type = typeof (GroupHeader);
                var header = Frames.FirstOrDefault(a => a.GetType() == type);
                return header as GroupHeader;
            }
        }
    }
}
