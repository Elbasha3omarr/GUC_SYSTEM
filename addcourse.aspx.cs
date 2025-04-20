using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
	public partial class addcourse : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			string conStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
			SqlConnection con = new SqlConnection(conStr);
			SqlCommand cmd = new SqlCommand("Procedures_AdminAddingCourse", con);
			cmd.CommandType = CommandType.StoredProcedure;
			string Major = major.Text;
			int semester = Int32.Parse(semesterr.Text);
			int c_hour= Int32.Parse(credit_hours.Text);

            cmd.Parameters.AddWithValue("@major", Major);
			cmd.Parameters.AddWithValue("@semester", semester);
			cmd.Parameters.AddWithValue("@credit_hours", c_hour);
			cmd.Parameters.AddWithValue("@name ", name.Text);
			cmd.Parameters.AddWithValue("@is_offered", is_offered.Text);

				con.Open();
				cmd.ExecuteNonQuery();
				Response.Write("Course addedd successfully");
				con.Close();
		}
	}
}