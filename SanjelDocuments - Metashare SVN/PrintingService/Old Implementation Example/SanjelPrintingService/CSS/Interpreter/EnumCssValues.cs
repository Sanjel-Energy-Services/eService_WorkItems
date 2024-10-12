
namespace Sanjel.PrintingService.CSS.Interpreter
{
    #region Border Group

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_border-width.asp
    /// </summary>
    public enum EnumCssBorderWidthValue
    {
        Medium, // Specifies a medium bottom border. This is default
        Thin, // Specifies a thin bottom border
        Thick, // Specifies a thick bottom border
        //Length, // Allows you to define the thickness of the bottom border
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_border-style.asp
    /// </summary>
    public enum EnumCssBorderStyleValue
    {
        None,   // Specifies no border. This is default
        Hidden, // The same as "none", except in border conflict resolution for table elements
        Dotted, // Specifies a dotted border
        Dashed, // Specifies a dashed border
        Solid,  // Specifies a solid border
        Double, // Specifies a double border
        Groove, // Specifies a 3D grooved border. The effect depends on the border-color value
        Ridge,  // Specifies a 3D ridged border. The effect depends on the border-color value
        Inset,  // Specifies a 3D inset border. The effect depends on the border-color value
        Outset, // Specifies a 3D outset border. The effect depends on the border-color value
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_border-color.asp
    /// Shared with: Background Color
    /// </summary>
    public enum EnumCssBorderColorValue
    {
        //Color,      // Specifies the background color. Default color is black
        Transparent, // Specifies that the border color should be transparent
    }

    #endregion Border Group

    #region Margin & Padding Group

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_margin.asp
    /// </summary>
    public enum EnumCssMarginValue
    {
        Auto, // The browser calculates a margin
        //Length, //Specifies a margin in px, pt, cm, etc. Default value is 0px
        //%,      //Specifies a margin in percent of the width of the containing element
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_padding.asp
    /// </summary>
    public enum EnumCssPaddingValue
    {
        //Length, //Specifies a margin in px, pt, cm, etc. Default value is 0px
        //%,      //Specifies a margin in percent of the width of the containing element
    }

    #endregion Margin & Padding Group

    #region Background Group

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_background-position.asp
    /// </summary>
    public enum EnumCssBackgroundPositionValue
    {
        Left, // If you only specify one keyword, the other value will be "center"
        Right, // If you only specify one keyword, the other value will be "center"
        Top, // If you only specify one keyword, the other value will be "center"
        Bottom, // If you only specify one keyword, the other value will be "center"
        LeftTop, //
        LeftCenter, //
        LeftBottom, //
        RightTop, //
        RightCenter, //
        RightBottom, //
        CenterTop, //
        CenterCenter, //
        CenterBottom, //
        //X%,Y%,          // The first value is the horizontal position and the second value is the vertical.
        //                // The top left corner is 0% 0%. The right bottom corner is 100% 100%.
        //                // If you only specify one value, the other value will be 50%. Default value is: 0% 0%
        //XPos,YPos       // The first value is the horizontal position and the second value is the vertical.
        //                // The top left corner is 0 0. Units can be pixels (0px 0px) or any other CSS units.
        //                // If you only specify one value, the other value will be 50%. You can mix % and positions
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/css3_pr_background-size.asp
    /// </summary>
    public enum EnumCssBackgroundSizeValue
    {
        Auto,       // Default value. The background-image contains its width and height
        Length,     // Sets the width and height of the background image.
                    // The first value sets the width, the second value sets the height.
                    // If only one value is given, the second is set to "auto"
        Percentage, // Sets the width and height of the background image in percent of the parent element.
                    // The first value sets the width, the second value sets the height.
                    // If only one value is given, the second is set to "auto"
        Cover,      // Scale the background image to be as large as possible so that the background area is completely covered by the background image.
                    // Some parts of the background image may not be in view within the background positioning area
        Contain,    // Scale the image to the largest size such that both its width and its height can fit inside the content area
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_background-repeat.asp
    /// </summary>
    public enum EnumCssBackgroundRepeatValue
    {
        Repeat,     // The background image will be repeated both vertically and horizontally. This is default
        RepeatX,    // The background image will be repeated only horizontally
        RepeatY,    // The background image will be repeated only vertically
        NoRepeat,   // The background-image will not be repeated
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/css3_pr_background-origin.asp
    /// </summary>
    public enum EnumCssBackgroundOriginValue
    {
        PaddingBox, // Default value. The background image is positioned relative to the padding box
        BorderBox,  // The background image is positioned relative to the border box
        ContentBox, // The background image is positioned relative to the content box
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/css3_pr_background-clip.asp
    /// </summary>
    public enum EnumCssBackgroundClipValue
    {
        BorderBox,  // Default value. The background is clipped to the border box
        PaddingBox, // The background is clipped to the padding box
        ContentBox, // The background is clipped to the content box
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_background-attachment.asp
    /// </summary>
    public enum EnumCssBackgroundAttachmentValue
    {
        Scroll,     // The background scrolls along with the element. This is default
        Fixed,      // The background is fixed with regard to the viewport
        Local,      // The background scrolls along with the element's contents
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_background-image.asp
    /// </summary>
    public enum EnumCssBackgroundImageValue
    {
        Url,        // The url('url') to the image. To specify more than one image, separate the URLs with a comma
        None,       // No background image will be displayed. This is default
    }

