using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flight_Reservation.LoginSignUpPage
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        public AdminLogin()
        {
            con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            cmd = new SqlCommand();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (isEmptyStrLogin())
            {
                //error msg here
                Response.Write("<script>alert('Please fill in all the fields')</script>");
            }
            else
            {
                validateAccount();
            }
        }

        private Boolean isEmptyStrLogin()
        {
            if (username.Text.Equals("") || password.Text.Equals(""))
            {
                return true;
            }

            return false;
        }

        private void validateAccount()
        {
            try
            {
                string strSelect = "Select adminID From [Admin] Where adminID = @id AND adminPassword = @pwd";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@id", username.Text);
                cmdSelect.Parameters.AddWithValue("@pwd", password.Text);
                con.Open();
                SqlDataReader dtr = cmdSelect.ExecuteReader();

                if (dtr.HasRows)
                {
                    if (dtr.Read())
                    {
                        Session["adminID"] = dtr["adminID"].ToString(); //adminID
                        Response.Redirect("~/Schedule/ViewSchedule.aspx");//Manage Schedule
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
        }
    }
}