using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("gradplan_asscourse.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("courses_prereq.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("upcoming_not_paid_inst.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("courses_with_exams.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("reg_for_first.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("reg_for_sec.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("course_slot_instructor.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("slots_of certain course_inst.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Choose_instructor_Forcourse.aspx");
        }
    }
}