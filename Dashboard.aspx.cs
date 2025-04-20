using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_SYSTEM
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Optional_Course(object sender, EventArgs e)
        {

            Response.Redirect("OptionalCourses.aspx");

        }

        protected void Available_Course(object sender, EventArgs e)
        {
            
            Response.Redirect("AvailableCourse.aspx");
            
        }
        protected void Required_Course(object sender, EventArgs e)
        {

            Response.Redirect("RequiredCourses.aspx");

        }

        protected void Course_Request(object sender, EventArgs e)
        {

            Response.Redirect("Course_Req.aspx");

        }

        protected void Missed_Course(object sender, EventArgs e)
        {

            Response.Redirect("MissingCourse.aspx");

        }
        protected void Hour_Request(object sender, EventArgs e)
        {

            Response.Redirect("credithour request.aspx");

        }



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("main.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentphone.aspx");
        }
    }
}