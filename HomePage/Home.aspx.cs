using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Flight_Reservation.HomePage
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        
        public void showdata()
        {
           
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            SqlCommand cmd;
            con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            cmd = new SqlCommand();
            lb1.Text = "<b><font color=Brown>" + "WELLCOME:: " + "</font>" + "<b><font color=red>" + Session["username"] + "</font>";
            string str;
            

            con.Open();

            str = "select username from [User] where username='" + Session["username"] + "'";

            cmd = new SqlCommand(str, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);

            

        }


        
        protected void showBtnClicked(object sender, EventArgs e)
        {
           
            //string origin = Request.Form["origin"].ToString();
            //String destination = Request.Form["destination"].ToString();
            String departureDate = Request.Form["departureDate"].ToString();
                int adultQty = int.Parse(Request.Form["adultQty"].ToString());
                 int childQty = int.Parse(DropDownList1.SelectedValue);

            Response.Redirect("~/ShowFlights.aspx?origin=" + origin.SelectedValue + "&destination=" + destination.SelectedValue + "&departureDate=" + departureDate
                        + "&adultQty=" + adultQty + "&childQty=" + childQty);
            

            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}