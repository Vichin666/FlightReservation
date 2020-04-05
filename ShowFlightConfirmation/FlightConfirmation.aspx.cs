using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flight_Reservation.ShowFlightConfirmation
{
    public partial class FlightConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {

            if(Session["username"] == null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('You must login to proceed to payment! Redirecting to the Login Page...');window.location='../LoginSignUpPage/LoginSignUp.aspx';</script>");
            }
            else
            { //user must login to proceed payment
                string scheduleID = Request.QueryString["scheduleID"];
                int adultQty = int.Parse(Request.QueryString["adultQty"]);
                int childQty = int.Parse(Request.QueryString["childQty"]);
                string totalPrice = Request.QueryString["totalPrice"];

                int totalSeat = adultQty + childQty;

                Response.Redirect("~/PaymentPage/Payment.aspx?scheduleID=" + scheduleID
                    + "&totalSeat=" + totalSeat + "&totalPrice=" + totalPrice);
            }
        }
    }
}