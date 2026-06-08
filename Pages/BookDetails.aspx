<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="Narrativa.Pages.BookDetails" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Book Details</title>

    <style>

        *{
            box-sizing:border-box;
        }

        body{
            margin:0;
            font-family:'Segoe UI';
            background:#f7efe3;
            color:#2b1d14;
        }

        .navbar{
            width:100%;
            padding:22px 70px;
            background:#2b1d14;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .logo{
            font-size:34px;
            font-weight:900;
            color:#f2c879;
        }

        .nav-links a{
            color:white;
            text-decoration:none;
            margin-left:24px;
            font-weight:700;
        }

        .page{
            padding:70px;
            display:flex;
            justify-content:center;
        }

        .details-box{
            width:1150px;
            background:white;
            border-radius:35px;
            overflow:hidden;
            display:grid;
            grid-template-columns:420px 1fr;
            box-shadow:0 20px 60px rgba(0,0,0,0.08);
        }

        .left-side{
            background:#f1dfc7;
            padding:30px;
        }

        .book-image{
            width:100%;
            height:620px;
            object-fit:cover;
            border-radius:24px;
        }

        .right-side{
            padding:45px;
        }

        .category{
            display:inline-block;
            padding:10px 20px;
            border-radius:999px;
            background:#fff7ea;
            border:1px solid #e6c79c;
            color:#8b5e34;
            font-weight:800;
            margin-bottom:25px;
        }

        .title{
            font-size:50px;
            font-weight:900;
            margin-bottom:10px;
        }

        .author{
            font-size:25px;
            color:#8b5e34;
            font-weight:700;
            margin-bottom:35px;
        }

        .info{
            font-size:20px;
            margin-bottom:15px;
            color:#5c4331;
        }

        .description{
            margin-top:35px;
            line-height:2;
            color:#5c4331;
            font-size:18px;
        }

        .buttons{
            margin-top:45px;
            display:flex;
            gap:18px;
            flex-wrap:wrap;
        }

        .btn{
            padding:16px 28px;
            border-radius:18px;
            font-size:17px;
            font-weight:800;
            text-decoration:none;
            border:none;
            cursor:pointer;
            transition:0.3s;
        }

        .btn:hover{
            transform:translateY(-4px);
        }

        .btn-read{
            background:#8b5e34;
            color:white;
        }

        .btn-download{
            background:white;
            color:#8b5e34;
            border:2px solid #d9b488;
        }

        .btn-open{
            background:#2b1d14;
            color:white;
        }

        .btn-library{
            background:#f2c879;
            color:#2b1d14;
        }

        .read-badge{
            margin-top:25px;
            display:inline-block;
            padding:12px 22px;
            border-radius:999px;
            background:#e7ffe8;
            color:#1f7a33;
            font-weight:800;
            border:1px solid #9ed7a8;
        }

        .footer{
            text-align:center;
            padding:25px;
            background:#2b1d14;
            color:white;
            margin-top:50px;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <asp:HiddenField ID="hfBookFile" runat="server" />

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

        <div class="details-box">

            <div class="left-side">

                <asp:Image ID="imgBook"
                    runat="server"
                    CssClass="book-image" />

            </div>

            <div class="right-side">

                <div class="category">
                    <asp:Label ID="lblCategory" runat="server"></asp:Label>
                </div>

                <div class="title">
                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                </div>

                <div class="author">
                    By
                    <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                </div>

                <div class="info">
                    📘 Type:
                    <asp:Label ID="lblType" runat="server"></asp:Label>
                </div>

                <div class="info">
                    📅 Publish Date:
                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                </div>

                <div class="info">
                    📚 Available Copies:
                    <asp:Label ID="lblCopies" runat="server"></asp:Label>
                </div>

                <div class="description">
                    <asp:Label ID="lblDescription" runat="server"></asp:Label>
                </div>

                <div class="buttons">

                    <asp:Button ID="btnRead"
                        runat="server"
                        Text="Read Online"
                        CssClass="btn btn-read"
                        OnClick="btnRead_Click" />

                    <asp:HyperLink ID="lnkDownload"
                        runat="server"
                        CssClass="btn btn-download">
                        Download PDF
                    </asp:HyperLink>

                    <asp:Button ID="btnOpenBook"
                        runat="server"
                        Text="Open Book"
                        CssClass="btn btn-open"
                        OnClick="btnOpenBook_Click" />

                    <asp:Button ID="btnAddLibrary"
                        runat="server"
                        Text="❤ Add To My Library"
                        CssClass="btn btn-library"
                        OnClick="btnAddLibrary_Click" />

                </div>

                <asp:Panel ID="pnlRead"
                    runat="server"
                    Visible="false"
                    CssClass="read-badge">

                    ✔ You already read this book

                </asp:Panel>

            </div>

        </div>

    </div>

    <div class="footer">
        © 2026 Narrativa — Smart Digital Library
    </div>

</form>

</body>
</html>