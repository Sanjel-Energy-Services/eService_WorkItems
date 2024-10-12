using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;
using Microsoft.Win32;

namespace VersionDiff
{
    public partial class MainForm : Form
    {
        #region Instance Variables

        private VersionCompareForm m_assemblyVersionCompareForm = new VersionCompareForm();
        private VersionCompareForm m_databaseVersionCompareForm = new VersionCompareForm();
        private DbConnectionStringForm m_dlgDbConnectionString = new DbConnectionStringForm();
        private RegistryKey m_versionDiffRegKey;

        #endregion

        #region Constructors

        public MainForm()
        {
            InitializeComponent();

            m_versionDiffRegKey = Registry.CurrentUser.CreateSubKey("VersionDiff");

            CurrentVersionAssemblyFileName = m_versionDiffRegKey.GetValue("CurrentVersionAssemblyFileName") as string;
            ComparedVersionAssemblyFileName = m_versionDiffRegKey.GetValue("ComparedVersionAssemblyFileName") as string;
            CurrentVersionDatabaseConnectionString = m_versionDiffRegKey.GetValue("CurrentVersionDatabaseConnectionString") as string;
            ComparedVersionDatabaseConnectionString = m_versionDiffRegKey.GetValue("ComparedVersionDatabaseConnectionString") as string;
        }

        #endregion

        #region Instance Properties

        private string CurrentVersionAssemblyFileName
        {
            get { return this.txtCurrentVersionAssembly.Text; }
            set
            {
                this.txtCurrentVersionAssembly.Text = value;
                m_assemblyVersionCompareForm.CurrentVersionElements = LoadAssemblyTypes(value);
                m_assemblyVersionCompareForm.Show();
            }
        }

        private string ComparedVersionAssemblyFileName
        {
            get { return this.txtComparedVersionAssembly.Text; }
            set
            {
                this.txtComparedVersionAssembly.Text = value;
                m_assemblyVersionCompareForm.ComparedVersionElements = LoadAssemblyTypes(value);
                m_assemblyVersionCompareForm.Show();
            }
        }

        private string CurrentVersionDatabaseConnectionString
        {
            get { return this.txtCurrentVersionDatabase.Text; }
            set
            {
                this.txtCurrentVersionDatabase.Text = value;
                m_databaseVersionCompareForm.CurrentVersionElements = LoadDatabaseTables(value);
                m_databaseVersionCompareForm.Show();
            }
        }

        private string ComparedVersionDatabaseConnectionString
        {
            get { return this.txtComparedVersionDatabase.Text; }
            set
            {
                this.txtComparedVersionDatabase.Text = value;
                m_databaseVersionCompareForm.ComparedVersionElements = LoadDatabaseTables(value);
                m_databaseVersionCompareForm.Show();
            }
        }

        #endregion

        #region Instance Methods

        private void btnShow_Click(object sender, EventArgs e)
        {
            m_assemblyVersionCompareForm.Show();
        }

        private void btnShowDatabaseDiff_Click(object sender, EventArgs e)
        {
            m_databaseVersionCompareForm.Show();
        }

        private void btnCurrentVersionAssembly_Click(object sender, EventArgs e)
        {
            this.dlgOpenFile.FileName = CurrentVersionAssemblyFileName;
            if (this.dlgOpenFile.ShowDialog() == DialogResult.OK)
            {
                CurrentVersionAssemblyFileName = this.dlgOpenFile.FileName;
                m_versionDiffRegKey.SetValue("CurrentVersionAssemblyFileName", CurrentVersionAssemblyFileName);
            }
        }

        private void btnComparedVersionAssembly_Click(object sender, EventArgs e)
        {
            this.dlgOpenFile.FileName = ComparedVersionAssemblyFileName;
            if (this.dlgOpenFile.ShowDialog() == DialogResult.OK)
            {
                ComparedVersionAssemblyFileName = this.dlgOpenFile.FileName;
                m_versionDiffRegKey.SetValue("ComparedVersionAssemblyFileName", ComparedVersionAssemblyFileName);
            }
        }

        private List<VersionedElement> LoadAssemblyTypes(string fileName)
        {
            if (fileName == null || fileName == string.Empty) return null;
            
            try
            {
                using (AssemblyLoader assemblyLoader = new AssemblyLoader(Path.GetDirectoryName(fileName)))
                {
                    return assemblyLoader.LoadAssembly(fileName);
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
                return null;
            }
        }

        private void btnCurrentVersionDatabase_Click(object sender, EventArgs e)
        {
            this.m_dlgDbConnectionString.ConnectionString = CurrentVersionDatabaseConnectionString;
            if (this.m_dlgDbConnectionString.ShowDialog() == DialogResult.OK)
            {
                CurrentVersionDatabaseConnectionString = this.m_dlgDbConnectionString.ConnectionString;
                m_versionDiffRegKey.SetValue("CurrentVersionDatabaseConnectionString", CurrentVersionDatabaseConnectionString);
            }
        }

        private void btnComparedVersionDatabase_Click(object sender, EventArgs e)
        {
            this.m_dlgDbConnectionString.ConnectionString = ComparedVersionDatabaseConnectionString;
            if (this.m_dlgDbConnectionString.ShowDialog() == DialogResult.OK)
            {
                ComparedVersionDatabaseConnectionString = this.m_dlgDbConnectionString.ConnectionString;
                m_versionDiffRegKey.SetValue("ComparedVersionDatabaseConnectionString", ComparedVersionDatabaseConnectionString);
            }
        }

        private List<VersionedElement> LoadDatabaseTables(string connectionString)
        {
            try
            {
                using (DatabaseLoader databaseLoader = new DatabaseLoader(typeof (OracleConnection), connectionString))
                {
                    return databaseLoader.LoadTables();
                }
            }
            catch (Exception ex)
            {
                Debug.Write(ex);
                return null;
            }
        }

        private void btnNewVersionComparison_Click(object sender, EventArgs e)
        {

        }
        
        #endregion
    }
}