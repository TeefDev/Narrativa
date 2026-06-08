<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyLibrary.aspx.cs" Inherits="Narrativa.Pages.MyLibrary" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Narrativa - My Library</title>

    <style>

        *{
            box-sizing:border-box;
        }

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

        .nav-links a:hover{
            color:#f2c879;
        }

        .hero{
            padding:80px 70px;
            text-align:center;
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

        .hero h1{
            font-size:56px;
            margin:0 0 15px;
        }

        .hero p{
            color:#6b4b35;
            font-size:18px;
        }

        .books-section{
            padding:60px 70px 90px;
        }

        .books-grid{
            display:flex;
            flex-wrap:wrap;
            gap:28px;
        }

        .book-card{
            width:300px;
            background:white;
            border-radius:28px;
            padding:22px;
            border:1px solid #ead7bc;
            box-shadow:0 18px 40px rgba(43,29,20,0.08);
            transition:0.3s;
        }

        .book-card:hover{
            transform:translateY(-6px);
        }

        .book-cover{
            width:100%;
            height:220px;
            object-fit:cover;
            border-radius:18px;
            margin-bottom:15px;
        }

        .category{
            display:inline-block;
            padding:7px 12px;
            border-radius:999px;
            background:#fff8ec;
            color:#8b5e34;
            border:1px solid #e1bd82;
            font-size:12px;
            font-weight:800;
            margin-bottom:12px;
        }

        .book-card h3{
            font-size:24px;
            margin:0 0 8px;
        }

        .author{
            color:#8b5e34;
            font-weight:700;
            margin-bottom:12px;
        }

        .desc{
            color:#6b4b35;
            line-height:1.7;
            font-size:14px;
            min-height:65px;
        }

        .buttons{
            display:flex;
            gap:12px;
            margin-top:18px;
        }

        .btn{
            flex:1;
            padding:13px;
            border-radius:14px;
            text-align:center;
            text-decoration:none;
            font-weight:900;
            border:none;
            cursor:pointer;
        }

        .btn-read{
            background:#8b5e34;
            color:white;
        }

        .btn-remove{
            background:#2b1d14;
            color:white;
        }

        .empty{
            display:block;
            text-align:center;
            font-size:20px;
            color:#8b5e34;
            margin-top:40px;
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

    <div class="navbar"><div class="logo">
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

    <section class="hero">

        <div class="badge">
            My Reading Collection
        </div>

        <h1>
            My Library
        </h1>

        <p>
            Your saved books in one beautiful place.
        </p>

    </section>

    <section class="books-section">

        <div class="books-grid">

            <asp:Repeater ID="rptMyLibrary" runat="server">

                <ItemTemplate>

                    <div class="book-card">

                        <img src='<%# Eval("BookCover") %>' class="book-cover" />

                        <div class="category">
                            <%# Eval("Category") %>
                        </div>

                        <h3>
                            <%# Eval("BookTitle") %>
                        </h3>

                        <div class="author">
                            By <%# Eval("AuthorName") %>
                        </div>

                        <div class="desc">
                            <%# Eval("Description") %>
                        </div>

                        <div class="buttons">

                            <a href='<%# Eval("BookFile") %>'
                               target="_blank"
                               class="btn btn-read">

                               Read Book

                            </a>

                            <asp:LinkButton ID="btnRemove"
                                runat="server"
                                CssClass="btn btn-remove"
                                Text="Remove"
                                CommandArgument='<%# Eval("UserBookID") %>'
                                OnCommand="btnRemove_Command">
                            </asp:LinkButton>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

        <asp:Label ID="lblEmpty" runat="server" CssClass="empty"></asp:Label>

    </section>

    <div class="footer">
        © 2026 Narrativa — Smart Digital Library
    </div>

</form>

</body>
</html>