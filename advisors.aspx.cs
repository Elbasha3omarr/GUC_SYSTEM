using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.ModelBinding;
using System.Text;

namespace WebApplication1
{
    public partial class advisors : System.Web.UI.Page
    {
        private object rdr;

        protected void Page_Load(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            using (con)
            {
                SqlCommand cmd = new SqlCommand("Procedures_AdminListAdvisors", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                StringBuilder table = new StringBuilder();
                table.Append("<table border=1><tr>");
                table.Append("<th>advisor_id Name </th><th>advisor_name </th><th>email</th><th>office </th><th>password </th><tr/>");
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





            //SqlDataReader rdr = Advisor.ExecuteReader(CommandBehavior.CloseConnection);
            //while (rdr.Read())
            //{
            //  String name = rdr.GetString(rdr.GetOrdinal("advisor_name"));
            //Label advisor_name = new Label();
            //advisor_name.Text = name;
            //form1.Controls.Add(advisor_name);



        }
    }
}
//String connStr = WebConfigurationManager.ConnectionStrings["WebApplication1"].ToString();
//SqlConnection conn = new SqlConnection(connStr);
// Response.Redirect("Component1.aspx");