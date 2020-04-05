using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flight_Reservation.Flights
{
    public partial class Flights : System.Web.UI.Page
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
           
            try
            {
                cmd = new SqlCommand();
                con.Open();
                cmd.CommandText = "insert into [Flight](flightName,totalSeats,chilrQty,aduktQty)values(@flightName,@totalSeats,@chilrQty,@aduktQty)";
                cmd.Parameters.AddWithValue("@flightName", flightName.Text);
                cmd.Parameters.AddWithValue("@totalSeats", "150");
                cmd.Parameters.AddWithValue("@chilrQty", Childrenseat.Text);
                cmd.Parameters.AddWithValue("@aduktQty", Adultseat.Text);
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Flight Created Successfully! Redirecting to the Home Page...');window.location='../HomePage/Home';</script>");
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
    }
}