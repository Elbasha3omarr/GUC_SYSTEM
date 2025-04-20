using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class gradplan_asscourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string query = "SELECT * From dbo.FN_StudentViewGP(@student_ID)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.Add("@student_ID", Session["user"]);
            con.Open();
            // bool success = (bool)command.ExecuteScalar();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder table = new StringBuilder();
            table.Append("<table border=1><tr>");
            table.Append("<th>student_Name </th><th>plan_ID </th><th>Semester_code </th><th>Semester_credit_hours </th><th>expected_grad_date </th><th>Advisor_ID </th><th>Student_ID </th><th>course_ID </th><th>name </th> <tr/>");
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
                table.Append("<td>" + reader[8] + "</td>");
                table.Append("<tr/>");
            }
            table.Append("</table>");
            con.Close();
            PlaceHolder1.Controls.Add(new LiteralControl { Text = table.ToString() });
            //Response.Write(success);

        }
    }
}