using System;
using System.Data;

namespace Narrativa.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (email == "" || password == "")
            {
                lblMessage.Text = "Please enter email and password.";
                return;
            }

            string mySql = @"SELECT UserID, FullName, Role
                             FROM Users
                             WHERE Email = N'" + email + @"'
                             AND Password = N'" + password + @"'";

            DataTable dt = myCrud.getDataTable(mySql);

            if (dt.Rows.Count > 0)
            {
                Session["UserID"] = dt.Rows[0]["UserID"].ToString();
                Session["FullName"] = dt.Rows[0]["FullName"].ToString();
                Session["Role"] = dt.Rows[0]["Role"].ToString();

                if (Session["Role"].ToString() == "Admin")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Invalid email or password.";
            }
        }
    }
}