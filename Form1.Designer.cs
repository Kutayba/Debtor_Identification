namespace Debtor_Identification
{
    partial class Form1
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
            this.LCS_rb = new System.Windows.Forms.RadioButton();
            this.QG1_rb = new System.Windows.Forms.RadioButton();
            this.QG2_rb = new System.Windows.Forms.RadioButton();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.Match_A_btn = new System.Windows.Forms.Button();
            this.DL_rb = new System.Windows.Forms.RadioButton();
            this.QG3_rb = new System.Windows.Forms.RadioButton();
            this.Cosine_rb = new System.Windows.Forms.RadioButton();
            this.Soundex_rb = new System.Windows.Forms.RadioButton();
            this.JW_rb = new System.Windows.Forms.RadioButton();
            this.Jaro_rb = new System.Windows.Forms.RadioButton();
            this.Jaccard_rb = new System.Windows.Forms.RadioButton();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.Results_lv = new System.Windows.Forms.ListView();
            this.Names = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Matches = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Confidence = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Input_tb = new System.Windows.Forms.RichTextBox();
            this.Match_btn = new System.Windows.Forms.Button();
            this.Top_10_lv = new System.Windows.Forms.ListView();
            this.Suggestion = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Conf_prc = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Mtch_t10_btn = new System.Windows.Forms.Button();
            this.Mtch_a_t10_btn = new System.Windows.Forms.Button();
            this.Save_btn = new System.Windows.Forms.Button();
            this.Load_btn = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // LCS_rb
            // 
            this.LCS_rb.AutoSize = true;
            this.LCS_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.LCS_rb.Location = new System.Drawing.Point(8, 65);
            this.LCS_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.LCS_rb.Name = "LCS_rb";
            this.LCS_rb.Size = new System.Drawing.Size(221, 27);
            this.LCS_rb.TabIndex = 4;
            this.LCS_rb.Text = "Longest Common Substring";
            this.LCS_rb.UseVisualStyleBackColor = true;
            // 
            // QG1_rb
            // 
            this.QG1_rb.AutoSize = true;
            this.QG1_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.QG1_rb.Location = new System.Drawing.Point(8, 100);
            this.QG1_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.QG1_rb.Name = "QG1_rb";
            this.QG1_rb.Size = new System.Drawing.Size(133, 27);
            this.QG1_rb.TabIndex = 5;
            this.QG1_rb.Text = "Q-Gram (Q=1)";
            this.QG1_rb.UseVisualStyleBackColor = true;
            // 
            // QG2_rb
            // 
            this.QG2_rb.AutoSize = true;
            this.QG2_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.QG2_rb.Location = new System.Drawing.Point(8, 133);
            this.QG2_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.QG2_rb.Name = "QG2_rb";
            this.QG2_rb.Size = new System.Drawing.Size(136, 27);
            this.QG2_rb.TabIndex = 6;
            this.QG2_rb.Text = "Q-Gram (Q=2)";
            this.QG2_rb.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(360, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(128, 23);
            this.label1.TabIndex = 12;
            this.label1.Text = "Erroneous Name";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(8, 148);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(232, 23);
            this.label2.TabIndex = 13;
            this.label2.Text = "Top 5 Matches for Each Name";
            // 
            // Match_A_btn
            // 
            this.Match_A_btn.Font = new System.Drawing.Font("Comic Sans MS", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Match_A_btn.Location = new System.Drawing.Point(12, 62);
            this.Match_A_btn.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Match_A_btn.Name = "Match_A_btn";
            this.Match_A_btn.Size = new System.Drawing.Size(156, 38);
            this.Match_A_btn.TabIndex = 10;
            this.Match_A_btn.Text = "Single Algorithm Match ";
            this.Match_A_btn.UseVisualStyleBackColor = true;
            this.Match_A_btn.Click += new System.EventHandler(this.Match_A_btn_Click);
            // 
            // DL_rb
            // 
            this.DL_rb.AutoSize = true;
            this.DL_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DL_rb.Location = new System.Drawing.Point(8, 32);
            this.DL_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.DL_rb.Name = "DL_rb";
            this.DL_rb.Size = new System.Drawing.Size(182, 27);
            this.DL_rb.TabIndex = 14;
            this.DL_rb.Text = "Damerau-Levenshtein";
            this.DL_rb.UseVisualStyleBackColor = true;
            // 
            // QG3_rb
            // 
            this.QG3_rb.AutoSize = true;
            this.QG3_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.QG3_rb.Location = new System.Drawing.Point(8, 166);
            this.QG3_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.QG3_rb.Name = "QG3_rb";
            this.QG3_rb.Size = new System.Drawing.Size(136, 27);
            this.QG3_rb.TabIndex = 15;
            this.QG3_rb.Text = "Q-Gram (Q=3)";
            this.QG3_rb.UseVisualStyleBackColor = true;
            // 
            // Cosine_rb
            // 
            this.Cosine_rb.AutoSize = true;
            this.Cosine_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Cosine_rb.Location = new System.Drawing.Point(8, 201);
            this.Cosine_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Cosine_rb.Name = "Cosine_rb";
            this.Cosine_rb.Size = new System.Drawing.Size(74, 27);
            this.Cosine_rb.TabIndex = 16;
            this.Cosine_rb.Text = "Cosine";
            this.Cosine_rb.UseVisualStyleBackColor = true;
            // 
            // Soundex_rb
            // 
            this.Soundex_rb.AutoSize = true;
            this.Soundex_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Soundex_rb.Location = new System.Drawing.Point(8, 335);
            this.Soundex_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Soundex_rb.Name = "Soundex_rb";
            this.Soundex_rb.Size = new System.Drawing.Size(89, 27);
            this.Soundex_rb.TabIndex = 17;
            this.Soundex_rb.Text = "Soundex";
            this.Soundex_rb.UseVisualStyleBackColor = true;
            // 
            // JW_rb
            // 
            this.JW_rb.AutoSize = true;
            this.JW_rb.Checked = true;
            this.JW_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.JW_rb.Location = new System.Drawing.Point(8, 300);
            this.JW_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.JW_rb.Name = "JW_rb";
            this.JW_rb.Size = new System.Drawing.Size(130, 27);
            this.JW_rb.TabIndex = 18;
            this.JW_rb.TabStop = true;
            this.JW_rb.Text = "Jaro-Winkler";
            this.JW_rb.UseVisualStyleBackColor = true;
            // 
            // Jaro_rb
            // 
            this.Jaro_rb.AutoSize = true;
            this.Jaro_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Jaro_rb.Location = new System.Drawing.Point(8, 267);
            this.Jaro_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Jaro_rb.Name = "Jaro_rb";
            this.Jaro_rb.Size = new System.Drawing.Size(63, 27);
            this.Jaro_rb.TabIndex = 19;
            this.Jaro_rb.Text = "Jaro";
            this.Jaro_rb.UseVisualStyleBackColor = true;
            // 
            // Jaccard_rb
            // 
            this.Jaccard_rb.AutoSize = true;
            this.Jaccard_rb.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Jaccard_rb.Location = new System.Drawing.Point(8, 234);
            this.Jaccard_rb.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Jaccard_rb.Name = "Jaccard_rb";
            this.Jaccard_rb.Size = new System.Drawing.Size(88, 27);
            this.Jaccard_rb.TabIndex = 20;
            this.Jaccard_rb.Text = "Jaccard";
            this.Jaccard_rb.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.LCS_rb);
            this.groupBox1.Controls.Add(this.Jaccard_rb);
            this.groupBox1.Controls.Add(this.QG1_rb);
            this.groupBox1.Controls.Add(this.Jaro_rb);
            this.groupBox1.Controls.Add(this.QG2_rb);
            this.groupBox1.Controls.Add(this.JW_rb);
            this.groupBox1.Controls.Add(this.DL_rb);
            this.groupBox1.Controls.Add(this.Soundex_rb);
            this.groupBox1.Controls.Add(this.QG3_rb);
            this.groupBox1.Controls.Add(this.Cosine_rb);
            this.groupBox1.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(363, 96);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.groupBox1.Size = new System.Drawing.Size(234, 386);
            this.groupBox1.TabIndex = 21;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Algorithm";
            // 
            // Results_lv
            // 
            this.Results_lv.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.Results_lv.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.Names,
            this.Matches,
            this.Confidence});
            this.Results_lv.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Results_lv.GridLines = true;
            this.Results_lv.Location = new System.Drawing.Point(12, 175);
            this.Results_lv.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Results_lv.Name = "Results_lv";
            this.Results_lv.Size = new System.Drawing.Size(318, 305);
            this.Results_lv.TabIndex = 23;
            this.Results_lv.UseCompatibleStateImageBehavior = false;
            this.Results_lv.View = System.Windows.Forms.View.Details;
            // 
            // Names
            // 
            this.Names.Text = "Names";
            this.Names.Width = 103;
            // 
            // Matches
            // 
            this.Matches.Text = "Matches";
            this.Matches.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.Matches.Width = 106;
            // 
            // Confidence
            // 
            this.Confidence.Text = "Confidence";
            this.Confidence.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.Confidence.Width = 104;
            // 
            // Input_tb
            // 
            this.Input_tb.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Input_tb.Location = new System.Drawing.Point(363, 31);
            this.Input_tb.Name = "Input_tb";
            this.Input_tb.Size = new System.Drawing.Size(234, 57);
            this.Input_tb.TabIndex = 24;
            this.Input_tb.Text = "";
            // 
            // Match_btn
            // 
            this.Match_btn.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Match_btn.Location = new System.Drawing.Point(12, 14);
            this.Match_btn.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Match_btn.Name = "Match_btn";
            this.Match_btn.Size = new System.Drawing.Size(156, 38);
            this.Match_btn.TabIndex = 25;
            this.Match_btn.Text = "Match";
            this.Match_btn.UseVisualStyleBackColor = true;
            this.Match_btn.Click += new System.EventHandler(this.Match_btn_Click);
            // 
            // Top_10_lv
            // 
            this.Top_10_lv.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.Suggestion,
            this.Conf_prc});
            this.Top_10_lv.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Top_10_lv.GridLines = true;
            this.Top_10_lv.Location = new System.Drawing.Point(12, 174);
            this.Top_10_lv.Name = "Top_10_lv";
            this.Top_10_lv.Size = new System.Drawing.Size(318, 306);
            this.Top_10_lv.TabIndex = 26;
            this.Top_10_lv.UseCompatibleStateImageBehavior = false;
            this.Top_10_lv.View = System.Windows.Forms.View.Details;
            this.Top_10_lv.Visible = false;
            // 
            // Suggestion
            // 
            this.Suggestion.Text = "Suggestion";
            this.Suggestion.Width = 185;
            // 
            // Conf_prc
            // 
            this.Conf_prc.Text = "Confidence";
            this.Conf_prc.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.Conf_prc.Width = 129;
            // 
            // Mtch_t10_btn
            // 
            this.Mtch_t10_btn.Font = new System.Drawing.Font("Comic Sans MS", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mtch_t10_btn.Location = new System.Drawing.Point(174, 14);
            this.Mtch_t10_btn.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Mtch_t10_btn.Name = "Mtch_t10_btn";
            this.Mtch_t10_btn.Size = new System.Drawing.Size(156, 38);
            this.Mtch_t10_btn.TabIndex = 27;
            this.Mtch_t10_btn.Text = "Top 25 Suggestions";
            this.Mtch_t10_btn.UseVisualStyleBackColor = true;
            this.Mtch_t10_btn.Click += new System.EventHandler(this.Mtch_t10_btn_Click);
            // 
            // Mtch_a_t10_btn
            // 
            this.Mtch_a_t10_btn.Font = new System.Drawing.Font("Comic Sans MS", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mtch_a_t10_btn.Location = new System.Drawing.Point(174, 62);
            this.Mtch_a_t10_btn.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Mtch_a_t10_btn.Name = "Mtch_a_t10_btn";
            this.Mtch_a_t10_btn.Size = new System.Drawing.Size(156, 38);
            this.Mtch_a_t10_btn.TabIndex = 28;
            this.Mtch_a_t10_btn.Text = "S-A Top 25 Suggestions";
            this.Mtch_a_t10_btn.UseVisualStyleBackColor = true;
            this.Mtch_a_t10_btn.Click += new System.EventHandler(this.Mtch_a_t10_btn_Click);
            // 
            // Save_btn
            // 
            this.Save_btn.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Save_btn.Location = new System.Drawing.Point(12, 110);
            this.Save_btn.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Save_btn.Name = "Save_btn";
            this.Save_btn.Size = new System.Drawing.Size(156, 38);
            this.Save_btn.TabIndex = 29;
            this.Save_btn.Text = "Save Results";
            this.Save_btn.UseVisualStyleBackColor = true;
            this.Save_btn.Click += new System.EventHandler(this.Save_btn_Click);
            // 
            // Load_btn
            // 
            this.Load_btn.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Load_btn.Location = new System.Drawing.Point(174, 110);
            this.Load_btn.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.Load_btn.Name = "Load_btn";
            this.Load_btn.Size = new System.Drawing.Size(156, 38);
            this.Load_btn.TabIndex = 30;
            this.Load_btn.Text = "Load and process table";
            this.Load_btn.UseVisualStyleBackColor = true;
            this.Load_btn.Click += new System.EventHandler(this.Load_btn_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(96F, 96F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.ClientSize = new System.Drawing.Size(609, 494);
            this.Controls.Add(this.Load_btn);
            this.Controls.Add(this.Save_btn);
            this.Controls.Add(this.Mtch_a_t10_btn);
            this.Controls.Add(this.Top_10_lv);
            this.Controls.Add(this.Mtch_t10_btn);
            this.Controls.Add(this.Match_btn);
            this.Controls.Add(this.Input_tb);
            this.Controls.Add(this.Results_lv);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Match_A_btn);
            this.Cursor = System.Windows.Forms.Cursors.Default;
            this.Font = new System.Drawing.Font("Comic Sans MS", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(3, 5, 3, 5);
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Debtor Identification";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.RadioButton LCS_rb;
        private System.Windows.Forms.RadioButton QG1_rb;
        private System.Windows.Forms.RadioButton QG2_rb;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button Match_A_btn;
        private System.Windows.Forms.RadioButton DL_rb;
        private System.Windows.Forms.RadioButton QG3_rb;
        private System.Windows.Forms.RadioButton Cosine_rb;
        private System.Windows.Forms.RadioButton Soundex_rb;
        private System.Windows.Forms.RadioButton JW_rb;
        private System.Windows.Forms.RadioButton Jaro_rb;
        private System.Windows.Forms.RadioButton Jaccard_rb;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ListView Results_lv;
        private System.Windows.Forms.ColumnHeader Names;
        private System.Windows.Forms.ColumnHeader Matches;
        private System.Windows.Forms.ColumnHeader Confidence;
        private System.Windows.Forms.RichTextBox Input_tb;
        private System.Windows.Forms.Button Match_btn;
        private System.Windows.Forms.ListView Top_10_lv;
        private System.Windows.Forms.ColumnHeader Suggestion;
        private System.Windows.Forms.ColumnHeader Conf_prc;
        private System.Windows.Forms.Button Mtch_t10_btn;
        private System.Windows.Forms.Button Mtch_a_t10_btn;
        private System.Windows.Forms.Button Save_btn;
        private System.Windows.Forms.Button Load_btn;
    }
}

