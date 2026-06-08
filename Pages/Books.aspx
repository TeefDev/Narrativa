<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Narrativa.Pages.Books" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Narrativa - Books</title>

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
            letter-spacing:1px;
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
            color:#2b1d14;
        }

        .hero p{
            font-size:18px;
            color:#6b4b35;
            line-height:1.8;
        }

        .books-section{
            padding:60px 70px 90px;
        }

        .books-grid{
            display:flex;
            flex-wrap:wrap;
            gap:28px;
            justify-content:flex-start;
        }

        .book-item{
            width:300px;
            background:white;
            border-radius:28px;
            padding:22px;
            border:1px solid #ead7bc;
            box-shadow:0 18px 40px rgba(43,29,20,0.08);
            transition:0.3s;
        }

        .book-item:hover{
            transform:translateY(-6px);
        }

        .book-cover{
            width:100%;
            height:220px;
            object-fit:cover;
            border-radius:18px;
            margin-bottom:15px;
            background:#ead7bc;
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

        .book-item h3{
            font-size:24px;
            margin:0 0 8px;
            color:#2b1d14;
            text-align:center;
        }

        .author{
            text-align:center;
            color:#8b5e34;
            font-weight:700;
            margin-bottom:12px;
        }

        .book-info{
            color:#6b4b35;
            line-height:1.8;
            font-size:14px;
            margin-bottom:12px;
        }

        .desc{
            color:#6b4b35;
            line-height:1.7;
            font-size:14px;
            min-height:65px;
        }

        .btn{
            display:block;
            width:100%;
            padding:14px;
            border-radius:16px;
            text-align:center;
            text-decoration:none;
            font-weight:900;
            background:#8b5e34;
            color:white;
            margin-top:15px;
            transition:0.3s;
        }

        .btn:hover{
            background:#6b4b35;
            transform:translateY(-3px);
        }

        .empty{
            display:block;
            text-align:center;font-size:20px;
            color:#8b5e34;
            margin-top:30px;
        }

        .footer{
            text-align:center;
            padding:25px;
            background:#2b1d14;
            color:#f8ead5;
        }

        @media(max-width:1000px){
            .books-grid{
                justify-content:center;
            }

            .nav-links{
                display:none;
            }

            .hero h1{
                font-size:42px;
            }
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

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

    <section class="hero">

        <div class="badge">
            Book Collection
        </div>

        <h1>
            Explore Our Books
        </h1>

        <p>
            Choose your favorite book and start your reading journey.
        </p>

    </section>

    <section class="books-section">

        <div class="books-grid">

            <asp:Repeater ID="rptBooks" runat="server">
                <ItemTemplate>

                    <div class="book-item">

                        <asp:Image ID="imgBook" runat="server"
                            ImageUrl='<%# Eval("BookCover") %>'
                            CssClass="book-cover" />

                        <div class="category">
                            <%# Eval("Category") %>
                        </div>

                        <h3>
                            <%# Eval("BookTitle") %>
                        </h3>

                        <div class="author">
                            By <%# Eval("AuthorName") %>
                        </div>

                        <div class="book-info">
                            📘 Type: <%# Eval("BookType") %><br />
                            📅 Publish Date: <%# Eval("PublishDate", "{0:yyyy-MM-dd}") %><br />
                            📦 Copies: <%# Eval("Copies") %>
                        </div>

                        <p class="desc">
                            <%# Eval("Description") %>
                        </p>

                        <a class="btn" href='BookDetails.aspx?BookID=<%# Eval("BookID") %>'>
                           Read Details
                        </a>

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