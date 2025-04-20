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
    public partial class Sign_Up : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUC_SYSTEM"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            string first_name = firstname.Text;
            string last_name = Lastname.Text;
            string password = Password.Text;
            string faculty = Faculty.Text;
            string email = Email.Text;
            string major = Major.Text;
            int semester= Int32.Parse(Semessterr.Text);            
            int student_Id;

            //SqlCommand phonenum = new SqlCommand("Procedures_StudentaddMobile", conn);
            //phonenum.CommandType = CommandType.StoredProcedure;

            SqlCommand signup = new SqlCommand("Procedures_StudentRegistration", conn);
            signup.CommandType = CommandType.StoredProcedure;

            signup.Parameters.Add(new SqlParameter("@first_name", first_name));
            signup.Parameters.Add(new SqlParameter("@last_name", last_name));
            signup.Parameters.Add(new SqlParameter("@password", password));
            signup.Parameters.Add(new SqlParameter("@faculty", faculty));
            signup.Parameters.Add(new SqlParameter("@email", email));
            signup.Parameters.Add(new SqlParameter("@major", major));
            signup.Parameters.Add(new SqlParameter("@Semester", semester));
            signup.Parameters.Add(new SqlParameter("@Student_id", SqlDbType.Int) { Direction = ParameterDirection.Output });



            //string student = (string)signup.Parameters["@Student_id"].Value;
            //phonenum.Parameters.Add(new SqlParameter("@StudentID", id));
            //phonenum.Parameters.Add(new SqlParameter("@mobile_number", Phonenum1));




            conn.Open();
            signup.ExecuteNonQuery();

            student_Id = Convert.ToInt32(signup.Parameters["@Student_id"].Value);
            Response.Write(student_Id);
            SqlCommand update = new SqlCommand("UPDATE Student SET financial_status=1 where student_id=" + student_Id, conn);

            //phonenum.ExecuteNonQuery();
            //update.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Login1.aspx");
            //if (first_name is null)
            //{
            //    Response.Write("First Name is not entered");
            //}
            //if (last_name is null)
            //{
            //   Response.Write("Last Name is not entered");
            //}
            //if (password is null)
            //{
            //    Response.Write("Password is not entered");
            //}
            //if (faculty is null)
            //{
            //    Response.Write("Faculty is not entered");
            //}
            //if (email is null)
            //{
            //    Response.Write("Email is not entered");
            //}
            //if (major is null)
            //{
            //    Response.Write("Major is not entered");
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login1.aspx");
        }
    }

}
