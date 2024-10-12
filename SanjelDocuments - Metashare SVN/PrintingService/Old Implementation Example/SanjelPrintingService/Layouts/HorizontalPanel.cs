
using System;
using System.Linq;
using System.Windows;
using System.Collections.Generic;

using Sanjel.PrintingService.Renders;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Layouts
{
    public class HorizontalPanel : Panel
    {
        public HorizontalPanel(string id)
            : base(id)
        {
        }

        public override void BuildRenderObject(PdfDevice device, EnumRenderArea renderArea, Frame groupFrame = null)
        {
            SetupWidth();
            double currentTop = GetClientRect().Top;
            Guid currentGuid = device.CurrentPage.Id;
            foreach (var frame in Frames)
            {
                frame.OriginY = currentTop + frame.Styles.Margin.Top;
                frame.BuildRenderObject(device, renderArea, groupFrame);
                if (currentGuid.CompareTo(device.CurrentPage.Id) != 0)
                {
                    currentTop = frame.OriginY;
                }
            }
        }

        public void SetupWidth()
        {
            BoxStyle padding = Styles.Padding;
            Rect rectClient = GetClientRect();
            double clientWidth = rectClient.Width;
            double clientOriginX = rectClient.Left;

            // get information of child frame widths
            List<int> autoColumns = new List<int>();
            double totalColumnWidth = 0;
            for (int index = 0; index < Frames.Count; index++)
            {
                Frames[index].InitializeRect();
                if (Frames[index].Width <= double.Epsilon)
                {
                    autoColumns.Add(index);
                }
                else
                {
                    Rect rectExt = Frames[index].GetExtAreaRect();
                    totalColumnWidth += rectExt.Width;
                }
            }

            if (totalColumnWidth > (clientWidth + 1))
            {
                throw new Exception("Total Width of columns in the panel " + Id + " is too big.");
            }

            if (autoColumns.Count > 0)
            {
                double average = (clientWidth - totalColumnWidth)/(autoColumns.Count);
                foreach (int index in autoColumns)
                {
                    Frames[index].Width = average - Frames[index].Styles.Margin.Left - Frames[index].Styles.Margin.Right;
                }
            }

            Width = Frames.Sum(col => (col.Width + col.Styles.Margin.Left + col.Styles.Margin.Right)) + padding.Left + padding.Right;

            // setup left position column
            double left = clientOriginX;
            foreach (Frame frame in Frames)
            {
                frame.OriginX = left + frame.Styles.Margin.Left;
                left = frame.OriginX + frame.Width + frame.Styles.Margin.Right;
            }
        }
    }
}
