namespace VersionDiff
{
    partial class VersionCompareForm
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
            this.tvCurrentVersion = new System.Windows.Forms.TreeView();
            this.lblCurrentVersion = new System.Windows.Forms.Label();
            this.lblCurrentVersionExistOnly = new System.Windows.Forms.Label();
            this.tvCurrentVersionExistOnly = new System.Windows.Forms.TreeView();
            this.lblComparedVersion = new System.Windows.Forms.Label();
            this.lblComparedVersionExistOnly = new System.Windows.Forms.Label();
            this.tvComparedVersionExistOnly = new System.Windows.Forms.TreeView();
            this.tvComparedVersion = new System.Windows.Forms.TreeView();
            this.btnHide = new System.Windows.Forms.Button();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tvCurrentVersion
            // 
            this.tvCurrentVersion.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tvCurrentVersion.Location = new System.Drawing.Point(3, 23);
            this.tvCurrentVersion.Name = "tvCurrentVersion";
            this.tvCurrentVersion.Size = new System.Drawing.Size(375, 200);
            this.tvCurrentVersion.TabIndex = 1;
            // 
            // lblCurrentVersion
            // 
            this.lblCurrentVersion.AutoSize = true;
            this.lblCurrentVersion.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblCurrentVersion.Location = new System.Drawing.Point(3, 7);
            this.lblCurrentVersion.Name = "lblCurrentVersion";
            this.lblCurrentVersion.Size = new System.Drawing.Size(375, 13);
            this.lblCurrentVersion.TabIndex = 0;
            this.lblCurrentVersion.Text = "Current Version";
            // 
            // lblCurrentVersionExistOnly
            // 
            this.lblCurrentVersionExistOnly.AutoSize = true;
            this.lblCurrentVersionExistOnly.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblCurrentVersionExistOnly.Location = new System.Drawing.Point(3, 233);
            this.lblCurrentVersionExistOnly.Name = "lblCurrentVersionExistOnly";
            this.lblCurrentVersionExistOnly.Size = new System.Drawing.Size(375, 13);
            this.lblCurrentVersionExistOnly.TabIndex = 4;
            this.lblCurrentVersionExistOnly.Text = "Exist only in current version but not exist in compared version.";
            // 
            // tvCurrentVersionExistOnly
            // 
            this.tvCurrentVersionExistOnly.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tvCurrentVersionExistOnly.FullRowSelect = true;
            this.tvCurrentVersionExistOnly.HideSelection = false;
            this.tvCurrentVersionExistOnly.HotTracking = true;
            this.tvCurrentVersionExistOnly.Location = new System.Drawing.Point(3, 249);
            this.tvCurrentVersionExistOnly.Name = "tvCurrentVersionExistOnly";
            this.tvCurrentVersionExistOnly.Size = new System.Drawing.Size(375, 200);
            this.tvCurrentVersionExistOnly.TabIndex = 5;
            // 
            // lblComparedVersion
            // 
            this.lblComparedVersion.AutoSize = true;
            this.lblComparedVersion.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblComparedVersion.Location = new System.Drawing.Point(384, 7);
            this.lblComparedVersion.Name = "lblComparedVersion";
            this.lblComparedVersion.Size = new System.Drawing.Size(376, 13);
            this.lblComparedVersion.TabIndex = 2;
            this.lblComparedVersion.Text = "Compared Version";
            // 
            // lblComparedVersionExistOnly
            // 
            this.lblComparedVersionExistOnly.AutoSize = true;
            this.lblComparedVersionExistOnly.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lblComparedVersionExistOnly.Location = new System.Drawing.Point(384, 233);
            this.lblComparedVersionExistOnly.Name = "lblComparedVersionExistOnly";
            this.lblComparedVersionExistOnly.Size = new System.Drawing.Size(376, 13);
            this.lblComparedVersionExistOnly.TabIndex = 6;
            this.lblComparedVersionExistOnly.Text = "Exist only in compared version but not exist in current version.";
            // 
            // tvComparedVersionExistOnly
            // 
            this.tvComparedVersionExistOnly.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tvComparedVersionExistOnly.Location = new System.Drawing.Point(384, 249);
            this.tvComparedVersionExistOnly.Name = "tvComparedVersionExistOnly";
            this.tvComparedVersionExistOnly.Size = new System.Drawing.Size(376, 200);
            this.tvComparedVersionExistOnly.TabIndex = 7;
            // 
            // tvComparedVersion
            // 
            this.tvComparedVersion.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tvComparedVersion.Location = new System.Drawing.Point(384, 23);
            this.tvComparedVersion.Name = "tvComparedVersion";
            this.tvComparedVersion.Size = new System.Drawing.Size(376, 200);
            this.tvComparedVersion.TabIndex = 3;
            // 
            // btnHide
            // 
            this.btnHide.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnHide.Location = new System.Drawing.Point(692, 481);
            this.btnHide.Name = "btnHide";
            this.btnHide.Size = new System.Drawing.Size(75, 23);
            this.btnHide.TabIndex = 1;
            this.btnHide.Text = "Hide";
            this.btnHide.UseVisualStyleBackColor = true;
            this.btnHide.Click += new System.EventHandler(this.btnHide_Click);
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.tvComparedVersionExistOnly, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.tvCurrentVersionExistOnly, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.lblComparedVersionExistOnly, 1, 2);
            this.tableLayoutPanel1.Controls.Add(this.lblCurrentVersionExistOnly, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.lblComparedVersion, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.lblCurrentVersion, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.tvComparedVersion, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.tvCurrentVersion, 0, 1);
            this.tableLayoutPanel1.Location = new System.Drawing.Point(12, 12);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 4;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(763, 452);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // VersionCompareForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(780, 525);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Controls.Add(this.btnHide);
            this.Name = "VersionCompareForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.Text = "Version Diff";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.VersionCompareForm_FormClosing);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TreeView tvCurrentVersion;
        private System.Windows.Forms.TreeView tvComparedVersion;
        private System.Windows.Forms.TreeView tvCurrentVersionExistOnly;
        private System.Windows.Forms.TreeView tvComparedVersionExistOnly;
        private System.Windows.Forms.Label lblCurrentVersionExistOnly;
        private System.Windows.Forms.Label lblComparedVersionExistOnly;
        private System.Windows.Forms.Button btnHide;
        private System.Windows.Forms.Label lblCurrentVersion;
        private System.Windows.Forms.Label lblComparedVersion;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
    }
}

