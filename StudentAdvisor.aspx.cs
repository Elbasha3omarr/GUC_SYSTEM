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
    public partial class StudentAdvisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            using (con)
            {
                SqlCommand cmd = new SqlCommand("AdminListStudentsWithAdvisors", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                StringBuilder table = new StringBuilder();
                table.Append("<table border=1><tr>");
                table.Append("<th>student_id </th><th>f_name </th><th>l_name</th><th>advisor_id </th><th>advisor_name </th><tr/>");
                while (reader.Read())
                {
                    table.Append("<tr>");
                    table.Append("<td>" + reader[0] + "</td>");
                    table.Append("<td>" + reader[1] + "</td>");
                    table.Append("<td>" + reader[2] + "</td>");
                    table.Append("<td>" + reader[3] + "</td>");
                    table.Append("<td>" + reader[4] + "</td>");
                    table.Append("<tr/>");
                }
                table.Append("</table>");
                con.Close();
                PlaceHolder1.Controls.Add(new LiteralControl { Text = table.ToString() });



            }
        }
    }
}
