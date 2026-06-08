using System;

namespace Narrativa.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();

            string checkSql = @"SELECT COUNT(*) FROM Users
                                WHERE Email = N'" + txtEmail.Text.Trim() + @"'";

            int count = Convert.ToInt32(myCrud.getSingleValue(checkSql));

            if (count > 0)
            {
                lblMessage.Text = "This email already exists.";
                return;
            }

            string mySql = @"INSERT INTO Users
                            (FullName, Email, Password, Role)
                            VALUES
                            (N'" + txtFullName.Text.Trim() + @"',
                             N'" + txtEmail.Text.Trim() + @"',
                             N'" + txtPassword.Text.Trim() + @"',
                             'User')";

            myCrud.executeQuery(mySql);

            lblMessage.Text = "Account created successfully.";

            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
        }
    }
}