using System.Windows.Forms;

namespace VersionDiff
{
    public partial class DbConnectionStringForm : Form
    {
        public DbConnectionStringForm()
        {
            InitializeComponent();
        }

        public string ConnectionString
        {
            get { return this.txtConnectionString.Text; }
            set { this.txtConnectionString.Text = value; }
        }
    }
}