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
    public partial class LoginSignUp : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;

        public LoginSignUp()
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
            string selectedAction = Request.Form["choiceGroup"].ToString();

            if (selectedAction.Equals("Login"))
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
            else
            {
                if (isEmptyStrRegister())
                {
                    //error msg
                    Response.Write("<script>alert('Please fill in all the fields')</script>");
                }

                if (!isMatchPassword())
                {
                    //error msg
                    Response.Write("<script>alert('Your password does not match with the confirm password')</script>");
                }

                //register account
                try
                {
                    con.Open();
                    cmd.CommandText = "insert into [User](username,userIC,userEmail,userContactNo,userPassword)values(@username,@userIC,@userEmail,@userContactNo,@userPassword)";
                    cmd.Parameters.AddWithValue("@username", username.Text);
                    cmd.Parameters.AddWithValue("@userIC", ic.Text);
                    cmd.Parameters.AddWithValue("@userEmail", email.Text);
                    cmd.Parameters.AddWithValue("@userContactNo", contact.Text);
                    cmd.Parameters.AddWithValue("@userPassword", password.Text);

                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Account Created Successfully! Redirecting to the Home Page...');window.location='HomePage/Home.aspx';</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Username is already existed! Please try other.')</script>");
                }
            }
            //Response.Redirect("https://www.facebook.com");
        }

        private Boolean isMatchPassword()
        {
            if (password.Text.Equals(confirmPassword.Text)){
                return true;
            }

            return false;
        }

        private Boolean isEmptyStrRegister()
        {
            if (username.Text.Equals("") || password.Text.Equals("") || confirmPassword.Text.Equals("") ||
                ic.Text.Equals("") || contact.Text.Equals("")){
                return true;
            }

            return false;
        }

        private Boolean isEmptyStrLogin()
        {
            if (username.Text.Equals("") || password.Text.Equals("")){
                return true;
            }

            return false;
        }

        private void validateAccount()
        {
            try
            {
                
                string strSelect = "Select username From [User] Where username = @user AND userPassword = @pwd";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@user", username.Text);
                cmdSelect.Parameters.AddWithValue("@pwd", password.Text);
                con.Open();
                SqlDataReader dtr = cmdSelect.ExecuteReader();

                if (dtr.HasRows)
                {
                    if (dtr.Read())
                    {
                        Session["username"] = dtr["username"].ToString(); //username
                        Response.Redirect("~/HomePage/Home.aspx");
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