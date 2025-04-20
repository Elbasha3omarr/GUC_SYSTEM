using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_SYSTEM
{
    public partial class advisingstudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;

            SqlConnection conn = new SqlConnection(connStr);
            //int id=1;

            //int id = (int)Session["advisorid"];
            //int id = 0;
            //try { 
            //    id = Int32.Parse(advisor_id.Text);
            //}
            //catch(FormatException)
            //{
            //    Response.Write("AdvisorLogin Id should be written in integer,");
            //}
            string major = Major.Text;
            SqlCommand command = new SqlCommand("Procedures_AdvisorViewAssignedStudents", conn);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@AdvisorID", Session["advisorid"]);
            command.Parameters.Add("@major", major);

            conn.Open();
            SqlDataReader reader = command.ExecuteReader();
            StringBuilder table = new StringBuilder();
            table.Append("<table border=1><tr>");
            table.Append("<th>student_id</th><th>Name</th><th>Major</th><th>Course_name</th><tr/>");

            while (reader.Read())
            {
                table.Append("<tr>");
                table.Append("<td>" + reader[0] + "</td>");
                table.Append("<td>" + reader[1] + "</td>");
                table.Append("<td>" + reader[2] + "</td>");
                table.Append("<td>" + reader[3] + "</td>");
                table.Append("<tr/>");
            }
            table.Append("</table>");
            conn.Close();
            PlaceHolder2.Controls.Add(new LiteralControl { Text = table.ToString() });
        }
    }
}