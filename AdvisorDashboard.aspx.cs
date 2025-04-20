using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_SYSTEM
{
    public partial class AdvisorDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("view advising1.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateGraduationPlan.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Addgradcourse.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("update_graduationdate.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteGPCourse.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("advisingstudents.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewRequests.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewpendingreq.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("ApproveCHR.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("ApproveCourseReq.aspx");
        }
    }
}