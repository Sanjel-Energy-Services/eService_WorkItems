
namespace Sanjel.PrintingService.Styles
{
    public class StyleModel
    {
        public string Id { get; set; }
        public double Width { get; set; }
        public double Height { get; set; }
        public double OriginX { get; set; }
        public double OriginY { get; set; }

        public LineStyle Line { get; set; }
        public BackgroundStyle Background { get; set; }
        public BorderStyle Border { get; set; }
        public BoxStyle Margin { get; set; }
        public BoxStyle Padding { get; set; }
        public TextFontStyle TextFont { get; set; }
        public TextFormatStyle TextFormat { get; set; }

        public StyleModel()
        {
            Id = "";
            Width = 0;
            Height = 0;

            Line = new LineStyle();
            Background = new BackgroundStyle();
            Border = new BorderStyle();

            Margin = new BoxStyle();
            Padding = new BoxStyle();
            TextFont = new TextFontStyle();
            TextFormat = new TextFormatStyle();
        }

        public StyleModel(StyleModel parent)
        {
            Id = "";
            Width = 0;
            Height = 0;

            Line = new LineStyle(parent.Line);
            Background = new BackgroundStyle();// don't inherit this properties from parent
            Border = new BorderStyle(parent.Border);

            Margin = new BoxStyle();
            Padding = new BoxStyle(parent.Padding);
            TextFont = new TextFontStyle(parent.TextFont);
            TextFormat = new TextFormatStyle(parent.TextFormat);
        }

        public StyleModel Clone()
        {
            StyleModel newModel = new StyleModel
                                      {
                                          Id = Id,
                                          Width = Width,
                                          Height = Height,
                                          Line = Line,
                                          Background = Background.Clone(),
                                          Border = Border.Clone(),
                                          Margin = Margin.Clone(),
                                          Padding = Padding.Clone(),
                                          TextFont = TextFont.Clone(),
                                          TextFormat = TextFormat.Clone()
                                      };

            return newModel;
        }
    }
}
