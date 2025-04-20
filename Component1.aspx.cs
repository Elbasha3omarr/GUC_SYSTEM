using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Component1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void back(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
        protected void advisors(object sender, EventArgs e)
        {
            Response.Redirect("advisors.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentAdvisor.aspx");

        }


        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("addsemester.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("PendingRequests.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("addcourse.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("inst_course_slot.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentLinkAdvisor.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("Procedures_AdminLinkStudent.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Instructors_AssignedCourses.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("SemesterwithCourses.aspx");
        }
    }
}