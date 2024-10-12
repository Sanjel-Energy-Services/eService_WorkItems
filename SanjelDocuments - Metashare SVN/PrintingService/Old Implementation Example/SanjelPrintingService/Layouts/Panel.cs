
using System.Collections.Generic;

using Sanjel.PrintingService.Styles;

namespace Sanjel.PrintingService.Layouts
{
    public class Panel : Frame
    {
        #region Instance Properties

        public List<Frame> Frames { get; set; }

        #endregion Instance Properties

        #region Constructors

        public Panel()
        {
            InitializePanel();
        }

        public Panel(string id)
            : base(id)
        {
            InitializePanel();
        }

        public Panel(string id, StyleModel styles)
            : base(id, styles)
        {
            InitializePanel();
        }

        #endregion Constructors

        #region Private Methods

        private void InitializePanel(List<Frame> frames = null)
        {
            Frames = frames ?? new List<Frame>();
        }

        #endregion Private Methods

        public override void ReInitialize()
        {
            InitializeRect(true);
            foreach (var frame in Frames)
            {
                frame.ReInitialize();
            }
        }
    }
}
