using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Flight_Reservation
{
    public partial class Testing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewonChanged(object sender, EventArgs e)
        {

            int adultQty = int.Parse(Request.QueryString["adultQty"]);
            int childQty = int.Parse(Request.QueryString["childQty"]);

            if (adultQty == 0 && childQty == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Choose a seat before make payment ! Redirecting to the Home Page...');window.location='../Homepage/Home.aspx';</script>");

            }
            else
            {
                GridViewRow gvr = GridView.SelectedRow; ;

                string scheduleID = gvr.Cells[0].Text;
                string totalPrice = gvr.Cells[7].Text;
                int totalOccupiedSeat = 0;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand();
                con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
                cmd = new SqlCommand();
                try
                {
                    con.Open();
                    cmd.CommandText = "select totalSeat from Reservation where scheduleID = @scheduleID";
                    cmd.Parameters.AddWithValue("@reservationDate", DateTime.Now.Date.ToShortDateString());
                    cmd.Parameters.AddWithValue("@totalSeat", int.Parse(Request.QueryString["totalSeat"].ToString()));
                    cmd.Parameters.AddWithValue("@scheduleID", int.Parse(Request.QueryString["scheduleID"].ToString()));
                    cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
                    cmd.Connection = con;
                    SqlDataReader myReader = cmd.ExecuteReader();
                    cmd.Parameters.Add("@scheduleID", scheduleID);
                    while (myReader.Read())
                    {
                        totalOccupiedSeat += int.Parse(myReader.GetValue(0).ToString());
                    }
                    myReader.Close();
                    con.Close();

                }
                catch (Exception ex)
                {
                    //Response.Write("<script>alert('Username is already existed! Please try other.')</script>");
                    Response.Write(ex.ToString());
                }

               



                //chg direct file
                Response.Redirect("~/ShowFlightConfirmation/FlightConfirmation.aspx?scheduleID=" + scheduleID +
                    "&adultQty=" + adultQty + "&childQty=" + childQty + "&totalPrice=" + totalPrice);
            }
            }

        protected void Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage/Home.aspx");
        }
    }
}