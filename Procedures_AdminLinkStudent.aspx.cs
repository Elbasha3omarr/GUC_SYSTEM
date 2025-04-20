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

namespace WebApplication6
{
    public partial class Procedures_AdminLinkStudent : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Procedures_AdminLinkStudent", con);
                cmd.CommandType = CommandType.StoredProcedure;

                int c_id = Int32.Parse(courseid.Text);
                int in_id = Int32.Parse(instructorid.Text);
                int s_id = Int32.Parse(studentid.Text);
                
                cmd.Parameters.Add(new SqlParameter("@cours_id", c_id));
                cmd.Parameters.Add(new SqlParameter("@instructor_id ", in_id));
                cmd.Parameters.Add(new SqlParameter("@studentID", s_id));
                cmd.Parameters.Add(new SqlParameter("@semester_code ", semstercode.Text));
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}