using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class courses_prereq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string query = "SELECT * From dbo.view_Course_prerequisites";
            SqlCommand command = new SqlCommand(query, con);

            con.Open();
            // bool success = (bool)command.ExecuteScalar();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder table = new StringBuilder();
            table.Append("<table border=1><tr>");
            table.Append("<th>course_ID </th><th>Name </th><th>Major </th><th>is_offered </th><th>Credit_hours </th><th>Semester </th><th>Prereq_courseID </th><th>Prereq_courseName </th><tr/>");
            while (reader.Read())
            {
                table.Append("<tr>");
                table.Append("<td>" + reader[0] + "</td>");
                table.Append("<td>" + reader[1] + "</td>");
                table.Append("<td>" + reader[2] + "</td>");
                table.Append("<td>" + reader[3] + "</td>");
                table.Append("<td>" + reader[4] + "</td>");
                table.Append("<td>" + reader[5] + "</td>");
                table.Append("<td>" + reader[6] + "</td>");
                table.Append("<td>" + reader[7] + "</td>");

                table.Append("<tr/>");
            }
            table.Append("</table>");
            con.Close();
            PlaceHolder1.Controls.Add(new LiteralControl { Text = table.ToString() });
        }
    }
}