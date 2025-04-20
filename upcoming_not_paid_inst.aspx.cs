using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class upcoming_not_paid_inst : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string query = "SELECT dbo.FN_StudentUpcoming_installment(@student_ID) AS success";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.AddWithValue("@student_ID", Session["user"]);
            con.Open();
            //DateTime s = (DateTime)command.ExecuteScalar();
            Response.Write(command.ExecuteScalar());
            //con.Close();
            //Response.Write(command.ExecuteScalar());

        }
    }
}