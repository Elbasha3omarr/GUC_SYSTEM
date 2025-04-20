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

namespace WebApplication1
{
    public partial class inst_course_slot : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Link_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            using (con)
            {
                SqlCommand cmd = new SqlCommand("Procedures_AdminLinkInstructor", con);
                cmd.CommandType = CommandType.StoredProcedure;
                int coursse = Int32.Parse(course.Text);
                int in_id = Int32.Parse(course.Text);
                int s_id = Int32.Parse(slot.Text);

                cmd.Parameters.Add(new SqlParameter("@cours_id", coursse));
                cmd.Parameters.Add(new SqlParameter("@instructor_id", in_id));
                cmd.Parameters.Add(new SqlParameter("@slot_id", s_id));
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}