    #endregion Background Group

    #region Font Group

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_font_font-size.asp
    /// </summary>
    public enum EnumCssFontSizeValue
    {
        Medium,     // Sets the font-size to a medium size. This is default
        XxSmall,    // Sets the font-size to an xx-small size
        XSmall,     // Sets the font-size to an extra small size
        Small,      // Sets the font-size to a small size
        Large,      // Sets the font-size to a large size
        XLarge,     // Sets the font-size to an extra large size
        XxLarge,    // Sets the font-size to an xx-large size
        Smaller,    // Sets the font-size to a smaller size than the parent element
        Larger,     // Sets the font-size to a larger size than the parent element
        //Length,     // Sets the font-size to a fixed size in px, cm, etc.
        //%,          // Sets the font-size to a percent of the parent element's font size
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_font_font-style.asp
    /// </summary>
    public enum EnumCssFontStyleValue
    {
        Normal,     // The browser displays a normal font style. This is default
        Italic,     // The browser displays an italic font style
        Oblique,    // The browser displays an oblique font style
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_font_font-variant.asp
    /// </summary>
    public enum EnumCssFontVariantValue
    {
        Normal,     // The browser displays a normal font. This is default
        SmallCaps,  // The browser displays a small-caps font
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_font_weight.asp
    /// </summary>
    public enum EnumCssFontWeightValue
    {
        Normal,     // Defines normal characters. This is default
        Bold,       // Defines thick characters
        Bolder,     // Defines thicker characters
        Lighter,    // Defines lighter characters
        //// Defines from thin to thick characters. 400 is the same as normal, and 700 is the same as bold
        //100,
        //200,
        //300,
        //400,
        //500,
        //600,
        //700,
        //800,
        //900,
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_font_font.asp
    /// </summary>
    public enum EnumCssFontValue
    {
        Caption,        // Uses the font that are used by captioned controls (like buttons, drop-downs, etc.)
        Icon,           // Uses the font that are used by icon labels
        Menu,           // Uses the fonts that are used by dropdown menus
        MessageBox,     // Uses the fonts that are used by dialog boxes
        SmallCaption,   // A smaller version of the caption font
        StatusBar,      // Uses the fonts that are used by the status bar
    }

    #endregion Font Group

