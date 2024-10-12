
using Sanjel.PrintingService.Models;
using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Layouts
{
    public class Control : Frame
    {
        #region Instance Properties

        public virtual IModel Model { get; set; }

        #endregion Instance Properties

        #region Constructors

        public Control()
        {
            InitializeControl();
        }

        public Control(string id)
            : base(id)
        {
            InitializeControl();
        }

        public Control(string id, StyleModel styles)
            : base(id, styles)
        {
            InitializeControl();
        }

        #endregion Constructors

        #region Private Methods

        private void InitializeControl(IModel model = null)
        {
            Model = model;
        }

        #endregion Private Methods
    }
}
