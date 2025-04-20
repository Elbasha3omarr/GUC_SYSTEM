using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace WebApplication5
{
    public partial class Choose_instructor_Forcourse : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Procedures_Chooseinstructor", con);
                cmd.CommandType = CommandType.StoredProcedure;
                int semID = Int32.Parse(InstructorID.Text);
                int cID = Int32.Parse(CourseID.Text);

                cmd.Parameters.Add(new SqlParameter("@StudentID", 1));
                cmd.Parameters.Add(new SqlParameter("@instrucorID", semID));
                cmd.Parameters.Add(new SqlParameter("@CourseID", cID));
                cmd.Parameters.Add(new SqlParameter("@current_semester_code", Semester_code.Text));

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("done");
            }
        }
    }
}