    #region Text Group

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_text_direction.asp
    /// </summary>
    public enum EnumCssDirectionValue
    {
        Ltr,// The writing direction is left-to-right. This is default
        Rtl,// The writing direction is right-to-left
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_text_letter-spacing.asp
    /// </summary>
    public enum EnumCssLetterSpacingValue
    {
        Normal,// No extra space between characters. This is default
        //Length,// Defines an extra space between characters (negative values are allowed)
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_dim_line-height.asp
    /// </summary>
    public enum EnumCssLineHeightValue
    {
        Normal,// A normal line height. This is default
        //Number,// A number that will be multiplied with the current font size to set the line height
        //Length,// A fixed line height in px, pt, cm, etc.
        //%,     // A line height in percent of the current font size
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_text_text-align.asp
    /// </summary>
    public enum EnumCssTextAlignValue
    {
        Left,       // Aligns the text to the left
        Right,      // Aligns the text to the right
        Center,     // Centers the text
        Justify,    // Stretches the lines so that each line has equal width (like in newspapers and magazines)
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_text_text-decoration.asp
    /// </summary>
    public enum EnumCssTextDecorationValue
    {
        None,       // Defines a normal text. This is default
        Underline,  // Defines a line below the text
        Overline,   // Defines a line above the text
        LineThrough,// Defines a line through the text
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_text_text-indent.asp
    /// </summary>
    public enum EnumCssTextIndentValue
    {
        //Length,// Defines a fixed indentation in px, pt, cm, em, etc. Default value is 0
        //%,// Defines the indentation in % of the width of the parent element
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/css3_pr_text-shadow.asp
    /// </summary>
    public enum EnumCssTextShadowValue
    {
        HShadow,    // Required. The position of the horizontal shadow. Negative values are allowed
        VShadow,    // Required. The position of the vertical shadow. Negative values are allowed
        Blur,       // Optional. The blur distance
        Color,      // Optional. The color of the shadow. Look at CSS Color Values for a complete list of possible color values
        None,       // Default value. No shadow
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_text_text-transform.asp
    /// </summary>
    public enum EnumCssTextTransformValue
    {
        None,       // No capitalization. The text renders as it is. This is default
        Capitalize, // Transforms the first character of each word to uppercase
        Uppercase,  // Transforms all characters to uppercase
        Lowercase,  // Transforms all characters to lowercase
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_text_unicode-bidi.asp
    /// </summary>
    public enum EnumCssUnicodeBidiValue
    {
        Normal,         // Does not use an additional level of embedding. This is default
        Embed,          // Creates an additional level of embedding
        BidiOverride,   // Creates an additional level of embedding. Reordering depends on the direction property
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_pos_vertical-align.asp
    /// </summary>
    public enum EnumCssVerticalAlignValue
    {
        Baseline,   // Align the baseline of the element with the baseline of the parent element. This is default
        Sub,        // Aligns the element as if it was subscript
        Super,      // Aligns the element as if it was superscript
        Top,        // The top of the element is aligned with the top of the tallest element on the line
        TextTop,    // The top of the element is aligned with the top of the parent element's font
        Middle,     // The element is placed in the middle of the parent element
        Bottom,     // The bottom of the element is aligned with the lowest element on the line
        TextBottom, // The bottom of the element is aligned with the bottom of the parent element's font
        //Length,     // Raises or lower an element by the specified length. Negative values are allowed
        //%,          // Raises or lower an element in a percent of the "line-height" property. Negative values are allowed
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_text_white-space.asp
    /// </summary>
    public enum EnumCssWhiteSpaceValue
    {
        Normal,     // Sequences of whitespace will collapse into a single whitespace. Text will wrap when necessary. This is default
        Nowrap,     // Sequences of whitespace will collapse into a single whitespace. Text will never wrap to the next line. The text continues on the same line until a <br> tag is encountered
        Pre,        // Whitespace is preserved by the browser. Text will only wrap on line breaks. Acts like the <pre> tag in HTML
        PreLline,   // Sequences of whitespace will collapse into a single whitespace. Text will wrap when necessary, and on line breaks
        PreWrap,    // Whitespace is preserved by the browser. Text will wrap when necessary, and on line breaks 
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_text_word-spacing.asp
    /// </summary>
    public enum EnumCssWordSpacingValue
    {
        Normal,// Defines normal space between words . This is default
        //Length,// Defines an extra space between words in px, pt, cm, em, etc. Negative values are allowed 
    }

    #endregion Text Group

    #region Dimension Group

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_dim_width.asp
    /// Shared by: Height, Top, Bottom, Left, Right
    /// </summary>
    public enum EnumCssLengthPositionValue
    {
        Auto,   // Default value. The browser calculates the width
        //length, // Defines the width in px, cm, etc. 
        //%,      // Defines the width in percent of the containing block
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_dim_max-width.asp
    /// Shared by: MaxHeight
    /// </summary>
    public enum EnumCssMaxLengthValue
    {
        None,   // No maximum width. This is default
        //Length, // Defines the maximum width in px, cm, etc. 
        //%,      // Defines the maximum width in percent of the containing block
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_dim_min-width.asp
    /// Shared by: MinHeight
    /// </summary>
    public enum EnumCssMinLenghtValue
    {
        //length,// Default value is 0. Defines the minimum width in px, cm, etc.
        //%,// Defines the minimum width in percent of the containing block 
    }

