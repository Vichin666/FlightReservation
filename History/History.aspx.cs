using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flight_Reservation.History
{
    public partial class History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage/Home.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Rows[GridView1.SelectedIndex].Visible = false;
            Response.Write("<script>alert('Your flight have successfully cancel.')</script>");
        }
    }
}