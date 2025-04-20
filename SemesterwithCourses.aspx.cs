using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication6
{
    public partial class SemsterwithCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string query = "SELECT * From dbo.Semster_offered_Courses";
            SqlCommand command = new SqlCommand(query, con);

            con.Open();
            // bool success = (bool)command.ExecuteScalar();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder table = new StringBuilder();
            table.Append("<table border=1><tr>");
            table.Append("<th>course_ID </th><th>course </th><th>Semester</th> <tr/>");
            while (reader.Read())
            {
                table.Append("<tr>");
                table.Append("<td>" + reader[0] + "</td>");
                table.Append("<td>" + reader[1] + "</td>");
                table.Append("<td>" + reader[2] + "</td>");

                table.Append("<tr/>");
            }
            table.Append("</table>");
            con.Close();
            PlaceHolder1.Controls.Add(new LiteralControl { Text = table.ToString() });
        }
    }
}