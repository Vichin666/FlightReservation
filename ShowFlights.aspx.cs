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
                GridViewRow gvr = GridView.SelectedRow;

                string scheduleID = gvr.Cells[0].Text;
                string totalPrice = gvr.Cells[7].Text;
                int totalOccupiedSeat = 0;
                int totalSeats = 0;

                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();

                try
                {
                    int flightID = -1;

                    //Get Total Occupied Seat
                    SqlCommand cmd = new SqlCommand();
                    con.Open();
                    cmd.CommandText = "select totalSeat from Reservation where scheduleID = @scheduleID";
                    cmd.Parameters.AddWithValue("@scheduleID", scheduleID);
                    cmd.Connection = con;
                    SqlDataReader myReader = cmd.ExecuteReader();

                    while (myReader.Read())
                    {
                        totalOccupiedSeat += int.Parse(myReader.GetValue(0).ToString());
                    }
                    myReader.Close();
                    con.Close();

                    //Get Flight ID
                    cmd = new SqlCommand();
                    con.Open();
                    cmd.CommandText = "select flightID from Schedule where scheduleID = @scheduleID";
                    cmd.Parameters.AddWithValue("@scheduleID", scheduleID);
                    cmd.Connection = con;
                    myReader = cmd.ExecuteReader();

                    while (myReader.Read())
                    {
                        flightID = int.Parse(myReader.GetValue(0).ToString());
                    }
                    myReader.Close();
                    con.Close();

                    if (flightID != -1)
                    {
                        //Get Total Flight Seat
                        cmd = new SqlCommand();
                        con.Open();
                        cmd.CommandText = "select totalSeats from Flight where flightID = @flightID";
                        cmd.Parameters.AddWithValue("@flightID", flightID);
                        cmd.Connection = con;
                        myReader = cmd.ExecuteReader();

                        while (myReader.Read())
                        {
                            totalSeats = int.Parse(myReader.GetValue(0).ToString());
                        }
                        myReader.Close();
                        con.Close();

                        //Checking is it over seat 

                        totalOccupiedSeat += adultQty + childQty;
                        Boolean overSeat = totalSeats - totalOccupiedSeat < 0;

                        if (overSeat)
                        {
                            int overSeats = totalSeats - totalOccupiedSeat;
                            Response.Write("<script>alert('Your selected seats have been exceed the capacity of flight. [Exceed " + Math.Abs(overSeats) + " seat(s)]')</script>");
                        }
                        else
                        {
                            Response.Redirect("~/ShowFlightConfirmation/FlightConfirmation.aspx?scheduleID=" + scheduleID +
                        "&adultQty=" + adultQty + "&childQty=" + childQty + "&totalPrice=" + totalPrice);
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Something wrong with database.')</script>");
                    }
                }
                catch (Exception ex)
                {
                    //Response.Write("<script>alert('Username is already existed! Please try other.')</script>");
                    Response.Write(ex.ToString());
                }
            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage/Home.aspx");
        }
    }
}