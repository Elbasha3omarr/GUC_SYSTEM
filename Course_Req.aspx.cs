using System;
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
    public partial class Course_Req : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            int c_id = Int32.Parse(course_id.Text);
            //int s_id = Int32.Parse(studentid.Text);
            string comment = Comment.Text;

            SqlCommand request = new SqlCommand("Procedures_StudentSendingCourseRequest", conn);
            request.CommandType = CommandType.StoredProcedure;
            request.Parameters.Add(new SqlParameter("@courseID", c_id));
            request.Parameters.Add(new SqlParameter("@StudentID", Session["user"]));
            request.Parameters.Add(new SqlParameter("@type", "Course Request"));
            request.Parameters.Add(new SqlParameter("@comment", comment));

            conn.Open();
            request.ExecuteNonQuery();
            Response.Write("Course Request sent successfully"  );
            conn.Close();
        }
    }
}