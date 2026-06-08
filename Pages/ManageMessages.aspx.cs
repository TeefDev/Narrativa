using System;
using System.Data;

namespace Narrativa.Pages
{
    public partial class ManageMessages : System.Web.UI.Page
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
                LoadMessages();
            }
        }

        private void LoadMessages()
        {
            string mySql = "SELECT * FROM ContactMessages ORDER BY MessageID DESC";

            DataTable dt = myCrud.getDataTable(mySql);

            gvMessages.DataSource = dt;
            gvMessages.DataBind();
        }

        protected void gvMessages_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int messageID = Convert.ToInt32(gvMessages.Rows[rowIndex].Cells[0].Text);

            if (e.CommandName == "DeleteMessage")
            {
                string mySql = "DELETE FROM ContactMessages WHERE MessageID = " + messageID;

                myCrud.executeQuery(mySql);

                lblMessage.Text = "Message deleted successfully.";

                LoadMessages();
            }
        }
    }
}