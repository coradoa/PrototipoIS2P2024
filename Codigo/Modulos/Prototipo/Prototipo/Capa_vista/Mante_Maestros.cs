﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Vista_PrototipoMenu
{
    public partial class Mante_Maestros : Form
    {
        public Mante_Maestros()
        {
            InitializeComponent();
           this.navegador1.config("maestros", this, "8001");
           // Help.ShowHelp(this,"","Ayuda/AyudaExamen");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Help.ShowHelp(this,"Ayuda/AyudaExamen.chm","Ayuda.html");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Reporte reporte = new Reporte();
            reporte.Show();
        }
    }
}
