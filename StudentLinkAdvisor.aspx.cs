using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1;

namespace GUC_SYSTEM
{
    public partial class StudentLinkAdvisor : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Procedures_AdminLinkStudentToAdvisor", con);
                cmd.CommandType = CommandType.StoredProcedure;

                int s_id = Int32.Parse(studentID.Text);
                int Ad_id = Int32.Parse(advisorID.Text);
                cmd.Parameters.Add(new SqlParameter("@studentID", s_id));
                cmd.Parameters.Add(new SqlParameter("@advisorID ", Ad_id));
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}