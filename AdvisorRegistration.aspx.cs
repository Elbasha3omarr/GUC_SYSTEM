﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_SYSTEM
{
    public partial class AdvisorRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        int id;
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand register = new SqlCommand("Procedures_AdvisorRegistration", conn);
            register.CommandType = CommandType.StoredProcedure;
            string advisor_name=Advisorname.Text;
            string password = Password.Text;
            string email=Email.Text;
            string office= Office.Text;
            register.Parameters.Add(new SqlParameter("@advisor_name", advisor_name));
            register.Parameters.Add(new SqlParameter("@password", password));
            register.Parameters.Add(new SqlParameter("@email", email));
            register.Parameters.Add(new SqlParameter("@office", office));
            register.Parameters.Add(new SqlParameter("@Advisor_id", SqlDbType.Int) { Direction = ParameterDirection.Output });
            
            conn.Open();
            register.ExecuteNonQuery();

            id = Convert.ToInt32(register.Parameters["@Advisor_id"].Value);
            Response.Write(id);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}