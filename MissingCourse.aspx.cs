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
    public partial class MissingCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand missing = new SqlCommand("Procedures_ViewMS", conn);
            missing.CommandType = CommandType.StoredProcedure;
            //int id = Int32.Parse(studentid.Text);
            missing.Parameters.Add(new SqlParameter("@StudentID", Session["user"]));

            conn.Open();
            SqlDataReader reader = missing.ExecuteReader();
            StringBuilder table = new StringBuilder();
            table.Append("<table border=1><tr>");
            table.Append("<th>Course ID </th><th>Course Name </th><tr/>");
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