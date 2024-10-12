namespace VersionDiff
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.btnShowAssemblyDiff = new System.Windows.Forms.Button();
            this.lblComparedVersionAssembly = new System.Windows.Forms.Label();
            this.btnComparedVersionAssembly = new System.Windows.Forms.Button();
            this.txtComparedVersionAssembly = new System.Windows.Forms.TextBox();
            this.lblCurrentVersionAssembly = new System.Windows.Forms.Label();
            this.btnCurrentVersionAssembly = new System.Windows.Forms.Button();
            this.txtCurrentVersionAssembly = new System.Windows.Forms.TextBox();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.btnShowDatabaseDiff = new System.Windows.Forms.Button();
            this.lblComparedVersionDatabase = new System.Windows.Forms.Label();
            this.btnComparedVersionDatabase = new System.Windows.Forms.Button();
            this.txtComparedVersionDatabase = new System.Windows.Forms.TextBox();
            this.lblCurrentVersionDatabase = new System.Windows.Forms.Label();
            this.btnCurrentVersionDatabase = new System.Windows.Forms.Button();
            this.txtCurrentVersionDatabase = new System.Windows.Forms.TextBox();
            this.dlgOpenFile = new System.Windows.Forms.OpenFileDialog();
            this.panel1 = new System.Windows.Forms.Panel();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Top;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(738, 181);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.btnShowAssemblyDiff);
            this.tabPage1.Controls.Add(this.lblComparedVersionAssembly);
            this.tabPage1.Controls.Add(this.btnComparedVersionAssembly);
            this.tabPage1.Controls.Add(this.txtComparedVersionAssembly);
            this.tabPage1.Controls.Add(this.lblCurrentVersionAssembly);
            this.tabPage1.Controls.Add(this.btnCurrentVersionAssembly);
            this.tabPage1.Controls.Add(this.txtCurrentVersionAssembly);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(730, 155);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Compare Assemblies";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // btnShowAssemblyDiff
            // 
            this.btnShowAssemblyDiff.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnShowAssemblyDiff.Location = new System.Drawing.Point(632, 110);
            this.btnShowAssemblyDiff.Name = "btnShowAssemblyDiff";
            this.btnShowAssemblyDiff.Size = new System.Drawing.Size(75, 23);
            this.btnShowAssemblyDiff.TabIndex = 1;
            this.btnShowAssemblyDiff.Text = "Show";
            this.btnShowAssemblyDiff.UseVisualStyleBackColor = true;
            this.btnShowAssemblyDiff.Click += new System.EventHandler(this.btnShow_Click);
            // 
            // lblComparedVersionAssembly
            // 
            this.lblComparedVersionAssembly.AutoSize = true;
            this.lblComparedVersionAssembly.Location = new System.Drawing.Point(7, 73);
            this.lblComparedVersionAssembly.Name = "lblComparedVersionAssembly";
            this.lblComparedVersionAssembly.Size = new System.Drawing.Size(93, 13);
            this.lblComparedVersionAssembly.TabIndex = 3;
            this.lblComparedVersionAssembly.Text = "Compared Version";
            // 
            // btnComparedVersionAssembly
            // 
            this.btnComparedVersionAssembly.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnComparedVersionAssembly.Location = new System.Drawing.Point(682, 68);
            this.btnComparedVersionAssembly.Name = "btnComparedVersionAssembly";
            this.btnComparedVersionAssembly.Size = new System.Drawing.Size(25, 23);
            this.btnComparedVersionAssembly.TabIndex = 4;
            this.btnComparedVersionAssembly.Text = "...";
            this.btnComparedVersionAssembly.UseVisualStyleBackColor = true;
            this.btnComparedVersionAssembly.Click += new System.EventHandler(this.btnComparedVersionAssembly_Click);
            // 
            // txtComparedVersionAssembly
            // 
            this.txtComparedVersionAssembly.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtComparedVersionAssembly.Location = new System.Drawing.Point(106, 70);
            this.txtComparedVersionAssembly.Name = "txtComparedVersionAssembly";
            this.txtComparedVersionAssembly.ReadOnly = true;
            this.txtComparedVersionAssembly.Size = new System.Drawing.Size(570, 20);
            this.txtComparedVersionAssembly.TabIndex = 5;
            // 
            // lblCurrentVersionAssembly
            // 
            this.lblCurrentVersionAssembly.AutoSize = true;
            this.lblCurrentVersionAssembly.Location = new System.Drawing.Point(21, 33);
            this.lblCurrentVersionAssembly.Name = "lblCurrentVersionAssembly";
            this.lblCurrentVersionAssembly.Size = new System.Drawing.Size(79, 13);
            this.lblCurrentVersionAssembly.TabIndex = 0;
            this.lblCurrentVersionAssembly.Text = "Current Version";
            // 
            // btnCurrentVersionAssembly
            // 
            this.btnCurrentVersionAssembly.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCurrentVersionAssembly.Location = new System.Drawing.Point(682, 29);
            this.btnCurrentVersionAssembly.Name = "btnCurrentVersionAssembly";
            this.btnCurrentVersionAssembly.Size = new System.Drawing.Size(25, 23);
            this.btnCurrentVersionAssembly.TabIndex = 1;
            this.btnCurrentVersionAssembly.Text = "...";
            this.btnCurrentVersionAssembly.UseVisualStyleBackColor = true;
            this.btnCurrentVersionAssembly.Click += new System.EventHandler(this.btnCurrentVersionAssembly_Click);
            // 
            // txtCurrentVersionAssembly
            // 
            this.txtCurrentVersionAssembly.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtCurrentVersionAssembly.Location = new System.Drawing.Point(106, 31);
            this.txtCurrentVersionAssembly.Name = "txtCurrentVersionAssembly";
            this.txtCurrentVersionAssembly.ReadOnly = true;
            this.txtCurrentVersionAssembly.Size = new System.Drawing.Size(570, 20);
            this.txtCurrentVersionAssembly.TabIndex = 2;
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.btnShowDatabaseDiff);
            this.tabPage2.Controls.Add(this.lblComparedVersionDatabase);
            this.tabPage2.Controls.Add(this.btnComparedVersionDatabase);
            this.tabPage2.Controls.Add(this.txtComparedVersionDatabase);
            this.tabPage2.Controls.Add(this.lblCurrentVersionDatabase);
            this.tabPage2.Controls.Add(this.btnCurrentVersionDatabase);
            this.tabPage2.Controls.Add(this.txtCurrentVersionDatabase);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(730, 155);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Compare Database";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // btnShowDatabaseDiff
            // 
            this.btnShowDatabaseDiff.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnShowDatabaseDiff.Location = new System.Drawing.Point(632, 110);
            this.btnShowDatabaseDiff.Name = "btnShowDatabaseDiff";
            this.btnShowDatabaseDiff.Size = new System.Drawing.Size(75, 23);
            this.btnShowDatabaseDiff.TabIndex = 12;
            this.btnShowDatabaseDiff.Text = "Show";
            this.btnShowDatabaseDiff.UseVisualStyleBackColor = true;
            this.btnShowDatabaseDiff.Click += new System.EventHandler(this.btnShowDatabaseDiff_Click);
            // 
            // lblComparedVersionDatabase
            // 
            this.lblComparedVersionDatabase.AutoSize = true;
            this.lblComparedVersionDatabase.Location = new System.Drawing.Point(7, 73);
            this.lblComparedVersionDatabase.Name = "lblComparedVersionDatabase";
            this.lblComparedVersionDatabase.Size = new System.Drawing.Size(93, 13);
            this.lblComparedVersionDatabase.TabIndex = 9;
            this.lblComparedVersionDatabase.Text = "Compared Version";
            // 
            // btnComparedVersionDatabase
            // 
            this.btnComparedVersionDatabase.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnComparedVersionDatabase.Location = new System.Drawing.Point(682, 68);
            this.btnComparedVersionDatabase.Name = "btnComparedVersionDatabase";
            this.btnComparedVersionDatabase.Size = new System.Drawing.Size(25, 23);
            this.btnComparedVersionDatabase.TabIndex = 10;
            this.btnComparedVersionDatabase.Text = "...";
            this.btnComparedVersionDatabase.UseVisualStyleBackColor = true;
            this.btnComparedVersionDatabase.Click += new System.EventHandler(this.btnComparedVersionDatabase_Click);
            // 
            // txtComparedVersionDatabase
            // 
            this.txtComparedVersionDatabase.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtComparedVersionDatabase.Location = new System.Drawing.Point(106, 70);
            this.txtComparedVersionDatabase.Name = "txtComparedVersionDatabase";
            this.txtComparedVersionDatabase.ReadOnly = true;
            this.txtComparedVersionDatabase.Size = new System.Drawing.Size(570, 20);
            this.txtComparedVersionDatabase.TabIndex = 11;
            // 
            // lblCurrentVersionDatabase
            // 
            this.lblCurrentVersionDatabase.AutoSize = true;
            this.lblCurrentVersionDatabase.Location = new System.Drawing.Point(21, 33);
            this.lblCurrentVersionDatabase.Name = "lblCurrentVersionDatabase";
            this.lblCurrentVersionDatabase.Size = new System.Drawing.Size(79, 13);
            this.lblCurrentVersionDatabase.TabIndex = 6;
            this.lblCurrentVersionDatabase.Text = "Current Version";
            // 
            // btnCurrentVersionDatabase
            // 
            this.btnCurrentVersionDatabase.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCurrentVersionDatabase.Location = new System.Drawing.Point(682, 29);
            this.btnCurrentVersionDatabase.Name = "btnCurrentVersionDatabase";
            this.btnCurrentVersionDatabase.Size = new System.Drawing.Size(25, 23);
            this.btnCurrentVersionDatabase.TabIndex = 7;
            this.btnCurrentVersionDatabase.Text = "...";
            this.btnCurrentVersionDatabase.UseVisualStyleBackColor = true;
            this.btnCurrentVersionDatabase.Click += new System.EventHandler(this.btnCurrentVersionDatabase_Click);
            // 
            // txtCurrentVersionDatabase
            // 
            this.txtCurrentVersionDatabase.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtCurrentVersionDatabase.Location = new System.Drawing.Point(106, 31);
            this.txtCurrentVersionDatabase.Name = "txtCurrentVersionDatabase";
            this.txtCurrentVersionDatabase.ReadOnly = true;
            this.txtCurrentVersionDatabase.Size = new System.Drawing.Size(570, 20);
            this.txtCurrentVersionDatabase.TabIndex = 8;
            // 
            // dlgOpenFile
            // 
            this.dlgOpenFile.Filter = "dll files|*.dll|exe files|*.exe|All files|*.*";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.tabControl1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(738, 188);
            this.panel1.TabIndex = 2;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(738, 188);
            this.Controls.Add(this.panel1);
            this.Name = "MainForm";
            this.Text = "Version Diff";
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.Label lblCurrentVersionAssembly;
        private System.Windows.Forms.Button btnCurrentVersionAssembly;
        private System.Windows.Forms.TextBox txtCurrentVersionAssembly;
        private System.Windows.Forms.Label lblComparedVersionAssembly;
        private System.Windows.Forms.Button btnComparedVersionAssembly;
        private System.Windows.Forms.TextBox txtComparedVersionAssembly;
        private System.Windows.Forms.OpenFileDialog dlgOpenFile;
        private System.Windows.Forms.Button btnShowAssemblyDiff;
        private System.Windows.Forms.Label lblComparedVersionDatabase;
        private System.Windows.Forms.Button btnComparedVersionDatabase;
        private System.Windows.Forms.TextBox txtComparedVersionDatabase;
        private System.Windows.Forms.Label lblCurrentVersionDatabase;
        private System.Windows.Forms.Button btnCurrentVersionDatabase;
        private System.Windows.Forms.TextBox txtCurrentVersionDatabase;
        private System.Windows.Forms.Button btnShowDatabaseDiff;
        private System.Windows.Forms.Panel panel1;
    }
}