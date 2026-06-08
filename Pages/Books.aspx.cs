using System;
using System.Data.SqlClient;

namespace Narrativa.Pages
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadBooks();
            }
        }

        private void LoadBooks()
        {
            CRUD myCrud = new CRUD();

            string mySql = @"SELECT * FROM Books ORDER BY BookID DESC";

            SqlDataReader dr = myCrud.getDrPassSql(mySql);

            if (dr.HasRows)
            {
                rptBooks.DataSource = dr;
                rptBooks.DataBind();

                lblEmpty.Text = "";
            }
            else
            {
                lblEmpty.Text = "No books available yet.";
            }

            dr.Close();
        }
    }
}