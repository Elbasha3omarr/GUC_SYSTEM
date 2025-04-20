using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class PendingRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            string query = "SELECT * from dbo.all_Pending_Requests";
            using (con)
            {
                SqlCommand cmd = new SqlCommand(query, con);
                // cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                StringBuilder table = new StringBuilder();
                table.Append("<table border=1><tr>");
                table.Append("<th> request_id </th><th>type </th><th>comment</th><th>status </th><th>credit_hours </th><th>course_id </th><th>student_id </th><th>advisor_id </th><tr/>");
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
}