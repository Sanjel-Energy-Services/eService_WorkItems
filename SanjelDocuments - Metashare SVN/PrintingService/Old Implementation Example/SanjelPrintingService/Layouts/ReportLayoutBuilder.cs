
using System;
using System.Drawing;
using System.IO;
using System.Xml;
using System.Collections.Generic;

using Sanjel.PrintingService.CSS;
using Sanjel.PrintingService.CSS.Interpreter;
using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Reports;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Layouts
{
    public class XmlUtilities
    {
        public static XmlDocument ReadXmlFile(string filePath)
        {
            try
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(filePath);
                return doc;
            }
            catch (Exception)
            {
                throw new Exception("Cannot load the file: " + filePath);
            }
        }
    }

    public class ReportLayoutBuilder
    {
        private readonly Report _report;
        private CssController _cssController;
        private XmlDocument _xmlDoc;
        private ISection _currentSection;
        private StyleModel _globeStyles;

        public ReportLayoutBuilder(Report report)
        {
            _report = report;
        }

        public void BuildReportLayout()
        {
            if (LoadConfigurations())
            {
                if (_xmlDoc.DocumentElement == null || String.Compare(PriceBookDefinition.TagReport, _xmlDoc.DocumentElement.Name, StringComparison.OrdinalIgnoreCase) != 0)
                {
                    throw new Exception("Cannot find the root node of report");
                }

                string objId = (_xmlDoc.DocumentElement.Attributes[PriceBookDefinition.AttId] == null) ? "" : _xmlDoc.DocumentElement.Attributes[PriceBookDefinition.AttId].Value;
                string objClass = (_xmlDoc.DocumentElement.Attributes[PriceBookDefinition.AttClass] == null) ? "" : _xmlDoc.DocumentElement.Attributes[PriceBookDefinition.AttClass].Value;
                _globeStyles = CreateGridStyleModel("", objId, objClass, null);

                List<CssInterpreterModel> interpreterModels = _cssController.GetInterpreterModels("paper", "paper", null);
                _report.PaperInfo = CreateGridStyleModel(interpreterModels, null);

                XmlNode sectionsNode = _xmlDoc.DocumentElement.SelectSingleNode(PriceBookDefinition.TagSections);
                if (sectionsNode != null)
                {
                    foreach (XmlNode childNode in sectionsNode.ChildNodes)
                    {
                        //if (String.Compare(TagSection, childNode.Name, StringComparison.OrdinalIgnoreCase) == 0)
                        {
                            BuildSection(childNode);
                        }
                    }
                }
            }
        }

        private bool LoadConfigurations()
        {
            // load XML file for layouts and templates
            _xmlDoc = XmlUtilities.ReadXmlFile(_report.LayoutFile);

            // load CSS file for styles
            _cssController = new CssController(_report.StyleFile);
            return true;
        }

        private void BuildSection(XmlNode sectionNode)
        {
            string nameSpacePrefix = typeof(ISection).Namespace + ".";
            string typeName = sectionNode.Name;
            string objId = (sectionNode.Attributes == null || sectionNode.Attributes[PriceBookDefinition.AttId] == null) ? "" : sectionNode.Attributes[PriceBookDefinition.AttId].Value;
            ISection section = BuildInstance(nameSpacePrefix, typeName, objId) as ISection;
            _currentSection = section;

            if (section != null)
            {
                section.FromNewPaper = (sectionNode.Attributes == null || sectionNode.Attributes[PriceBookDefinition.FromNewPaper] == null) ? true : bool.Parse(sectionNode.Attributes[PriceBookDefinition.FromNewPaper].Value);
                string objClass = (sectionNode.Attributes == null || sectionNode.Attributes[PriceBookDefinition.AttClass] == null) ? "" : sectionNode.Attributes[PriceBookDefinition.AttClass].Value;
                section.MainPanel = BuildFrameAndStyle("VerticalPanel", objId, objClass, _globeStyles) as Panel;

                if (section.MainPanel != null)
                {
                    section.NumberModel = BuildPageNumberModel(sectionNode.SelectSingleNode(PriceBookDefinition.TagPageNumber));
                    //section.Model = BuildDataModel(sectionNode.SelectSingleNode(PriceBookDefinition.TagDataSets));
                    section.FrontSeparator = BuildRootFrame(sectionNode.SelectSingleNode(PriceBookDefinition.TagFrontSeparator), section.MainPanel.Styles);
                    section.PageHeader = BuildRootFrame(sectionNode.SelectSingleNode(PriceBookDefinition.TagPageHeader), section.MainPanel.Styles);
                    section.PageFooter = BuildRootFrame(sectionNode.SelectSingleNode(PriceBookDefinition.TagPageFooter), section.MainPanel.Styles);

                    BuildRootFrame(sectionNode.SelectSingleNode(PriceBookDefinition.TagPageNumber), section.MainPanel.Styles);

                    XmlNode contentNode = sectionNode.SelectSingleNode(PriceBookDefinition.TagPageContent);
                    if (contentNode != null && contentNode.ChildNodes.Count != 0)
                    {
                        foreach (XmlNode childNode in contentNode.ChildNodes)
                        {
                            Frame frame = BuildFrameWithNode(childNode, section.MainPanel.Styles);
                            if (frame != null)
                            {
                                section.MainPanel.Frames.Add(frame);
                            }
                        }
                    }
                    _report.Sections.Add(section);
                }

                //if (sectionNode.Attributes == null || sectionNode.Attributes[PriceBookDefinition.AttFilePath] == null)
                //{
                //    string source = sectionNode.Attributes[PriceBookDefinition.AttId].Value;
                //}
            }
        }

        private Frame BuildRootFrame(XmlNode frameNode, StyleModel parentStyles)
        {
            if (frameNode == null || frameNode.ChildNodes.Count == 0)
            {
                return null;
            }

            Frame rootFrame = null;
            foreach (XmlNode childNode in frameNode.ChildNodes)
            {
                Frame frame = BuildFrameWithNode(childNode, parentStyles);
                if (frame != null)
                {
                    rootFrame = frame;
                    break;
                }
            }
            return rootFrame;
        }

        private PageNumberModel BuildPageNumberModel(XmlNode node)
        {
            PageNumberModel model = new PageNumberModel();
            if (node != null && node.Attributes != null)
            {
                if (node.Attributes[PriceBookDefinition.AttPrefix] != null)
                    model.Prefix = node.Attributes[PriceBookDefinition.AttPrefix].Value;
                if (node.Attributes[PriceBookDefinition.AttSuffix] != null)
                    model.Suffix = node.Attributes[PriceBookDefinition.AttSuffix].Value;
                if (node.Attributes[PriceBookDefinition.AttStartNumber] != null)
                {
                    int number;
                    int.TryParse(node.Attributes[PriceBookDefinition.AttStartNumber].Value, out number);
                    model.StartNumber = number;
                }
                if (node.Attributes[PriceBookDefinition.AttPattern] != null)
                {
                    EnumPageNumberStyle style;
                    Enum.TryParse(node.Attributes[PriceBookDefinition.AttPattern].Value, out style);
                    model.Style = style;
                }
            }
            return model;
        }

        private Frame BuildFrameWithNode(XmlNode frameNode, StyleModel parentStyles)
        {
            string typeName = frameNode.Name;
            string frameId = (frameNode.Attributes == null || frameNode.Attributes[PriceBookDefinition.AttId] == null) ? "" : frameNode.Attributes[PriceBookDefinition.AttId].Value;
            string frameClass = (frameNode.Attributes == null || frameNode.Attributes[PriceBookDefinition.AttClass] == null) ? "" : frameNode.Attributes[PriceBookDefinition.AttClass].Value;
            Frame frame = BuildFrameAndStyle(typeName, frameId, frameClass, parentStyles);
            if (frame != null)
            {
                Panel panel = frame as Panel;
                if (panel != null)
                {
                    foreach (XmlNode childNode in frameNode.ChildNodes)
                    {
                        Frame childFrame = BuildFrameWithNode(childNode, frame.Styles);
                        if (childFrame != null)
                        {
                            panel.Frames.Add(childFrame);
                        }
                    }
                }

                if (frame is GridControl)
                {
                    SetupDataGridControl(frame as GridControl, frameNode);
                }

                else if (frame is ImageControl)
                {
                    if (frameNode.Attributes != null && frameNode.Attributes[PriceBookDefinition.AttFilePath] != null)
                    {
                        string source = frameNode.Attributes[PriceBookDefinition.AttFilePath].Value;
                        source = Path.IsPathRooted(source) ? source : Path.Combine(_report.ConfigurationsPath, source);
                        ((ImageControl)frame).Model = new ImageModel(source);
                    }
                }

                else if (frame is TextBoxControl)
                {
                    SetupTextBoxControl(frame as TextBoxControl, frameNode);
                }

                else if (frame is TextFieldControl)
                {
                    SetupTextFieldControl(frame as TextFieldControl, frameNode);
                }

                else if (frame is VerticalTextFieldControl)
                {
                    SetupVerticalTextFieldControl(frame as VerticalTextFieldControl, frameNode);
                }

                else if (frame is PageNumberControl)
                {
                    ((PageNumberControl)frame).Model = _currentSection.NumberModel;
                }

                else if (frame is ControlGroup)
                {
                    ControlGroup group = frame as ControlGroup;
                    group.Condition = (frameNode.Attributes == null || frameNode.Attributes[PriceBookDefinition.AttCondition] == null) ? "" : frameNode.Attributes[PriceBookDefinition.AttCondition].Value;
                    group.DataField = (frameNode.Attributes == null || frameNode.Attributes[PriceBookDefinition.AttDataField] == null) ? "" : frameNode.Attributes[PriceBookDefinition.AttDataField].Value;
                }
            }
            return frame;
        }

        private void SetupDataGridControl(GridControl grid, XmlNode gridNode)
        {
            grid.DataTableName = (gridNode.Attributes == null || gridNode.Attributes[PriceBookDefinition.AttDataTable] == null) ? "" : gridNode.Attributes[PriceBookDefinition.AttDataTable].Value;
            grid.ColumnTemplate = (gridNode.Attributes == null || gridNode.Attributes[PriceBookDefinition.AttTemplate] == null) ? "" : gridNode.Attributes[PriceBookDefinition.AttTemplate].Value;

            foreach (XmlNode childNode in gridNode.ChildNodes)
            {
                if (String.Compare(childNode.Name, PriceBookDefinition.TagGridColumns, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    BuildColumnTemplate(grid, childNode);
                }
                if (String.Compare(childNode.Name, PriceBookDefinition.TagGridRow, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    BuildRowTemplate(grid, childNode);
                }
            }
        }

        private void BuildColumnTemplate(GridControl grid, XmlNode columnsNode)
        {
            foreach (XmlNode childNode in columnsNode.ChildNodes)
            {
                if (String.Compare(childNode.Name, PriceBookDefinition.TagGridColumn, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    string id = (childNode.Attributes == null || childNode.Attributes[PriceBookDefinition.AttId] == null) ? "" : childNode.Attributes[PriceBookDefinition.AttId].Value;
                    string objClass = (childNode.Attributes == null || childNode.Attributes[PriceBookDefinition.AttClass] == null) ? "" : childNode.Attributes[PriceBookDefinition.AttClass].Value;
                    GridColumnControl columnControl = new GridColumnControl(id)
                                                          {
                                                              Styles =
                                                                  CreateGridStyleModel(typeof (GridCellControl).Name, id,
                                                                                       objClass, grid.Styles)
                                                          };
                    grid.Columns.Add(columnControl);
                }
            }
        }

        private void BuildRowTemplate(GridControl grid, XmlNode rowNode)
        {
            string rowId = (rowNode.Attributes == null || rowNode.Attributes[PriceBookDefinition.AttId] == null) ? "" : rowNode.Attributes[PriceBookDefinition.AttId].Value;
            string objClass = (rowNode.Attributes == null || rowNode.Attributes[PriceBookDefinition.AttClass] == null) ? "" : rowNode.Attributes[PriceBookDefinition.AttClass].Value;
            bool groupBy = rowNode.Attributes != null &&
                           rowNode.Attributes[PriceBookDefinition.AttGroupBy] != null &&
                           String.Compare(rowNode.Attributes[PriceBookDefinition.AttGroupBy].Value, Boolean.TrueString, StringComparison.OrdinalIgnoreCase) == 0;

            GridRowControl rowControl = new GridRowControl(rowId, groupBy)
                                            {
                                                Styles =
                                                    CreateGridStyleModel(typeof (GridRowControl).Name, rowId, objClass,
                                                                         grid.Styles)
                                            };
            grid.Rows.Add(rowId, rowControl);

            foreach (XmlNode cellNode in rowNode.ChildNodes)
            {
                if (String.Compare(cellNode.Name, PriceBookDefinition.TagGridCell, StringComparison.OrdinalIgnoreCase) == 0)
                {
                    BuildCellTemplate(rowControl, cellNode);
                }
            }
        }

        private void BuildCellTemplate(GridRowControl rowControl, XmlNode cellNode)
        {
            string objId = (cellNode.Attributes == null || cellNode.Attributes[PriceBookDefinition.AttId] == null) ? "" : cellNode.Attributes[PriceBookDefinition.AttId].Value;
            string objClass = (cellNode.Attributes == null || cellNode.Attributes[PriceBookDefinition.AttClass] == null) ? "" : cellNode.Attributes[PriceBookDefinition.AttClass].Value;
            string dataField = (cellNode.Attributes == null || cellNode.Attributes[PriceBookDefinition.AttDataField] == null) ? "" : cellNode.Attributes[PriceBookDefinition.AttDataField].Value;
            string objStretch = (cellNode.Attributes == null || cellNode.Attributes[PriceBookDefinition.AttStretch] == null) ? "" : cellNode.Attributes[PriceBookDefinition.AttStretch].Value;
            string objType = (cellNode.Attributes == null || cellNode.Attributes[PriceBookDefinition.AttType] == null) ? "" : cellNode.Attributes[PriceBookDefinition.AttType].Value;
            string label = cellNode.InnerText;

            int startCol = 0, endCol = 0;
            if (cellNode.Attributes != null && cellNode.Attributes[PriceBookDefinition.AttStartColumn] != null)
                Int32.TryParse(cellNode.Attributes[PriceBookDefinition.AttStartColumn].Value, out startCol);
            if (cellNode.Attributes != null && cellNode.Attributes[PriceBookDefinition.AttEndColumn] != null)
                Int32.TryParse(cellNode.Attributes[PriceBookDefinition.AttEndColumn].Value, out endCol);

            GridCellControl cellControl = new GridCellControl(objId, startCol, endCol, dataField, label)
                                              {
                                                  Styles = CreateGridStyleModel(typeof (GridRowControl).Name, objId, objClass, rowControl.Styles)
                                              };
            EnumStretchType stretch;
            Enum.TryParse(objStretch, true, out stretch);
            cellControl.Stretch = stretch;

            EnumCellControlType controlType;
            Enum.TryParse(objType, true, out controlType);
            cellControl.ControlType = controlType;

            rowControl.Cells.Add(cellControl);

            foreach (XmlNode childNode in cellNode.ChildNodes)
            {
                Frame frame = BuildFrameWithNode(childNode, cellControl.Styles);
                if (frame != null)
                {
                    cellControl.Control = frame as Control;
                    break;
                }
            }
        }

        private void SetupTextFieldControl(TextFieldControl textField, XmlNode textBoxNode)
        {
            if (textBoxNode.Attributes != null)
            {
                if (textBoxNode.Attributes[PriceBookDefinition.AttDataField] != null)
                {
                    string dataField = textBoxNode.Attributes[PriceBookDefinition.AttDataField].Value;
                    string pattern = (textBoxNode.Attributes[PriceBookDefinition.AttPattern] == null) ? ""
                                         : textBoxNode.Attributes[PriceBookDefinition.AttPattern].Value;
                    textField.Model = new TextFieldModel(new TextField(EnumTextFieldType.PropertyPath, dataField, pattern));
                }
                else
                {
                    string label = (textBoxNode.Attributes[PriceBookDefinition.AttText] == null) ? ""
                                       : textBoxNode.Attributes[PriceBookDefinition.AttText].Value;
                    textField.Model = new TextFieldModel(new TextField(EnumTextFieldType.ConstantText, label, ""));
                }
            }
        }

        private void SetupVerticalTextFieldControl(VerticalTextFieldControl textField, XmlNode textBoxNode)
        {
            if (textBoxNode.Attributes != null)
            {
                if (textBoxNode.Attributes[PriceBookDefinition.AttDataField] != null)
                {
                    string dataField = textBoxNode.Attributes[PriceBookDefinition.AttDataField].Value;
                    string pattern = (textBoxNode.Attributes[PriceBookDefinition.AttPattern] == null) ? ""
                                         : textBoxNode.Attributes[PriceBookDefinition.AttPattern].Value;
                    textField.Model = new TextFieldModel(new TextField(EnumTextFieldType.PropertyPath, dataField, pattern));
                }
                else
                {
                    string label = (textBoxNode.Attributes[PriceBookDefinition.AttText] == null) ? ""
                                       : textBoxNode.Attributes[PriceBookDefinition.AttText].Value;
                    textField.Model = new TextFieldModel(new TextField(EnumTextFieldType.ConstantText, label, ""));
                }
            }
        }

        private void SetupTextBoxControl(TextBoxControl textBox, XmlNode textBoxNode)
        {
            XmlNode contentNode = textBoxNode.SelectSingleNode(PriceBookDefinition.TagContent);
            if (contentNode != null && contentNode.ChildNodes.Count > 0)
            {
                TextBoxModel model = new TextBoxModel();
                textBox.Model = model;
                foreach (XmlNode paragraphNode in contentNode.ChildNodes)
                {
                    if (string.Compare(paragraphNode.Name, PriceBookDefinition.TagParagraph, StringComparison.OrdinalIgnoreCase) == 0)
                    {
                        StyleModel paragraphStyles = CreateGridStyleModel(paragraphNode, textBox.Styles);
                        HtmlTextParagraph paragraph = new HtmlTextParagraph();
                        foreach (XmlNode pieceNode in paragraphNode.ChildNodes)
                        {
                            if (string.Compare(pieceNode.Name, PriceBookDefinition.TagField, StringComparison.OrdinalIgnoreCase) == 0)
                            {
                                BuildHtmlTextField(pieceNode, paragraph, paragraphStyles);
                            }
                        }
                        if (paragraph.TextPieces.Count > 0)
                        {
                            model.Paragraphs.Add(paragraph);
                        }
                    }
                }
            }
        }

        private Frame BuildFrameAndStyle(string objTypeName, string objId, string classText, StyleModel parentStyles)
        {
            string nameSpacePrefix = typeof (Frame).Namespace + ".";
            Frame frame = BuildInstance(nameSpacePrefix, objTypeName, objId) as Frame;
            if (frame != null)
            {
                frame.Styles = CreateGridStyleModel(objTypeName, objId, classText, parentStyles);
            }
            return frame;
        }

        private object BuildInstance(string nameSpacePrefix, string objTypeName, string objId)
        {
            string fullTypeName = nameSpacePrefix + objTypeName;
            Type type = Type.GetType(fullTypeName);
            if (type == null)
            {
                return null;
            }
            return Activator.CreateInstance(type, new object[] { objId });
        }

        private void BuildHtmlTextField(XmlNode pieceNode, HtmlTextParagraph paragraph, StyleModel parentStyles)
        {
            if (pieceNode != null && pieceNode.Attributes != null)
            {
                StyleModel pieceStyles = CreateGridStyleModel(pieceNode, parentStyles);
                KeyValuePair<string, string> styleCode = BuildHtmlString(pieceStyles);
                if (pieceNode.Attributes[PriceBookDefinition.AttText] != null)
                {
                    paragraph.TextPieces.Add(new HtmlTextField(EnumTextFieldType.ConstantText, pieceNode.Attributes[PriceBookDefinition.AttText].Value,
                                                               "", styleCode.Key, styleCode.Value));
                }
                else if (pieceNode.Attributes[PriceBookDefinition.AttDataField] != null)
                {
                    string pattern = (pieceNode.Attributes[PriceBookDefinition.AttPattern] == null) ? "" : pieceNode.Attributes[PriceBookDefinition.AttPattern].Value;
                    HtmlTextField field = new HtmlTextField(EnumTextFieldType.PropertyPath, pieceNode.Attributes[PriceBookDefinition.AttDataField].Value,
                                                            pattern, styleCode.Key, styleCode.Value);
                    paragraph.TextPieces.Add(field);
                }
            }
        }

        public static KeyValuePair<string, string> BuildHtmlString(StyleModel styleModel)
        {
            string prefix = "", suffix = "";
            if (styleModel.TextFont.Name != null)
            {
                prefix += "<font face='" + styleModel.TextFont.Name + "'";
            }
            if (styleModel.TextFont.Size > 0)
            {
                prefix = (prefix.Length == 0) ? "<font size='" : prefix + " size='";
                prefix += styleModel.TextFont.Size + "'";
            }
            if (styleModel.TextFormat.Color != Color.Empty)
            {
                prefix = (prefix.Length == 0) ? "<font color='" : prefix + " color='";
                prefix += ColorTranslator.ToHtml(styleModel.TextFormat.Color) + "'";
            }
            if (prefix.Length > 0)
            {
                prefix += ">";
                suffix = "</font>" + suffix;
            }

            if (styleModel.TextFont.Weight != EnumFontWeight.Normal)
            {
                prefix += "<b>";
                suffix = "</b>" + suffix;
            }
            if (styleModel.TextFont.Style != EnumFontStyle.Normal)
            {
                prefix += "<i>";
                suffix = "</i>" + suffix;
            }
            switch (styleModel.TextFont.Decoration)
            {
                case EnumFontDecoration.Overline:
                    prefix += "<o>";
                    suffix = "</o>" + suffix;
                    break;
                case EnumFontDecoration.Underline:
                    prefix += "<u>";
                    suffix = "</u>" + suffix;
                    break;
                case EnumFontDecoration.Linethrough:
                    prefix += "<st>";
                    suffix = "</st>" + suffix;
                    break;
            }

            KeyValuePair<string, string> styleCode = new KeyValuePair<string, string>(prefix, suffix);
            return styleCode;
        }

        private StyleModel CreateGridStyleModel(XmlNode node, StyleModel parentStyles)
        {
            List<CssInterpreterModel> interpreterModels = null;
            if (node != null && node.Attributes != null)
            {
                string objectId = (node.Attributes[PriceBookDefinition.AttId] == null) ? "" : node.Attributes[PriceBookDefinition.AttId].Value;
                string classText = (node.Attributes[PriceBookDefinition.AttClass] == null) ? "" : node.Attributes[PriceBookDefinition.AttClass].Value;
                List<string> classList = null;
                if (!string.IsNullOrEmpty(classText))
                {
                    classList = new List<string>(classText.Split(' '));
                }
                interpreterModels = _cssController.GetInterpreterModels(node.Name, objectId, classList);
            }
            return CreateGridStyleModel(interpreterModels, parentStyles);
        }

        private StyleModel CreateGridStyleModel(string objTypeName, string objId, string classText, StyleModel parentStyles)
        {
            List<string> classList = null;
            if (!string.IsNullOrEmpty(classText))
            {
                classList = new List<string>(classText.Split(' '));
            }
            List<CssInterpreterModel> interpreterModels = _cssController.GetInterpreterModels(objTypeName, objId, classList);
            return CreateGridStyleModel(interpreterModels, parentStyles);
        }

        private static StyleModel CreateGridStyleModel(IEnumerable<CssInterpreterModel> interpreterModels, StyleModel parentStyleModel)
        {
            // create style model from parent
            StyleModel styleModel = parentStyleModel != null ? new StyleModel(parentStyleModel) : new StyleModel();

            foreach (CssInterpreterModel model in interpreterModels)
            {
                model.InterpretTerm(ref styleModel);
            }
            return styleModel;
        }
    }
}
