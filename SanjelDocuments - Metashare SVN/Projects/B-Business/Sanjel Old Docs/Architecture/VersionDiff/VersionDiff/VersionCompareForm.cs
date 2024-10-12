using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace VersionDiff
{
    public partial class VersionCompareForm : Form
    {
        private List<VersionedElement> m_currentVersionElements;
        private List<VersionedElement> m_comparedVersionElements;
        private List<VersionedElement> m_currentVersionExistOnlyElements;
        private List<VersionedElement> m_comparedVersionExistOnlyElements;

        public VersionCompareForm()
        {
            InitializeComponent();
        }

        public List<VersionedElement> CurrentVersionElements
        {
            get { return m_currentVersionElements; }
            set
            {
                m_currentVersionElements = value;
                LoadTreeView(this.tvCurrentVersion, m_currentVersionElements);
                CompareDiff();
            }
        }

        public List<VersionedElement> ComparedVersionElements
        {
            get { return m_comparedVersionElements; }
            set
            {
                m_comparedVersionElements = value;
                LoadTreeView(this.tvComparedVersion, m_comparedVersionElements);
                CompareDiff();
            }
        }

        private void CompareDiff()
        {
            m_currentVersionExistOnlyElements = VersionedElement.CompareDifference(m_currentVersionElements, m_comparedVersionElements);
            m_comparedVersionExistOnlyElements = VersionedElement.CompareDifference(m_comparedVersionElements, m_currentVersionElements);
            LoadTreeView(this.tvCurrentVersionExistOnly, m_currentVersionExistOnlyElements);
            LoadTreeView(this.tvComparedVersionExistOnly, m_comparedVersionExistOnlyElements);
        }

        private void LoadTreeView(TreeView treeView, List<VersionedElement> nodes)
        {
            treeView.Nodes.Clear();
            LoadTreeViewNodes(treeView.Nodes, nodes);
        }

        private void LoadTreeViewNodes(TreeNodeCollection treeNodeCollection, List<VersionedElement> nodes)
        {
            if (nodes != null)
            {
                foreach (VersionedElement node in nodes)
                {
                    TreeNode treeNode = treeNodeCollection.Add(node.ToString());
                    if (node.Children != null)
                    {
                        LoadTreeViewNodes(treeNode.Nodes, node.Children);
                    }
                }
            }
        }

        private void btnHide_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void VersionCompareForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.CloseReason == CloseReason.UserClosing)
            {
                this.Hide();
                e.Cancel = true;
            }
        }
    }
}