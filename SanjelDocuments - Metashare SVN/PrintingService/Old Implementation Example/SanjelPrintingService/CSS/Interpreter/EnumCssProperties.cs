
namespace Sanjel.PrintingService.CSS.Interpreter
{
    /// <summary>
    /// http://www.w3.org/community/webed/wiki/Main_Page#CSS
    /// </summary>

    /// <summary>
    /// http://www.w3.org/community/webed/wiki/The_CSS_layout_model_-_boxes_borders_margins_padding
    /// </summary>
    public enum EnumCssBorderProperty
    {
        Border,             // Sets all the border properties in one declaration
        BorderBottom,       // Sets all the bottom border properties in one declaration
        BorderBottomColor,  // Sets the color of the bottom border
        BorderBottomStyle,  // Sets the style of the bottom border
        BorderBottomWidth,  // Sets the width of the bottom border
        BorderColor,        // Sets the color of the four borders
        BorderLeft,         // Sets all the left border properties in one declaration
        BorderLeftColor,    // Sets the color of the left border
        BorderLeftStyle,    // Sets the style of the left border
        BorderLeftWidth,    // Sets the width of the left border
        BorderRight,        // Sets all the right border properties in one declaration
        BorderRightColor,   // Sets the color of the right border
        BorderRightStyle,   // Sets the style of the right border
        BorderRightWidth,   // Sets the width of the right border
        BorderStyle,        // Sets the style of the four borders
        BorderTop,          // Sets all the top border properties in one declaration
        BorderTopColor,     // Sets the color of the top border
        BorderTopStyle,     // Sets the style of the top border
        BorderTopWidth,     // Sets the width of the top border
        BorderWidth,        // Sets the width of the four borders
    }

    /// <summary>
    /// http://www.w3.org/community/webed/wiki/The_CSS_layout_model_-_boxes_borders_margins_padding
    /// </summary>
    public enum EnumCssMarginProperty
    {
        Margin,         // A shorthand property for setting the margin properties in one declaration
        MarginBottom,   // Sets the bottom margin of an element
        MarginLeft,     // Sets the left margin of an element
        MarginRight,    // Sets the right margin of an element
        MarginTop,      // Sets the top margin of an element
    }

    /// <summary>
    /// http://www.w3.org/community/webed/wiki/The_CSS_layout_model_-_boxes_borders_margins_padding
    /// </summary>
    public enum EnumCssPaddingProperty
    {
        Padding,         // A shorthand property for setting the padding properties in one declaration
        PaddingBottom,   // Sets the bottom padding of an element
        PaddingLeft,     // Sets the left padding of an element
        PaddingRight,    // Sets the right padding of an element
        PaddingTop,      // Sets the top padding of an element
    }

    /// <summary>
    /// http://www.w3.org/community/webed/wiki/CSS_background_images
    /// </summary>
    public enum EnumCssBackgroundProperty
    {
        Background,             // A shorthand property for setting the background properties in one declaration
        BackgroundColor,        // Specifies the background color to be used
        BackgroundPosition,     // Specifies the position of the background images
        BackgroundSize,         // Specifies the size of the background images
        BackgroundRepeat,       // Specifies how to repeat the background images
        BackgroundOrigin,       // Specifies the positioning area of the background images
        BackgroundClip,         // Specifies the painting area of the background images
        BackgroundAttachment,   // Specifies whether the background images are fixed or scrolls with the rest of the page
        BackgroundImage,        // Specifies ONE or MORE background images to be used
    }

    /// <summary>
    /// http://www.w3.org/community/webed/wiki/CSS_text_styling_part_1
    /// </summary>
    public enum EnumCssFontProperty
    {
        Font,           // Sets all the font properties in one declaration
        FontFamily,     // Specifies the font family for text
        FontSize,       // Specifies the font size of text
        FontStyle,      // Specifies the font style for text
        FontVariant,    // Specifies whether or not a text should be displayed in a small-caps font
        FontWeight,     // Specifies the weight of a font
    }

    /// <summary>
    /// http://www.w3.org/community/webed/wiki/CSS_text_styling_part_1
    /// </summary>
    public enum EnumCssTextProperty
    {
        Color,          // Sets the color of text
        Direction,      // Specifies the text direction/writing direction
        LetterSpacing,  // Increases or decreases the space between characters in a text
        LineHeight,     // Sets the line height
        TextAlign,      // Specifies the horizontal alignment of text
        TextDecoration, // Specifies the decoration added to text
        TextIndent,     // Specifies the indentation of the first line in a text-block
        TextShadow,     // Specifies the shadow effect added to text
        TextTransform,  // Controls the capitalization of text
        UnicodeBidi,    // Used together with the direction property to set or return whether the text should be overridden to support multiple languages in the same document
        VerticalAlign,  // Sets the vertical alignment of an element
        WhiteSpace,     // Specifies how white-space inside an element is handled
        WordSpacing,    // Increases or decreases the space between words in a text
    }

    /// <summary>
    /// http://www.w3schools.com/css/css_dimension.asp
    /// </summary>
    public enum EnumCssDimensionProperty
    {
        Height,         // Sets the height of an element
        MaxHeight,      // Sets the maximum height of an element
        MaxWidth,       // Sets the maximum width of an element
        MinHeight,      // Sets the minimum height of an element
        MinWidth,       // Sets the minimum width of an element
        Width,          // Sets the width of an element
    }

    /// <summary>
    /// http://www.w3schools.com/css/css_positioning.asp
    /// </summary>
    public enum EnumCssPositioningProperty
    {
        Bottom,         // Sets the bottom margin edge for a positioned box
        Clip,           // Clips an absolutely positioned element
        Cursor,         // Specifies the type of cursor to be displayed
        Left,           // Sets the left margin edge for a positioned box
        Overflow,       // Specifies what happens if content overflows an element's box
        Position,       // Specifies the type of positioning for an element
        Right,          // Sets the right margin edge for a positioned box
        Top,            // Sets the top margin edge for a positioned box
        ZIndex,         // Sets the stack order of an element
    }
}



