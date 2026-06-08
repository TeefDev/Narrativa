using System;
using System.Data;

namespace Narrativa.Pages
{
    public partial class MyLibrary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                LoadMyLibrary();
            }
        }

        private void LoadMyLibrary()
        {
            CRUD myCrud = new CRUD();

            string mySql = @"SELECT UserBooks.UserBookID,
                                    Books.*
                             FROM UserBooks
                             INNER JOIN Books
                             ON UserBooks.BookID = Books.BookID
                             WHERE UserBooks.UserID = "
                             + Session["UserID"];

            DataTable dt = myCrud.getDataTable(mySql);

            rptMyLibrary.DataSource = dt;
            rptMyLibrary.DataBind();

            if (dt.Rows.Count == 0)
            {
                lblEmpty.Text = "No books added yet.";
            }
            else
            {
                lblEmpty.Text = "";
            }
        }

        protected void btnRemove_Command(object sender,
            System.Web.UI.WebControls.CommandEventArgs e)
        {
            CRUD myCrud = new CRUD();

            string mySql = @"DELETE FROM UserBooks
                             WHERE UserBookID = "
                             + e.CommandArgument;

            myCrud.executeQuery(mySql);

            LoadMyLibrary();
        }
    }
}