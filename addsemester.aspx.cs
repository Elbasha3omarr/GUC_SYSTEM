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
using System.Globalization;

namespace WebApplication1
{
    public partial class addsemester : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }






        protected void Button1_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //CultureInfo culture = new CultureInfo("en-us");
            DateTime s_date = DateTime.ParseExact(start_date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);

            //DateTime e_date = Convert.ToDateTime(end_date.ToString());
            DateTime e_date = DateTime.ParseExact(end_date.Text, "dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture);
            SqlCommand cmd = new SqlCommand("AdminAddingSemester", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@start_date", s_date);
            cmd.Parameters.AddWithValue("@end_date", e_date);
            cmd.Parameters.AddWithValue("@semester_code", code.Text);
            using (con)
            {

                con.Open();




                cmd.ExecuteNonQuery();
                Response.Write("semester addedd successfully");


                con.Close();
            }
        }
    }
}