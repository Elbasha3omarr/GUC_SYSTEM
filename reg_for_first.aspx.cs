using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class reg_for_first : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string conStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            using (con)
            {
                SqlCommand cmd = new SqlCommand("Procedures_StudentRegisterFirstMakeup", con);
                cmd.CommandType = CommandType.StoredProcedure;
                int coursse = Int32.Parse(courseid.Text);


                cmd.Parameters.Add(new SqlParameter("@StudentID", Session["user"]));
                cmd.Parameters.Add(new SqlParameter("@courseID", coursse));
                cmd.Parameters.Add(new SqlParameter("@studentCurr_sem", semester.Text));

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("Done");


            }
        }
    }
}