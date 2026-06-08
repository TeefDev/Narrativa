using System;
using System.Data;
using System.IO;

namespace Narrativa.Pages
{
    public partial class ManageBooks : System.Web.UI.Page
    {
        CRUD myCrud = new CRUD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadBooks();
                btnUpdate.Enabled = false;
            }
        }

        private void LoadBooks()
        {
            string mySql = "SELECT * FROM Books ORDER BY BookID DESC";

            DataTable dt = myCrud.getDataTable(mySql);

            gvBooks.DataSource = dt;
            gvBooks.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!ValidateFields())
            {
                return;
            }

            int copies = int.Parse(txtCopies.Text.Trim());

            string imageName = "";
            string pdfFile = "";

            if (fuBookCover.HasFile)
            {
                imageName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(fuBookCover.FileName);
                fuBookCover.SaveAs(Server.MapPath("~/images/") + imageName);
            }

            if (fuBookFile.HasFile)
            {
                pdfFile = Guid.NewGuid().ToString() + "_" + Path.GetFileName(fuBookFile.FileName);
                fuBookFile.SaveAs(Server.MapPath("~/BooksFiles/") + pdfFile);
            }

            string mySql = @"INSERT INTO Books
                            (BookTitle, AuthorName, Category, BookType, PublishDate, Copies, Description, BookCover, BookFile)
                            VALUES
                            (N'" + txtBookTitle.Text.Trim().Replace("'", "''") + @"',
                             N'" + txtAuthor.Text.Trim().Replace("'", "''") + @"',
                             N'" + ddlCategory.Text.Trim().Replace("'", "''") + @"',
                             N'" + rblBookType.SelectedValue + @"',
                             '" + txtDate.Text.Trim() + @"',
                             " + copies + @",
                             N'" + txtDescription.Text.Trim().Replace("'", "''") + @"',
                             N'" + imageName + @"',
                             N'" + pdfFile + @"')";

            myCrud.executeQuery(mySql);

            lblMessage.Text = "Book added successfully.";

            ClearFields();
            LoadBooks();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (hfBookID.Value == "")
            {
                lblMessage.Text = "Please select a book first.";
                return;
            }

            if (!ValidateFields())
            {
                return;
            }

            int copies = int.Parse(txtCopies.Text.Trim());

            string imageSql = "";
            string fileSql = "";

            if (fuBookCover.HasFile)
            {
                string imageName = Guid.NewGuid().ToString() + "_" + Path.GetFileName(fuBookCover.FileName);
                fuBookCover.SaveAs(Server.MapPath("~/images/") + imageName);

                imageSql = ", BookCover = N'" + imageName + "'";
            }

            if (fuBookFile.HasFile)
            {
                string pdfFile = Guid.NewGuid().ToString() + "_" + Path.GetFileName(fuBookFile.FileName);
                fuBookFile.SaveAs(Server.MapPath("~/BooksFiles/") + pdfFile);

                fileSql = ", BookFile = N'" + pdfFile + "'";
            }

            string mySql = @"UPDATE Books SET
                            BookTitle = N'" + txtBookTitle.Text.Trim().Replace("'", "''") + @"',
                            AuthorName = N'" + txtAuthor.Text.Trim().Replace("'", "''") + @"',
                            Category = N'" + ddlCategory.Text.Trim().Replace("'", "''") + @"',
                            BookType = N'" + rblBookType.SelectedValue + @"',PublishDate = '" + txtDate.Text.Trim() + @"',
                            Copies = " + copies + @",
                            Description = N'" + txtDescription.Text.Trim().Replace("'", "''") + @"'"
                            + imageSql
                            + fileSql +
                            @" WHERE BookID = " + hfBookID.Value;

            myCrud.executeQuery(mySql);

            lblMessage.Text = "Book updated successfully.";

            ClearFields();
            LoadBooks();
        }

        protected void gvBooks_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int bookID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditBook")
            {
                LoadBookByID(bookID);
            }

            if (e.CommandName == "DeleteBook")
            {
                myCrud.executeQuery("DELETE FROM UserBooks WHERE BookID = " + bookID);
                myCrud.executeQuery("DELETE FROM Books WHERE BookID = " + bookID);

                lblMessage.Text = "Book deleted successfully.";

                ClearFields();
                LoadBooks();
            }
        }

        private void LoadBookByID(int bookID)
        {
            string mySql = "SELECT * FROM Books WHERE BookID = " + bookID;

            DataTable dt = myCrud.getDataTable(mySql);

            if (dt.Rows.Count > 0)
            {
                hfBookID.Value = dt.Rows[0]["BookID"].ToString();

                txtBookTitle.Text = dt.Rows[0]["BookTitle"].ToString();
                txtAuthor.Text = dt.Rows[0]["AuthorName"].ToString();
                ddlCategory.Text = dt.Rows[0]["Category"].ToString();

                string bookType = dt.Rows[0]["BookType"].ToString();

                if (rblBookType.Items.FindByValue(bookType) != null)
                {
                    rblBookType.SelectedValue = bookType;
                }

                if (dt.Rows[0]["PublishDate"] != DBNull.Value)
                {
                    txtDate.Text = Convert.ToDateTime(dt.Rows[0]["PublishDate"]).ToString("yyyy-MM-dd");
                }

                txtCopies.Text = dt.Rows[0]["Copies"].ToString();
                txtDescription.Text = dt.Rows[0]["Description"].ToString();

                btnAdd.Enabled = false;
                btnUpdate.Enabled = true;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        private void ClearFields()
        {
            hfBookID.Value = "";

            txtBookTitle.Text = "";
            txtAuthor.Text = "";
            ddlCategory.Text = "";
            txtDate.Text = "";
            txtCopies.Text = "";
            txtDescription.Text = "";

            rblBookType.SelectedValue = "PDF";

            btnAdd.Enabled = true;
            btnUpdate.Enabled = false;
        }

        private bool ValidateFields()
        {
            if (txtBookTitle.Text.Trim() == "" ||
                txtAuthor.Text.Trim() == "" ||
                ddlCategory.Text.Trim() == "" ||
                txtDate.Text.Trim() == "" ||
                txtCopies.Text.Trim() == "")
            {
                lblMessage.Text = "Please fill all required fields.";
                return false;
            }

            int copies;

            if (!int.TryParse(txtCopies.Text.Trim(), out copies))
            {
                lblMessage.Text = "Copies must be a number.";
                return false;
            }

            return true;
        }
    }
}