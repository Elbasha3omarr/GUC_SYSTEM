using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_SYSTEM
{
    public partial class Addgradcourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            int s_id =0;
            try
            {
                s_id = Int32.Parse(student_id.Text);
            }
            catch (FormatException)
            {
                Response.Write("Incorrect Data type entered for the student ID ");
            }
            bool flag = CheckGraduationPlanExists(s_id);
                if (flag)
                {
                string semesterCode = semcode.Text;
                string courseName = course_name.Text;
                SqlCommand command = new SqlCommand("Procedures_AdvisorAddCourseGP", conn);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@student_id", s_id);
                command.Parameters.AddWithValue("@Semester_code", semesterCode);
                command.Parameters.AddWithValue("@course_name", courseName);

                command.ExecuteNonQuery();
                Response.Write("Course Added successfully");
                }
                else
                {
                Response.Write("the student doesn't have a graduation plan");
                }
        }        
        private bool CheckGraduationPlanExists(int studentId)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand checkPlan = new SqlCommand("SELECT COUNT(*) FROM Graduation_Plan WHERE student_id = @student_id", conn);
            checkPlan.Parameters.Add(new SqlParameter("@student_id", studentId));

            conn.Open();
            int count = (int)checkPlan.ExecuteScalar();
            conn.Close();

            return count > 0;
        }
    }
}
   