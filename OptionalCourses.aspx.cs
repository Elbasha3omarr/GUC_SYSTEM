using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace GUC_SYSTEM
{
    public partial class OptionalCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewoption = new SqlCommand("Procedures_ViewOptionalCourse", conn);
            viewoption.CommandType = CommandType.StoredProcedure;
            //int student_id=Int32.Parse(studentid.Text);
            viewoption.Parameters.Add(new SqlParameter("@StudentID", Session["user"]));
            viewoption.Parameters.Add(new SqlParameter("@current_semester_code", sem_code.Text));
     
            conn.Open();
            SqlDataReader reader = viewoption.ExecuteReader();
            StringBuilder table = new StringBuilder();
            table.Append("<table border=1><tr>");
            table.Append("<th>Course Id </th><th>Course Name </th><tr/>");
            while (reader.Read())
            {
                table.Append("<tr>");
                table.Append("<td>" + reader[0] + "</td>");
                table.Append("<td>" + reader[1] + "</td>");
                table.Append("<tr/>");
            }
            table.Append("</table>");
            conn.Close();
            PlaceHolder1.Controls.Add(new LiteralControl { Text = table.ToString() });
        }
    }
}