using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_SYSTEM
{
    public partial class view_advising1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewstudent = new SqlCommand("SELECT * FROM Student WHERE advisor_id=" + Session["advisorid"], conn);

            conn.Open();
            SqlDataReader reader = viewstudent.ExecuteReader();
            StringBuilder table = new StringBuilder();
            table.Append("<table border=1><tr>");
            table.Append("<th>student_id</th><th>first name</th><th>last Name</th> <th>password</th>" +
               " <th>gpa</th><th>faculty</th><th>Email</th><th>Major</th> <th>financial status</th>" +
               "<th>semester</th><th>Acquired Hours</th><th>Assigned Hours</th><th>Advisor Id</th><tr/>");
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
                table.Append("<td>" + reader[9] + "</td>");
                table.Append("<td>" + reader[10] + "</td>");
                table.Append("<td>" + reader[11] + "</td>");
                table.Append("<td>" + reader[12] + "</td>");
                table.Append("<tr/>");
            }
            table.Append("</table>");
            conn.Close();
            PlaceHolder1.Controls.Add(new LiteralControl { Text = table.ToString() });
        }

    }
    }
    
