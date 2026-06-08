<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Narrativa.Pages.Contact" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Narrativa - Contact</title>

    <style>
        *{
            box-sizing:border-box;
        }

        body{
            margin:0;
            font-family:'Segoe UI', Arial, sans-serif;
            background:#f7efe3;
            color:#2b1d14;
        }

        .navbar{
            width:100%;
            padding:20px 70px;
            display:flex;
            justify-content:space-between;
            align-items:center;
            background:#2b1d14;
            position:sticky;
            top:0;
            z-index:1000;
        }

        .logo{
            font-size:32px;
            font-weight:900;
            color:#f2c879;
        }

        .nav-links a{
            color:#f8ead5;
            text-decoration:none;
            margin-left:22px;
            font-size:14px;
            font-weight:700;
            transition:0.3s;
        }

        .nav-links a:hover{
            color:#f2c879;
        }

        .page{
            min-height:720px;
            padding:65px 70px;
            background:
            radial-gradient(circle at top left, rgba(242,200,121,0.35), transparent 35%),
            linear-gradient(135deg,#f7efe3,#ead7bc);
        }

        .contact-box{
            max-width:620px;
            margin:auto;
            background:white;
            padding:35px;
            border-radius:30px;
            border:1px solid #ead7bc;
            box-shadow:0 20px 55px rgba(43,29,20,0.12);
        }

        .badge{
            display:inline-block;
            padding:10px 18px;
            border-radius:999px;
            background:#fff8ec;
            color:#8b5e34;
            border:1px solid #e1bd82;
            font-weight:800;
            margin-bottom:16px;
        }

        h1{
            margin:0 0 10px;
            font-size:42px;
            color:#2b1d14;
        }

        .subtitle{
            color:#6b4b35;
            font-size:16px;
            margin-bottom:26px;
            line-height:1.8;
        }

        label{
            display:block;
            margin-bottom:8px;
            margin-top:15px;
            font-weight:800;
            color:#2b1d14;
        }

        .input{
            width:100%;
            padding:14px 15px;
            border-radius:15px;
            border:1px solid #d6b17a;
            background:#fffaf3;
            outline:none;
            font-size:15px;
        }

        .textarea{
            width:100%;
            height:125px;
            padding:14px 15px;
            border-radius:15px;
            border:1px solid #d6b17a;
            background:#fffaf3;
            outline:none;
            resize:none;
            font-size:15px;
        }

        .check-list{
            margin:8px 0 18px;
            color:#2b1d14;
            font-weight:800;
        }

        .check-list td{
            padding-right:24px;
            padding-top:6px;
        }

        .btn{
            width:100%;
            padding:15px;
            margin-top:24px;
            border:none;
            border-radius:18px;
            background:#8b5e34;
            color:white;
            font-size:16px;
            font-weight:900;
            cursor:pointer;
            transition:0.3s;
        }

        .btn:hover{
            background:#6b4b35;
            transform:translateY(-2px);
        }

        .error{
            display:block;
            margin-top:15px;
            text-align:center;
            color:#8b5e34;
            font-weight:800;
        }

        .popup-success{
            position:fixed;
            top:25px;
            right:25px;
            background:#2b1d14;
            color:#f2c879;
            padding:18px 25px;
            border-radius:18px;
            box-shadow:0 18px 45px rgba(0,0,0,0.25);
            display:none;
            z-index:9999;
            font-weight:900;
        }

        .popup-success.show{display:block;
        }

        .footer{
            text-align:center;
            padding:25px;
            background:#2b1d14;
            color:#f8ead5;
        }
    </style>

    <script>
        function validateContact() {

            var name = document.getElementById("<%= txtFullName.ClientID %>").value.trim();
            var email = document.getElementById("<%= txtEmail.ClientID %>").value.trim();
            var subject = document.getElementById("<%= txtSubject.ClientID %>").value.trim();
            var message = document.getElementById("<%= txtMessage.ClientID %>").value.trim();

            if (name === ""|| subject === "" || message === "") {
                alert("Please fill all fields.");
                return false;
            }

            if (!email.includes("@") || !email.includes(".")) {
                alert("Please enter a valid email.");
                return false;
            }

            return true;
        }

        function showSuccessPopup() {
            var popup = document.getElementById("successPopup");
            popup.classList.add("show");

            setTimeout(function () {
                popup.classList.remove("show");
            }, 5000);
        }
    </script>
</head>

<body>

<form id="form1" runat="server">

    <div id="successPopup" class="popup-success">
        ✅ Message sent successfully.
    </div>

    <div class="navbar">

        <div class="logo">
            Narrativa
        </div>

        <div class="nav-links">
            <a href="Home.aspx">Home</a>
            <a href="About.aspx">About</a>
            <a href="Books.aspx">Books</a>
            <a href="MyLibrary.aspx">My Library</a>
            <a href="Contact.aspx">Contact</a>
            <a href="Login.aspx">Login</a>
        </div>

    </div>

    <div class="page">

        <div class="contact-box">

            <div class="badge">
                Contact Narrativa
            </div>

            <h1>
                Get In Touch
            </h1>

            <p class="subtitle">
                Have questions, feedback, or suggestions? Send us a message and we’ll get back to you soon.
            </p>

            <label>Full Name</label>
            <asp:TextBox ID="txtFullName" runat="server" CssClass="input"></asp:TextBox>

            <label>Email Address</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email"></asp:TextBox>

            <label>Message Category</label>
            <asp:CheckBoxList ID="cblMessageType"
                runat="server"
                CssClass="check-list"
                RepeatDirection="Horizontal">

                <asp:ListItem Text="Complaint" Value="Complaint"></asp:ListItem>
                <asp:ListItem Text="Question" Value="Question"></asp:ListItem>
                <asp:ListItem Text="Suggestion" Value="Suggestion"></asp:ListItem>

            </asp:CheckBoxList>

            <label>Subject</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="input"></asp:TextBox>

            <label>Message</label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="textarea" TextMode="MultiLine"></asp:TextBox>

            <asp:Button ID="btnSend"
                runat="server"
                Text="Send Message"
                CssClass="btn"
                OnClientClick="return validateContact();"
                OnClick="btnSend_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>

        </div>

    </div>

    <div class="footer">
        © 2026 Narrativa — Smart Digital Library
    </div>

</form>

</body>
</html>