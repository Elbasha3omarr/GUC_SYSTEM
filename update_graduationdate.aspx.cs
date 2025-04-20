using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_SYSTEM
{
    public partial class update_graduationdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            DateTime grad_time =DateTime.Parse(expected_grad.Text);
            int s_id = 0;
            try
            {
                s_id = Int32.Parse(student_id.Text);
            }
            catch (FormatException)
            {
                Response.Write("Incorrect Data Type of Student Id,");
            }
            bool flag = (bool)CheckGraduationPlanExists(s_id);
            if (flag)
            {
                SqlCommand updateGP = new SqlCommand("Procedures_AdvisorUpdateGP", conn);
                updateGP.CommandType = System.Data.CommandType.StoredProcedure;

                updateGP.Parameters.AddWithValue("@studentID", s_id);
                updateGP.Parameters.AddWithValue("@expected_grad_date", grad_time);

                conn.Open();
                updateGP.ExecuteNonQuery();
                Response.Write("Updated successfully");
                conn.Close();
            }
            else
            {
                Response.Write("No graduation Plan was created for this student");
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