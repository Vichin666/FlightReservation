using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flight_Reservation.LoginSignUpPage
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["adminID"] = null;
            Session["username"] = null;
            Response.Redirect("~/HomePage/Home.aspx");
        }
    }
}