<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Narrativa.Pages.Home" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Narrativa - Digital Library</title>

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
            min-height:620px;
            display:grid;
            grid-template-columns:1.1fr 0.9fr;
            align-items:center;
            gap:40px;
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

        .hero h1{
            font-size:64px;
            line-height:1.1;
            margin:0 0 20px;
            color:#2b1d14;
        }

        .hero p{
            font-size:18px;
            color:#6b4b35;
            line-height:1.8;
            max-width:580px;
        }

        .hero-actions{
            margin-top:30px;
            display:flex;
            gap:15px;
        }

        .btn{
            display:inline-block;
            padding:15px 28px;
            border-radius:16px;
            text-decoration:none;
            font-weight:900;
            transition:0.3s;
        }

        .btn-primary{
            background:#8b5e34;
            color:white;
            box-shadow:0 14px 30px rgba(139,94,52,0.25);
        }

        .btn-primary:hover{
            transform:translateY(-3px);
        }

        .btn-secondary{
            background:white;
            color:#8b5e34;
            border:1px solid #d6b17a;
        }

        .book-showcase{
            position:relative;
            height:450px;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .book-card{
            width:230px;
            height:340px;
            border-radius:24px;
            position:absolute;
            padding:18px;
            color:white;
            overflow:hidden;
            box-shadow:0 25px 60px rgba(43,29,20,0.25);
        }

        .book-card h3{
            margin-top:12px;
            margin-bottom:10px;
            font-size:24px;
            color:#f2c879;
        }

        .book-card p{
            color:#f8ead5;
            font-size:14px;
            line-height:1.7;
        }

        .book-one{
            transform:rotate(-10deg) translateX(-110px);
            background:linear-gradient(160deg,#5b341c,#8b5e34);
        }

        .book-two{
            transform:translateY(-20px);
            background:linear-gradient(160deg,#1f2937,#2b1d14);
            z-index:2;
        }

        .book-three{
            transform:rotate(10deg) translateX(110px);
            background:linear-gradient(160deg,#8b5e34,#d59a52);
        }

        .book-img{
            width:100%;
            height:170px;
            object-fit:cover;
            border-radius:16px;}

        .section-title{
            text-align:center;
            padding:40px 20px 10px;
        }

        .section-title h2{
            font-size:42px;
            margin-bottom:10px;
        }

        .section-title p{
            color:#6b4b35;
            font-size:17px;
        }

        .features{
            padding:60px 70px 90px;
            display:grid;
            grid-template-columns:repeat(3,1fr);
            gap:25px;
        }

        .feature{
            background:white;
            padding:32px;
            border-radius:28px;
            border:1px solid #ead7bc;
            box-shadow:0 18px 40px rgba(43,29,20,0.08);
            transition:0.3s;
        }

        .feature:hover{
            transform:translateY(-6px);
        }

        .feature .icon{
            font-size:40px;
            margin-bottom:15px;
        }

        .feature h3{
            margin:0 0 14px;
            color:#2b1d14;
            font-size:28px;
        }

        .feature p{
            color:#6b4b35;
            line-height:1.8;
            font-size:15px;
        }

        .footer{
            text-align:center;
            padding:25px;
            background:#2b1d14;
            color:#f8ead5;
        }

        @media(max-width:1000px){

            .hero{
                grid-template-columns:1fr;
            }

            .features{
                grid-template-columns:1fr;
            }

            .nav-links{
                display:none;
            }

            .hero h1{
                font-size:45px;
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

        <div>

            <div class="badge">
                Smart Digital Library
            </div>

            <h1>
                Read smarter.<br />
                Explore deeper.
            </h1>

            <p>
                Narrativa is a modern online library system where users can discover books,
                borrow titles, manage reading activities, and enjoy a premium digital experience.
            </p>

            <div class="hero-actions">

                <a class="btn btn-primary" href="Books.aspx">
                    Explore Books
                </a>

                <a class="btn btn-secondary" href="Register.aspx">
                    Create Account
                </a>

            </div>

        </div>

        <div class="book-showcase">

            <div class="book-card book-one">

                <img src="../images/1.jpg" class="book-img" />

                <h3>Atomic Habits</h3>

                <p>
                    Build better habits and improve your daily life.
                </p>

            </div>

            <div class="book-card book-two">

                <img src="../images/2.jpg" class="book-img" />

                <h3>Rich Dad Poor Dad</h3>

                <p>
                    Learn financial thinking and smart money habits.
                </p>

            </div>

            <div class="book-card book-three">

                <img src="../images/3.jpg" class="book-img" />

                <h3>The Alchemist</h3>

                <p>
                    A magical story about dreams and destiny.
                </p>

            </div>

        </div>

    </section>

    <div class="section-title">

        <h2>
            Why Narrativa?
        </h2>

        <p>
            A premium reading experience for book lovers.
        </p>

    </div>

    <section class="features">

        <div class="feature"><div class="icon">📚</div>

            <h3>Browse Books</h3>

            <p>
                Explore hundreds of books with categories, descriptions,
                authors, and beautiful cover previews.
            </p>

        </div>

        <div class="feature">

            <div class="icon">📝</div>

            <h3>Borrow Online</h3>

            <p>
                Borrow books online easily and manage your reading
                journey with a smooth and modern system.
            </p>

        </div>

        <div class="feature">

            <div class="icon">📖</div>

            <h3>Popular Books</h3>

            <p>
                Discover trending novels, educational books,
                and inspiring collections for every reader.
            </p>

        </div>

    </section>

    <div class="footer">
        © 2026 Narrativa — Smart Digital Library
    </div>

</form>

</body>
</html>