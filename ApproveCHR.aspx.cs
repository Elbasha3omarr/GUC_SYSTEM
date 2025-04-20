using Microsoft.Win32;
using System;
using System.Collections;
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
    public partial class ApproveCHR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            int id = 0;
            try
            {
                id = Int32.Parse(req_id.Text);
            }
            catch (FormatException)
            {
                Response.Write("Incorrect data type of Request it should be int,");
            }
            bool flag = (bool)Checkrequestexists(id);
            bool flag2 = (bool)checkifhour(id);
            if (flag2)
            {
                if (flag)
                {
                    string code = sem_code.Text;
                    SqlCommand approve = new SqlCommand("Procedures_AdvisorApproveRejectCHRequest", conn);
                    approve.CommandType = CommandType.StoredProcedure;
                    approve.Parameters.Add("@requestID", id);
                    approve.Parameters.Add("@current_sem_code", code);

                    conn.Open();
                    approve.ExecuteNonQuery();
                    Response.Write("Status of the Request was Updated successfully");
                    conn.Close();
                }
                else
                {
                    Response.Write("The Request ID was not found ");
                }
            }
            else
            {
                Response.Write("The Request ID was not found or the request type was not Credit Hours,");
            }
        }
        private bool Checkrequestexists(int req_id)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand search = new SqlCommand("SELECT COUNT(*) FROM Request WHERE request_id = " + req_id, conn);

            conn.Open();
            int count = (int)search.ExecuteScalar();
            conn.Close();

            return count > 0;
        }
        private bool checkifhour(int req_id)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand search = new SqlCommand("SELECT Count(*) FROM Request WHERE type LIKE '%credit%' AND request_id = " + req_id, conn);

            conn.Open();
            int count = (int)search.ExecuteScalar();
            conn.Close();

            return count > 0;
        }
    }
}