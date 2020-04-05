using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flight_Reservation.Flights
{
    public partial class ViewFlights : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddFlight_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddFlight.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Rows[GridView1.SelectedIndex].Visible = false;
            Response.Write("<script>alert('Your flight have successfully cancel Flight.')</script>");
        }
    }
}