using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_SYSTEM
{
    public partial class studentphone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            string phone = phonenum.Text;
            SqlCommand phonenum1 = new SqlCommand("Procedures_StudentaddMobile", conn);
            phonenum1.CommandType = CommandType.StoredProcedure;
            phonenum1.Parameters.Add(new SqlParameter("@StudentID", Session["user"]));
            phonenum1.Parameters.Add(new SqlParameter("@mobile_number", phone));
           
            conn.Open();
            phonenum1.ExecuteNonQuery();
            Response.Write("done");


        }
    }
}