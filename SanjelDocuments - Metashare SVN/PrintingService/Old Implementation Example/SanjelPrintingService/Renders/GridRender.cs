
using System.Linq;
using System.Collections.Generic;

using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Renders
{
    public class RowRender : Render
    {
        public List<Render> Children { get; set; }

        public RowRender(string id, StyleModel style, double left, double top, double width, double height)
            : base(id, style, left, top, width, height)
        {
            Children = new List<Render>();
        }

        public override Render Clone()
        {
            RowRender rowClone = new RowRender(Id, Styles.Clone(), OriginX, OriginY, Width, Height);
            foreach (Render child in Children)
            {
                rowClone.Children.Add(child.Clone());
            }
            return rowClone;
        }

        public override double ComputeRenderHeight(SanjelPdfPage pdfPage)
        {
            double rowHeight = Children.Select(render => render.ComputeRenderHeight(pdfPage)).Aggregate<double, double>
                                    (0, (current, height) => (current < height) ? height : current);

            foreach (Render render in Children)
            {
                render.Height = rowHeight;
            }
            return rowHeight;
        }

        public override void RenderingByLayer(SanjelPdfPage pdfPage, EnumRenderingLayer layer)
        {
            base.RenderingByLayer(pdfPage, layer);

            foreach (Render render in Children)
            {
                render.RenderingByLayer(pdfPage, layer);
            }
        }
    }

    public class GridRender : Render
    {
        public List<Render> Columns { get; set; }
        public List<RowRender> Rows { get; set; }

        public GridRender(string id, StyleModel style, double left, double top, double width, double height)
            : base(id, style, left, top, width, height)
        {
            Columns = new List<Render>();
            Rows = new List<RowRender>();
        }

        public override void RenderingByLayer(SanjelPdfPage pdfPage, EnumRenderingLayer layer)
        {
            base.RenderingByLayer(pdfPage, layer);

            foreach (RowRender rowRender in Rows)
            {
                rowRender.RenderingByLayer(pdfPage, layer);
            }

            foreach (Render render in Columns)
            {
                render.RenderingByLayer(pdfPage, layer);
            }
        }
    }
}
