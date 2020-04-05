using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Flight_Reservation.Schedule
{
    public partial class Schedule : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
            }
            catch (SqlException ex)
            {
                Response.Write(ex);
            }
           
        }

        protected void onSubmitClicked(object sender, EventArgs e)
        {
            string departureDate = Request.Form["departureDate"].ToString();
            string departureTime = Request.Form["departureTime"].ToString();
            float adultPrice = float.Parse(Request.Form["adultPrice"].ToString());
            float childPrice = float.Parse(Request.Form["childPrice"].ToString());
            Session["AdminID"] = 1;
            int adminID = int.Parse(HttpContext.Current.Session["AdminID"].ToString());

            try
            {
                cmd = new SqlCommand();
                con.Open();
                cmd.CommandText = "insert into [Schedule](origin,destination,departureDate,departureTime,adultPrice,childPrice,adminID,flightID)values(@origin,@destination,@departureDate,@departureTime,@adultPrice,@childPrice,@adminID,@flightID)";
                cmd.Parameters.AddWithValue("@origin", origin.Text);
                cmd.Parameters.AddWithValue("@destination", destination.Text);
                cmd.Parameters.AddWithValue("@departureDate", departureDate);
                cmd.Parameters.AddWithValue("@departureTime", departureTime);
                cmd.Parameters.AddWithValue("@adultPrice", adultPrice);
                cmd.Parameters.AddWithValue("@childPrice", childPrice);
                cmd.Parameters.AddWithValue("@adminID", adminID);
                cmd.Parameters.AddWithValue("@flightID", flight.SelectedValue);
                cmd.Connection = con;
                cmd.ExecuteNonQuery();  
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Schedule Created Successfully! Redirecting to the Home Page...');window.location='ViewSchedule';</script>");
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                con.Close();
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewSchedule.aspx");
        }
    }
}