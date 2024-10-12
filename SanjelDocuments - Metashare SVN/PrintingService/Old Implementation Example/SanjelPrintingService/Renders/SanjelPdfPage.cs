
using System;
using System.Collections.Generic;
using System.Windows;

using O2S.Components.PDF4NET;

using Sanjel.PrintingService.Layouts;
using Sanjel.PrintingService.Reports;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public enum EnumRenderArea
    {
        Client,
        Header,
        Footer,
        Paper
    }

    public class SanjelPdfPage : PDFPage
    {
        private readonly List<Render> _headerRenderObjects = new List<Render>();
        private readonly List<Render> _clientRenderObjects = new List<Render>();
        private readonly List<Render> _footerRenderObjects = new List<Render>();

        public double CurrentPosX { get; set; }

        public double CurrentPosY { get; set; }

        public BoxStyle Margin { get; set; }

        public BoxStyle Padding { get; set; }

        public Frame PageHeader { get; set; }

        public Frame PageFooter { get; set; }

        public int PageNumber { get; set; }

        public Guid Id { get; set; }

        public ISection Section { get; set; }

        public SanjelPdfPage(PdfDevice device, bool blank = false)
        {
            Id = Guid.NewGuid();
            Width = device.PaperInfo.Width;
            Height = device.PaperInfo.Height;
            Margin = device.PaperInfo.Margin;
            Padding = device.StyleModel != null ? device.StyleModel.Padding.Clone() : new BoxStyle();
            CurrentPosX = Padding.Left;
            CurrentPosY = Padding.Top;
            Section = device.Section;
            if (!blank)
            {
                PageHeader = device.PageHeader;
                PageFooter = device.PageFooter;
            }
        }

        public void DrawHeaderAndFooter(PdfDevice device)
        {
            if (PageHeader != null)
            {
                double fixedHeight = PageHeader.Height;
                PageHeader.BuildRenderObject(device, EnumRenderArea.Header);
                PageHeader.Height = fixedHeight;
            }

            if (PageFooter != null)
            {
                double fixedHeight = PageFooter.Height;
                PageFooter.BuildRenderObject(device, EnumRenderArea.Footer);
                PageFooter.Height = fixedHeight;
            }
        }

        public void AddRenderObject(Render render, EnumRenderArea renderArea)
        {
            switch (renderArea)
            {
                case EnumRenderArea.Header:
                    _headerRenderObjects.Add(render);
                    break;
                case EnumRenderArea.Footer:
                    _footerRenderObjects.Add(render);
                    break;
                default:
                    _clientRenderObjects.Add(render);
                    break;
            }
        }

        public void FlushPage()
        {
            //RestoreTranslation();

            foreach (EnumRenderingLayer layer in Enum.GetValues(typeof(EnumRenderingLayer)))
            {
                foreach (Render render in _headerRenderObjects)
                {
                    render.RenderingByLayer(this, layer);
                }
                foreach (Render render in _footerRenderObjects)
                {
                    render.RenderingByLayer(this, layer);
                }
                foreach (Render render in _clientRenderObjects)
                {
                    render.RenderingByLayer(this, layer);
                }
            }
        }

        public Rect GetAvailablePlotRect(double plotLeft, double plotWidth, EnumRenderArea renderArea)
        {
            Rect rectClient = GetClientRect(renderArea);
            Rect rectTaken = GetTakenPlotRect(plotLeft, plotWidth, renderArea);
            Rect rectPlot = new Rect(plotLeft, rectTaken.Bottom, plotWidth, rectClient.Height - rectTaken.Height);
            return rectPlot;
        }

        public bool IsContentFitCurrentPage(Render render, EnumRenderArea renderArea)
        {
            Rect controlRect = render.GetControlRect();
            Rect vacuumRect = GetAvailablePlotRect(render.OriginX, render.Width, renderArea);
            return controlRect.Height <= vacuumRect.Height;
        }

        public bool IsContentFitCurrentPage(Rect rect, EnumRenderArea renderArea)
        {
            Rect vacuumRect = GetAvailablePlotRect(rect.X, rect.Width, renderArea);
            return rect.Height <= vacuumRect.Height;
        }

        public Rect GetClientRect(EnumRenderArea renderArea)
        {
            Rect rectClient;
            switch (renderArea)
            {
                case EnumRenderArea.Header:
                    rectClient = GetHeaderRect();
                    break;
                case EnumRenderArea.Footer:
                    rectClient = GetFooterRect();
                    break;
                default:
                    rectClient = GetMainRect();
                    break;
            }
            return rectClient;
        }

        private Rect GetHeaderRect()
        {
            double top = Margin.Top/2, left = Margin.Left;
            double width = Width - Margin.Left - Margin.Right;
            double height = Margin.Top/2;

            if (PageHeader != null)
            {
                top = PageHeader.OriginY;
                left = PageHeader.OriginX;
                width = PageHeader.Width;
                height = PageHeader.Height;
            }

            return new Rect(left, top, width, height);
        }

        private Rect GetFooterRect()
        {
            double top = Height - Margin.Bottom / 2, left = Margin.Left;
            double width = Width - Margin.Left - Margin.Right;
            double height = Margin.Bottom / 2;

            if (PageFooter != null)
            {
                top = PageFooter.OriginY;
                left = PageFooter.OriginX;
                width = PageFooter.Width;
                height = PageFooter.Height;
            }

            return new Rect(left, top, width, height);
        }

        private Rect GetMainRect()
        {
            double top = Margin.Top;
            if (PageHeader != null)
            {
                double headerY = PageHeader.OriginY + PageHeader.Height;
                top = top > headerY ? top : headerY;
            }

            double bottom = Height - Margin.Bottom;
            if (PageFooter != null)
            {
                double footerY = PageFooter.OriginY;
                bottom = bottom < footerY ? bottom : footerY;
            }

            double height = bottom - top;
            height = height > 0 ? height : 0;
            double width = Width - Margin.Left - Margin.Right;
            width = width > 0 ? width : 0;
            return new Rect(Margin.Left, top, width, height);
        }

        private Rect GetTakenPlotRect(double plotLeft, double plotWidth, EnumRenderArea renderArea)
        {
            Rect rectClient;
            List<Render> renders;
            switch (renderArea)
            {
                case EnumRenderArea.Header:
                    rectClient = GetHeaderRect();
                    renders = _headerRenderObjects;
                    break;
                case EnumRenderArea.Footer:
                    rectClient = GetFooterRect();
                    renders = _footerRenderObjects;
                    break;
                default:
                    rectClient = GetMainRect();
                    renders = _clientRenderObjects;
                    break;
            }
            Rect rectTaken = new Rect(plotLeft, rectClient.Top, plotWidth, 0);
            Rect rectPlot = new Rect(plotLeft, rectClient.Top, plotWidth, rectClient.Height);
            foreach (Render render in renders)
            {
                Rect rect = render.GetControlRect();
                rect.Intersect(rectPlot);
                if (rect.Width > 1)
                {
                    rectTaken.Union(rect);
                }
            }
            return rectTaken;
        }
    }
}
