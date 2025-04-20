using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GUC_SYSTEM
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Register(object sender, EventArgs e)
        {
            //string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            Response.Redirect("Sign Up.aspx");
            //Response.Write("hello");
        }

        protected void Log_In(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                int id = 0;
                try
                {
                    id = Int32.Parse(Username.Text);
                }
                catch (FormatException)
                {
                    Response.Write("Id written incorrectly");

                }
                string password = Password.Text;

                string query = "SELECT dbo.FN_StudentLogin(@Student_id, @password) AS Success";

                using (SqlCommand command = new SqlCommand(query, conn))
                {
                    command.Parameters.Add("@Student_id", id);
                    command.Parameters.Add("@password", password);

                    conn.Open();
                    bool success = (bool)command.ExecuteScalar();

                    if (success)
                        {   
                            Session["user"] = id;
                            Response.Redirect("Dashboard.aspx");
                            
                        }
                    else
                    {
                        Response.Write("User Not found during Login");
                    }
                }
            }
        }
    }
}
