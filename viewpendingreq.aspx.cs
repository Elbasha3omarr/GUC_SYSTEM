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
    public partial class viewpendingreq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            int a_id = (int)Session["advisorid"];
            bool flag = (bool)CheckadvisorExistsinRequest(a_id);
            if (flag)
            {
                SqlCommand viewpend = new SqlCommand("Procedures_AdvisorViewPendingRequests", conn);
                viewpend.CommandType = System.Data.CommandType.StoredProcedure;
                viewpend.Parameters.AddWithValue("@Advisor_ID", Session["advisorid"]);
                conn.Open();
                SqlDataReader reader = viewpend.ExecuteReader();
                StringBuilder table = new StringBuilder();
                table.Append("<table border=1><tr>");
                table.Append("<th>Request ID</th><th>Type</th><th>Comment</th><th>Status</th><th>credit hours</th>" +
                    "<th>Course ID</th><th>Student ID</th><th>Advisor ID</th><tr/>"); 
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
                conn.Close();
                PlaceHolder2.Controls.Add(new LiteralControl { Text = table.ToString() });
            }
            else
            {
                Response.Write("There is no advisor with the written Id That has a request");
            }
        }
        private bool CheckadvisorExistsinRequest(int advisorId)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand search = new SqlCommand("SELECT COUNT(*) FROM Request WHERE advisor_id = "+ advisorId, conn);

            conn.Open();
            int count = (int)search.ExecuteScalar();
            conn.Close();

            return count > 0;
        }
    }
}