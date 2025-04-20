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
    public partial class DeleteGPCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand delete = new SqlCommand("Procedures_AdvisorDeleteFromGP", conn);
            delete.CommandType = CommandType.StoredProcedure;
            int s_id=0;
            try
            {
                s_id = Int32.Parse(student_id.Text);
            }
            catch (FormatException)
            {
                Response.Write("Incorrect Data type entered for the student ID ");
            }
            bool flag = (bool)CheckGraduationPlanExists(s_id);
            if (flag) {
                
                string semester_code = sem_id.Text;
                int c_id = 0; 
                try
                {
                    c_id = Int32.Parse(course_id.Text);
                }
                catch (FormatException)
                {
                    Response.Write("Incorrect Data type entered for the student ID ");
                }
                delete.Parameters.Add(new SqlParameter("@studentID", s_id));
                delete.Parameters.Add(new SqlParameter("@sem_code", semester_code));
                delete.Parameters.Add(new SqlParameter("@courseID", c_id));

                conn.Open();
                delete.ExecuteNonQuery();
                Response.Write("Successfully deleted");
                conn.Close();

            }
            else
            {
                Response.Write("There is no Graduation Plan made for this student");
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