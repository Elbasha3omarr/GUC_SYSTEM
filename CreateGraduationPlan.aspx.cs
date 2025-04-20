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
    public partial class CreateGraduationPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand AddGrad = new SqlCommand("Procedures_AdvisorCreateGP", conn);
            AddGrad.CommandType = CommandType.StoredProcedure;
            string semid =semester_code.Text;
            DateTime date = DateTime.Parse(expected_date.Text);
            int hour;
            int s_id;
            //int a_id;
            try
            {
                 hour = Int32.Parse(credit_hour.Text);
                 //a_id = Int32.Parse(advisor_id.Text);
                 s_id = Int32.Parse(student_id.Text);
            }
            catch(FormatException) {
                Response.Write("Advisor ID, Student ID and credit hours must be integers.");
                return;
            }
            AddGrad.Parameters.Add(new SqlParameter("@Semester_code", semid));
            AddGrad.Parameters.Add(new SqlParameter("@expected_graduation_date", date));
            AddGrad.Parameters.Add(new SqlParameter("@sem_credit_hours", hour));

            AddGrad.Parameters.Add(new SqlParameter("@advisor_id", Session["advisorid"]));
            AddGrad.Parameters.Add(new SqlParameter("@student_id", s_id));
            conn.Open();
            AddGrad.ExecuteNonQuery();
            Response.Write("Proccess completed successfully");
            conn.Close();

        }
    }
}