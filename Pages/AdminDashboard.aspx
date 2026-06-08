<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Narrativa.Pages.AdminDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Narrativa - Admin Dashboard</title>

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

        .badge{
            display:inline-block;
            padding:10px 18px;
            border-radius:999px;
            background:#fff8ec;
            color:#8b5e34;
            border:1px solid #e1bd82;
            font-weight:800;
            margin-bottom:18px;
        }

        h1{
            margin:0 0 10px;
            font-size:46px;
        }

        .subtitle{
            color:#6b4b35;
            margin-bottom:35px;
            font-size:17px;
        }

        .stats{
            display:grid;
            grid-template-columns:repeat(4,1fr);
            gap:22px;
            margin-bottom:35px;
        }

        .stat-card{
            background:white;
            border-radius:28px;
            padding:28px;
            border:1px solid #ead7bc;
            box-shadow:0 18px 40px rgba(43,29,20,0.08);
        }

        .stat-card .icon{
            font-size:34px;
            margin-bottom:12px;
        }

        .stat-card h3{
            margin:0;
            color:#6b4b35;
            font-size:16px;
        }

        .stat-card .number{
            display:block;
            margin-top:12px;
            font-size:38px;
            font-weight:900;
            color:#2b1d14;
        }

        .actions{
            display:grid;
            grid-template-columns:repeat(5,1fr);
            gap:20px;
            margin-bottom:35px;
        }

        .action-card{
            display:block;
            background:#2b1d14;
            color:#f8ead5;
            text-decoration:none;
            padding:24px;
            border-radius:24px;
            font-weight:900;
            box-shadow:0 18px 40px rgba(43,29,20,0.18);
            transition:0.3s;
            text-align:center;
        }

        .action-card:hover{
            transform:translateY(-5px);
            color:#f2c879;
        }

        .export-box{
            background:white;
            padding:30px;
            border-radius:30px;
            border:1px solid #ead7bc;
            box-shadow:0 18px 40px rgba(43,29,20,0.08);
            margin-bottom:35px;
            display:flex;
            justify-content:space-between;
            align-items:center;
            gap:20px;
        }

        .export-box h2{
            margin:0 0 8px;
            font-size:28px;
        }

        .export-box p{
            margin:0;
            color:#6b4b35;
        }

        .export-btn{
            background:#8b5e34;
            color:white;
            border:none;
            padding:15px 30px;
            border-radius:16px;
            font-weight:900;
            cursor:pointer;
            font-size:15px;
        }

        .export-btn:hover{
            background:#6b4b35;
        }

        .table-card{
            background:white;
            padding:30px;
            border-radius:30px;border:1px solid #ead7bc;
            box-shadow:0 18px 40px rgba(43,29,20,0.08);
            margin-bottom:30px;
        }

        .table-card h2{
            margin-top:0;
            font-size:28px;
        }

        .grid{
            width:100%;
            border-collapse:collapse;
            overflow:hidden;
            border-radius:18px;
        }

        .grid th{
            background:#2b1d14;
            color:#f2c879;
            padding:14px;
            text-align:left;
        }

        .grid td{
            padding:13px;
            border-bottom:1px solid #ead7bc;
            color:#2b1d14;
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

        <div class="badge">Admin Control Panel</div>

        <h1>Dashboard</h1>
        <p class="subtitle">Manage Narrativa digital library from one place.</p>

        <div class="stats">

            <div class="stat-card">
                <div class="icon">📚</div>
                <h3>Total Books</h3>
                <asp:Label ID="lblBooks" runat="server" CssClass="number"></asp:Label>
            </div>

            <div class="stat-card">
                <div class="icon">👥</div>
                <h3>Total Users</h3>
                <asp:Label ID="lblUsers" runat="server" CssClass="number"></asp:Label>
            </div>

            <div class="stat-card">
                <div class="icon">⭐</div>
                <h3>Saved Books</h3>
                <asp:Label ID="lblUserBooks" runat="server" CssClass="number"></asp:Label>
            </div>

            <div class="stat-card">
                <div class="icon">✉️</div>
                <h3>Messages</h3>
                <asp:Label ID="lblMessages" runat="server" CssClass="number"></asp:Label>
            </div>

        </div>

        <div class="actions">
            <a class="action-card" href="ManageBooks.aspx">📘 Manage Books</a>
            <a class="action-card" href="ManageUsers.aspx">👥 Manage Users</a>
            <a class="action-card" href="ManageMessages.aspx">✉️ Messages</a>
            <a class="action-card" href="Books.aspx">🌐 View Books</a>
            <a class="action-card" href="Home.aspx">🏠 Home</a>
        </div>

        <div class="export-box">
            <div>
                <h2>Export Dashboard Report</h2>
                <p>Download a report containing the main library statistics.</p>
            </div>

           <asp:Button ID="btnExportExcel"
            runat="server"
            Text="Export Report Excel"
            CssClass="export-btn"
            OnClick="btnExportExcel_Click" />
        </div>

        <div class="table-card">
            <h2>Latest Books</h2>

            <asp:GridView ID="gvLatestBooks" runat="server"
                CssClass="grid"
                AutoGenerateColumns="False">

                <Columns>
                    <asp:BoundField DataField="BookID" HeaderText="ID" />
                    <asp:BoundField DataField="BookTitle" HeaderText="Title" />
                    <asp:BoundField DataField="AuthorName" HeaderText="Author" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="Copies" HeaderText="Copies" />
                </Columns>

            </asp:GridView>
        </div>

    </div>

    <div class="footer">
        © 2026 Narrativa — Admin Panel
    </div>

</form>
</body>
</html>