    #endregion Dimension Group

    #region Positioning Group

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_pos_clip.asp
    /// </summary>
    public enum EnumCssClipValue
    {
        Auto,   // No clipping will be applied. This is default
        Shape,  // Clips an element. The only valid value is: rect (top, right, bottom, left)
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_class_cursor.asp
    /// </summary>
    public enum EnumCssCursorValue
    {
        Alias,          // The cursor indicates an alias of something is to be created
        AllScroll,      // The cursor indicates that something can be scrolled in any direction
        Auto,           // Default. The browser sets a cursor
        Cell,           // The cursor indicates that a cell (or set of cells) may be selected
        ContextMenu,    // The cursor indicates that a context-menu is available
        ColResize,      // The cursor indicates that the column can be resized horizontally
        Copy,           // The cursor indicates something is to be copied
        Crosshair,      // The cursor render as a crosshair
        Default,        // The default cursor
        EResize,        // The cursor indicates that an edge of a box is to be moved right (east)
        EwResize,       // Indicates a bidirectional resize cursor
        Help,           // The cursor indicates that help is available
        Move,           // The cursor indicates something is to be moved
        NResize,        // The cursor indicates that an edge of a box is to be moved up (north)
        NeResize,       // The cursor indicates that an edge of a box is to be moved up and right (north/east)
        NeswResize,     // Indicates a bidirectional resize cursor
        NsResize,       // Indicates a bidirectional resize cursor
        NwResize,       // The cursor indicates that an edge of a box is to be moved up and left (north/west)
        NwseResize,     // Indicates a bidirectional resize cursor
        NoDrop,         // The cursor indicates that the dragged item cannot be dropped here
        None,           // No cursor is rendered for the element
        NotAllowed,     // The cursor indicates that the requested action will not be executed
        Pointer,        // The cursor is a pointer and indicates a link
        Progress,       // The cursor indicates that the program is busy (in progress)
        RowResize,      // The cursor indicates that the row can be resized vertically
        SResize,        // The cursor indicates that an edge of a box is to be moved down (south)
        SeResize,       // The cursor indicates that an edge of a box is to be moved down and right (south/east)
        SwResize,       // The cursor indicates that an edge of a box is to be moved down and left (south/west)
        Text,           // The cursor indicates text that may be selected
        Url,            // A comma separated list of URLs to custom cursors.
                        // Note: Always specify a generic cursor at the end of the list, in case none of the URL-defined cursors can be used
        VerticalText,   // The cursor indicates vertical-text that may be selected
        WResize,        // The cursor indicates that an edge of a box is to be moved left (west)
        Wait,           // The cursor indicates that the program is busy
        ZoomIn,         // The cursor indicates that something can be zoomed in
        ZoomOut,        // The cursor indicates that something can be zoomed out
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_pos_overflow.asp
    /// </summary>
    public enum EnumCssOverflowValue
    {
        Visible,    // The overflow is not clipped. It renders outside the element's box. This is default
        Hidden,     // The overflow is clipped, and the rest of the content will be invisible
        Scroll,     // The overflow is clipped, but a scroll-bar is added to see the rest of the content
        Auto,       // If overflow is clipped, a scroll-bar should be added to see the rest of the content
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_class_position.asp
    /// </summary>
    public enum EnumCssPositionValue
    {
        Static,     // Default value. Elements render in order, as they appear in the document flow
        Absolute,   // The element is positioned relative to its first positioned (not static) ancestor element
        Fixed,      // The element is positioned relative to the browser window
        Relative,   // The element is positioned relative to its normal position, so "left:20" adds 20 pixels to the element's LEFT position
    }

    /// <summary>
    /// http://www.w3schools.com/cssref/pr_pos_z-index.asp
    /// </summary>
    public enum EnumCssZIndexValue
    {
        Auto,   // Sets the stack order equal to its parents. This is default
        //Number, // Sets the stack order of the element. Negative numbers are allowed
    }

    #endregion Positioning Group
}



