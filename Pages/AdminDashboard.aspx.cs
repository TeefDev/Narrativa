using System;
using System.Data;
using System.IO;
using System.Text;
using System.Web;

namespace Narrativa.Pages
{
    public partial class AdminDashboard : System.Web.UI.Page
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
                LoadCounts();
                LoadLatestBooks();
            }
        }

        private void LoadCounts()
        {
            lblBooks.Text = myCrud.getSingleValue("SELECT COUNT(*) FROM Books").ToString();
            lblUsers.Text = myCrud.getSingleValue("SELECT COUNT(*) FROM Users").ToString();
            lblUserBooks.Text = myCrud.getSingleValue("SELECT COUNT(*) FROM UserBooks").ToString();
            lblMessages.Text = myCrud.getSingleValue("SELECT COUNT(*) FROM ContactMessages").ToString();
        }

        private void LoadLatestBooks()
        {
            string mySql = @"SELECT TOP 5 BookID, BookTitle, AuthorName, Category, Copies
                             FROM Books
                             ORDER BY BookID DESC";

            DataTable dt = myCrud.getDataTable(mySql);

            gvLatestBooks.DataSource = dt;
            gvLatestBooks.DataBind();
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=NarrativaDashboardReport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            StringWriter sw = new StringWriter();

            sw.WriteLine("<table border='1'>");

            sw.WriteLine("<tr>");
            sw.WriteLine("<th colspan='2' style='background:#2b1d14;color:#f2c879;font-size:20px;'>Narrativa Dashboard Report</th>");
            sw.WriteLine("</tr>");

            sw.WriteLine("<tr><td>Total Books</td><td>" + lblBooks.Text + "</td></tr>");
            sw.WriteLine("<tr><td>Total Users</td><td>" + lblUsers.Text + "</td></tr>");
            sw.WriteLine("<tr><td>Saved Books</td><td>" + lblUserBooks.Text + "</td></tr>");
            sw.WriteLine("<tr><td>Messages</td><td>" + lblMessages.Text + "</td></tr>");
            sw.WriteLine("<tr><td>Export Date</td><td>" + DateTime.Now.ToString("yyyy-MM-dd HH:mm") + "</td></tr>");

            sw.WriteLine("</table>");

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
}