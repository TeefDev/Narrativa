using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Linq;
using System.Web.UI.WebControls;

namespace Narrativa.Pages
{
    public partial class Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["NarrativaConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            string messageType = string.Join(", ",
                cblMessageType.Items.Cast<ListItem>()
                .Where(item => item.Selected)
                .Select(item => item.Text));

            if (fullName == ""|| subject == "" || message == "")
            {
                lblMessage.Text = "Please fill all fields.";
                return;
            }

            if (messageType == "")
            {
                lblMessage.Text = "Please select message category.";
                return;
            }

            try
            {
                SaveMessage(fullName, email, subject, message, messageType);
                SendEmail(fullName, email, subject, message, messageType);

                txtFullName.Text = "";
                txtEmail.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";

                foreach (ListItem item in cblMessageType.Items)
                {
                    item.Selected = false;
                }

                lblMessage.Text = "";

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "popup",
                    "showSuccessPopup();",
                    true
                );
            }
            catch
            {
                lblMessage.Text = "Message saved, but email settings need checking.";
            }
        }

        private void SaveMessage(string fullName, string email, string subject, string message, string messageType)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO ContactMessages
                                (FullName, Email, Subject, Message, MessageType)
                                VALUES
                                (@FullName, @Email, @Subject, @Message, @MessageType)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Subject", subject);
                cmd.Parameters.AddWithValue("@Message", message);
                cmd.Parameters.AddWithValue("@MessageType", messageType);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void SendEmail(string fullName, string email, string subject, string message, string messageType)
        {
            string fromEmail = "teefmoo@gmail.com";
            string appPassword = "uleorcwnovhkwvtn";
            string toEmail = "teef122@icloud.com";

            MailMessage mail = new MailMessage();

            mail.From = new MailAddress(fromEmail, "Narrativa");
            mail.To.Add(toEmail);
            mail.Subject = "Narrativa Contact: " + subject;
            mail.IsBodyHtml = true;

            mail.Body =
                "<div style='font-family:Segoe UI,Arial;padding:25px;background:#f7efe3;color:#2b1d14'>" +

                "<div style='max-width:700px;margin:auto;background:white;border-radius:18px;overflow:hidden;border:1px solid #ead7bc'>" +

                "<div style='background:#2b1d14;padding:25px;color:white'>" +
                "<h1 style='margin:0;color:#f2c879;font-size:32px;'>Narrativa</h1>" + "<p style='margin:8px 0 0 0;color:#f8ead5;font-size:15px;'>New Contact Message</p>" +
                "</div>" +

                "<div style='padding:28px'>" +

                "<p style='font-size:15px;color:#6b4b35;line-height:1.8;margin-top:0;'>" +
                "A new message has been received from Narrativa Contact Page." +
                "</p>" +

                "<table style='width:100%;border-collapse:collapse;margin-top:18px;'>"

                + "<tr><td style='padding:14px;font-weight:bold;background:#fff8ec;width:180px;border-bottom:1px solid #ead7bc;'>Full Name</td><td style='padding:14px;border-bottom:1px solid #ead7bc;'>" + fullName + "</td></tr>"

                + "<tr><td style='padding:14px;font-weight:bold;background:#fff8ec;border-bottom:1px solid #ead7bc;'>Email</td><td style='padding:14px;border-bottom:1px solid #ead7bc;'>" + email + "</td></tr>"

                + "<tr><td style='padding:14px;font-weight:bold;background:#fff8ec;border-bottom:1px solid #ead7bc;'>Category</td><td style='padding:14px;border-bottom:1px solid #ead7bc;'>" + messageType + "</td></tr>"

                + "<tr><td style='padding:14px;font-weight:bold;background:#fff8ec;border-bottom:1px solid #ead7bc;'>Subject</td><td style='padding:14px;border-bottom:1px solid #ead7bc;'>" + subject + "</td></tr>"

                + "<tr><td style='padding:14px;font-weight:bold;background:#fff8ec;'>Message</td><td style='padding:14px;line-height:1.8;'>" + message + "</td></tr>"

                + "</table>" +

                "<div style='margin-top:25px;padding:16px;background:#fff8ec;border-radius:14px;color:#8b5e34;font-weight:bold;text-align:center;'>" +
                "Sent automatically from Narrativa Digital Library." +
                "</div>" +

                "</div></div></div>";

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential(fromEmail, appPassword);
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }
    }
}