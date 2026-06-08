<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="Narrativa.Pages.ManageUsers" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Narrativa - Manage Users</title>

    <style>
        *{box-sizing:border-box}

        body{
            margin:0;
            font-family:'Segoe UI',Arial,sans-serif;
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
        }

        .page{
            min-height:750px;
            padding:70px;
            background:
            radial-gradient(circle at top left, rgba(242,200,121,0.35), transparent 35%),
            linear-gradient(135deg,#f7efe3,#ead7bc);
        }

        .card{
            background:white;
            padding:35px;
            border-radius:30px;
            border:1px solid #ead7bc;
            box-shadow:0 20px 55px rgba(43,29,20,0.12);
        }

        h1{
            margin:0 0 12px;
            font-size:42px;
        }

        .subtitle{
            color:#6b4b35;
            margin-bottom:25px;
        }

        .grid{
            width:100%;
            border-collapse:collapse;
            background:white;
        }

        .grid th{
            background:#2b1d14;
            color:#f2c879;
            padding:14px;
        }

        .grid td{
            padding:13px;
            border-bottom:1px solid #ead7bc;
            text-align:center;
        }

        .grid a{
            color:#8b5e34;
            font-weight:900;
            text-decoration:none;
        }

        .message{
            display:block;
            margin-top:15px;
            color:#8b5e34;
            font-weight:900;
        }

        .footer{
            text-align:center;
            padding:25px;
            background:#2b1d14;
            color:#f8ead5;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="navbar">
        <div class="logo">Narrativa Admin</div>

        <div class="nav-links">
            <a href="AdminDashboard.aspx">Dashboard</a>
            <a href="ManageBooks.aspx">Manage Books</a>
            <a href="ManageUsers.aspx">Manage Users</a>
            <a href="ManageMessages.aspx">Messages</a>
            <a href="Home.aspx">View Site</a>
            <a href="Login.aspx">Logout</a>
        </div>
    </div>

    <div class="page">

        <div class="card">
            <h1>Manage Users</h1>
            <p class="subtitle">View and manage registered Narrativa users.</p>

            <asp:GridView ID="gvUsers" runat="server"
                CssClass="grid"
                AutoGenerateColumns="False"
                OnRowCommand="gvUsers_RowCommand">

                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="ID" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Role" HeaderText="Role" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Created At" DataFormatString="{0:yyyy-MM-dd}" />

                    <asp:ButtonField Text="Delete" CommandName="DeleteUser" ButtonType="Link" />
                </Columns>

            </asp:GridView>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>

    </div>

    <div class="footer">
        © 2026 Narrativa — Admin Panel
    </div>

</form>
</body>
</html>