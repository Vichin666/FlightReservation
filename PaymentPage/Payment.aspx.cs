using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flight_Reservation.PaymentPage
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd, cmd1, cmd2;

        int test;
        protected void Page_Load(object sender, EventArgs e)

        {
            CurrentTime.Text = DateTime.Now.ToString();
            lblTotalPay.Text = string.Format("Total Payment: RM "+ Request.QueryString["totalPrice"]);        
        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            long parsedValue;
            char pastvalue;
            //name on card
            //if (cardTxt.Text.Equals("") || cardTxt.Text.StartsWith(" "))
            //{
            //    cardError.Visible = true;
            //    cardError.Text = "* Name Cannot start with space or blank.";
            //    test = 1;
            //}
            //else if (!char.TryParse(cardTxt.Text, out pastvalue))
            //{
            //    cardError.Visible = true;
            //    cardError.Text += " Character only.";
            //    test = 1;
            //}
            //else
            //{
            //    cardError.Visible = false;
            //}
            //card number
            if (NumTxt.Text.Equals("") || NumTxt.Text.StartsWith(" "))
            {
                numError.Visible = true;
                numError.Text = "* Number Cannot start with space or blank.";
                test = 1;
            }
            //else
            //{
            //    numError.Text = "*";
            //    numError.Visible = false;
            //    if (RadioButtonList1.SelectedValue.Equals("Visa"))
            //    {
            //        if (NumTxt.Text.Length != 16)
            //        {
            //            numError.Visible = true;
            //            numError.Text += " 16 digits.";
            //            test = 1;
            //        }
            //        if (!long.TryParse(NumTxt.Text, out parsedValue))
            //        {
            //            numError.Visible = true;
            //            numError.Text += " Number only.";
            //            test = 1;
            //        }



            //    }
            //    else
            //    {
            //        if (NumTxt.Text.Length != 16)
            //        {

            //            numError.Visible = true;
            //            numError.Text += " 16 digits.";
            //            test = 1;
            //        }
            //        if (!long.TryParse(NumTxt.Text, out parsedValue))
            //        {
            //            numError.Visible = true;
            //            numError.Text += " Number only.";
            //            test = 1;
            //        }

            //    }
            //}

            //expiry date
            //if (month.Text.Equals("") || year.Text.Equals(""))
            //{
            //    expiryError.Visible = true;
            //    expiryError.Text = "* Expiry Date Cannot be blank.";
            //    test = 1;
            //}
            else
            {
                expiryError.Visible = false;
            }

            //cvv
            if (cvvTxt.Text.Equals(""))
            {
                cvvError.Visible = true;
                cvvError.Text = "* CVV/CVC2 Cannot be blank.";
                test = 1;
            }
            else
            {
                cvvError.Visible = false;
                if (cvvTxt.Text.Length != 3)
                {
                    cvvError.Visible = true;
                    cvvError.Text = "* CVV/CVC2 Must Be 3 digits.";
                    test = 1;
                }
            }

            if (test != 1) { 
                AddReservation();
            }
        }


        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage/Home.aspx");
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue.Equals("Visa"))
            {
                NumTxt.MaxLength = 19;
                NumTxt.Text = "";
            }
            else
            {
                NumTxt.MaxLength = 16;
                NumTxt.Text = "";
            }
        }

        private void AddReservation()
        {
            con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            cmd = new SqlCommand();
            try
            {
                con.Open();
                cmd.CommandText = "insert into [Reservation](reservationDate,totalSeat,scheduleID,username)values(@reservationDate,@totalSeat,@scheduleID,@username)";
                cmd.Parameters.AddWithValue("@reservationDate", DateTime.Now.Date.ToShortDateString());
                cmd.Parameters.AddWithValue("@totalSeat", int.Parse(Request.QueryString["totalSeat"].ToString()));
                cmd.Parameters.AddWithValue("@scheduleID", int.Parse(Request.QueryString["scheduleID"].ToString()));
                cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                con.Close();

                AddPayment(getLatestReservationID());
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('Username is already existed! Please try other.')</script>");
                Response.Write(ex.ToString());
            }
        }

        private int getLatestReservationID()
        {
            con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            cmd1 = new SqlCommand();

            int latestID = -1;

            try
            {
                string strSelect = "Select Top 1 reservationID From [Reservation] Where username = @username Order By reservationID Desc";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@username", Session["username"].ToString());
                
                con.Open();
                SqlDataReader dtr = cmdSelect.ExecuteReader();

                if (dtr.HasRows)
                {
                    if (dtr.Read())
                    {
                        latestID = int.Parse(dtr["reservationID"].ToString()); //adminID
                    }
                }
                else
                    Response.Write("<script>alert('Your have entered invalid username or password')</script>");

                dtr.Close();
            }
            catch (SqlException ex)
            {
                Response.Write(ex);
            }
            finally
            {
                con.Close();
            }

            return latestID;
        }

        private void AddPayment(int latestReservationID)
        {
            con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            cmd2 = new SqlCommand();
            int month = int.Parse(Request.Form["month"].ToString());
            int Year = int.Parse(Request.Form["Year"].ToString());
            try
            {
                con.Open();
                cmd2.CommandText = "insert into [Payment](username,paymentType,creditCardNo,expiryMonth,expiryYear,cvv,paymentDate,reservationID,paymentAmount)values(@username,@paymentType,@creditCardNo,@expiryMonth,@expiryYear,@cvv,@paymentDate,@reservationID,@paymentAmount)";
                cmd2.Parameters.AddWithValue("@username", Session["username"].ToString());
                cmd2.Parameters.AddWithValue("@paymentType", RadioButtonList1.SelectedItem.ToString());
                cmd2.Parameters.AddWithValue("@creditCardNo", NumTxt.Text);
                cmd2.Parameters.AddWithValue("@expiryMonth", month);
                cmd2.Parameters.AddWithValue("@expiryYear", Year);
                cmd2.Parameters.AddWithValue("@cvv", cvvTxt.Text);
                cmd2.Parameters.AddWithValue("@paymentDate", CurrentTime.Text);
                cmd2.Parameters.AddWithValue("@reservationID", latestReservationID);
                cmd2.Parameters.AddWithValue("@paymentAmount", float.Parse(Request.QueryString["totalPrice"].ToString()));


                cmd2.Connection = con;
                cmd2.ExecuteNonQuery();
                con.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Payment Made Successfully! Redirecting to the Home Page...');window.location='../HomePage/Home.aspx';</script>");
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('Username is already existed! Please try other.')</script>");
                Response.Write(ex.ToString());
            }
        }
    }
}