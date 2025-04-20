using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace GUC_SYSTEM
{
    public partial class credithour_request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            //int s_id = Int32.Parse(studentid.Text);
            int c_hour = Int32.Parse(credithour.Text);
            string comment = Comment.Text;

            SqlCommand request = new SqlCommand("Procedures_StudentSendingCHRequest", conn);
            request.CommandType = CommandType.StoredProcedure;
            request.Parameters.Add(new SqlParameter("@credit_hours", c_hour));
            request.Parameters.Add(new SqlParameter("@StudentID", Session["user"]));
            request.Parameters.Add(new SqlParameter("@type", "Credit Hour Request"));
            request.Parameters.Add(new SqlParameter("@comment", comment));

            conn.Open();
            request.ExecuteNonQuery();
            Response.Write("Credit hour request sent successfully");
            conn.Close();
        }
    }
}