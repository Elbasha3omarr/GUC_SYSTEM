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

namespace GUC_SYSTEM
{
    public partial class RequiredCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand viewrequired = new SqlCommand("Procedures_ViewRequiredCourses", conn);
            viewrequired.CommandType = CommandType.StoredProcedure;
            //int id = Int32.Parse(studentid.Text);
            viewrequired.Parameters.Add(new SqlParameter("@StudentID", Session["user"]));
            viewrequired.Parameters.Add(new SqlParameter("@current_semester_code", sem_code2.Text));

            conn.Open();
            SqlDataReader reader = viewrequired.ExecuteReader();
            StringBuilder table = new StringBuilder();
            table.Append("<table border=1><tr>");
            table.Append("<th>Course Name </th><th>Course ID </th><tr/>");
            while (reader.Read())
            {
                table.Append("<tr>");
                table.Append("<td>" + reader[0] + "</td>");
                table.Append("<td>" + reader[1] + "</td>");
                table.Append("<tr/>");
            }
            table.Append("</table>");
            conn.Close();
            PlaceHolder2.Controls.Add(new LiteralControl { Text = table.ToString() });
        }
    }
}