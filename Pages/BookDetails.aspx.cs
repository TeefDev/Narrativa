using System;
using System.Data;

namespace Narrativa.Pages
{
    public partial class BookDetails : System.Web.UI.Page
    {
        CRUD myCrud = new CRUD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookDetails();
                CheckIfRead();
            }
        }

        private void LoadBookDetails()
        {
            if (Request.QueryString["BookID"] == null)
            {
                Response.Redirect("Books.aspx");
                return;
            }

            string bookID = Request.QueryString["BookID"];

            string mySql =
                "SELECT * FROM Books WHERE BookID = " + bookID;

            DataTable dt = myCrud.getDataTable(mySql);

            if (dt.Rows.Count > 0)
            {
                imgBook.ImageUrl =
                    "../images/" + dt.Rows[0]["BookCover"].ToString();

                lblCategory.Text =
                    dt.Rows[0]["Category"].ToString();

                lblTitle.Text =
                    dt.Rows[0]["BookTitle"].ToString();

                lblAuthor.Text =
                    dt.Rows[0]["AuthorName"].ToString();

                lblType.Text =
                    dt.Rows[0]["BookType"].ToString();

                lblDate.Text =
                    Convert.ToDateTime(
                    dt.Rows[0]["PublishDate"])
                    .ToString("yyyy-MM-dd");

                lblCopies.Text =
                    dt.Rows[0]["Copies"].ToString();

                lblDescription.Text =
                    dt.Rows[0]["Description"].ToString();

                hfBookFile.Value =
                    dt.Rows[0]["BookFile"].ToString();

                lnkDownload.NavigateUrl =
                    "../BooksFiles/" +
                    dt.Rows[0]["BookFile"].ToString();

                lnkDownload.Attributes.Add(
                    "download",
                    dt.Rows[0]["BookFile"].ToString());
            }
        }

        protected void btnOpenBook_Click(object sender, EventArgs e)
        {
            if (hfBookFile.Value != "")
            {
                Response.Redirect(
                    "../BooksFiles/" + hfBookFile.Value);
            }
        }

        protected void btnRead_Click(object sender, EventArgs e)
        {
            Session["ReadBook"] =
                Request.QueryString["BookID"];

            pnlRead.Visible = true;

            Response.Redirect(
                "../BooksFiles/" + hfBookFile.Value);
        }

        private void CheckIfRead()
        {
            if (Session["ReadBook"] != null)
            {
                if (Session["ReadBook"].ToString() ==
                    Request.QueryString["BookID"])
                {
                    pnlRead.Visible = true;
                }
            }
        }

        protected void btnAddLibrary_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string userID =
                Session["UserID"].ToString();

            string bookID =
                Request.QueryString["BookID"];

            string checkSql =
                @"SELECT COUNT(*) FROM UserBooks
                  WHERE UserID = " + userID +
                  " AND BookID = " + bookID;

            int count =
                Convert.ToInt32(
                myCrud.getSingleValue(checkSql));

            if (count == 0)
            {
                string insertSql =
                    @"INSERT INTO UserBooks
                    (UserID, BookID)
                    VALUES
                    (" + userID + "," + bookID + ")";

                myCrud.executeQuery(insertSql);
            }

            Response.Redirect("MyLibrary.aspx");
        }
    }
}