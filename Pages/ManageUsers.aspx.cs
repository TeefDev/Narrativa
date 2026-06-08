using System;
using System.Data;

namespace Narrativa.Pages
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        CRUD myCrud = new CRUD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            string mySql = "SELECT * FROM Users ORDER BY UserID DESC";

            DataTable dt = myCrud.getDataTable(mySql);

            gvUsers.DataSource = dt;
            gvUsers.DataBind();
        }

        protected void gvUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int userID = Convert.ToInt32(gvUsers.Rows[rowIndex].Cells[0].Text);

            if (e.CommandName == "DeleteUser")
            {
                string role = gvUsers.Rows[rowIndex].Cells[3].Text;

                if (role == "Admin")
                {
                    lblMessage.Text = "Admin account cannot be deleted.";
                    return;
                }

                string deleteUserBooks = "DELETE FROM UserBooks WHERE UserID = " + userID;
                myCrud.executeQuery(deleteUserBooks);

                string deleteUser = "DELETE FROM Users WHERE UserID = " + userID;
                myCrud.executeQuery(deleteUser);

                lblMessage.Text = "User deleted successfully.";
                LoadUsers();
            }
        }
    }
}