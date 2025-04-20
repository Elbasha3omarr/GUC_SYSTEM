using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class course_slot_instructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string query = "SELECT * From dbo.Courses_Slots_Instructor";
            SqlCommand command = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder table = new StringBuilder();
            table.Append("<table border=1><tr>");
            table.Append("<th>CourseID</th><th>Course_name </th><th> Slot ID </th><th>Slot_day</th><th>Slot_Time</th><th>Slot Location </th><th>Slot’s Instructor name </th><tr/>");
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


                table.Append("<tr/>");
            }
            table.Append("</table>");
            con.Close();
            PlaceHolder1.Controls.Add(new LiteralControl { Text = table.ToString() });
        }
    }
}