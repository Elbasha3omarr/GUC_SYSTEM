using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_SYSTEM
{
    public partial class AdvisorLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorRegistration.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;

            SqlConnection conn = new SqlConnection(connStr);
            int id = 0;
            try
            {
                id = Int32.Parse(advisor_id.Text);
            }
            catch(FormatException)
            {
                Response.Write("Incorrect data type of Advisor it should be int,");
            }
            string password = Password.Text;
            string query = "SELECT dbo.FN_AdvisorLogin(@advisor_Id, @password) AS Success";

            SqlCommand command = new SqlCommand(query, conn);
            command.Parameters.Add("@advisor_Id", id);
            command.Parameters.Add("@password", password);

            conn.Open();
            bool success = (bool)command.ExecuteScalar();

            if (success)
                  {     
                        Session["advisorid"] = id;
                        Response.Redirect("AdvisorDashboard.aspx");
                        Response.Write("Successfull Login");
                        
                   }
            else
                   {
                        Response.Write("An error occurred during login.");
                   }
                
            }
    }
}