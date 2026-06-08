<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Narrativa.Pages.About" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Narrativa - About</title>

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

        .nav-links a:hover{color:#f2c879}

        .hero{
            padding:60px 70px 140px;
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
            max-width:750px;
            margin:auto;
            color:#6b4b35;
            font-size:18px;
            line-height:1.9;
        }

        .about-section{
            padding:70px;
        }

        .about-card{
            max-width:1050px;
            margin:auto;
            background:white;
            padding:40px;
            border-radius:32px;
            border:1px solid #ead7bc;
            box-shadow:0 18px 40px rgba(43,29,20,0.08);
            line-height:1.9;
            font-size:17px;
            color:#6b4b35;
        }

        .about-card h2{
            margin-top:0;
            color:#2b1d14;
            font-size:36px;
        }

        .students-section{
         padding:0 70px 90px;
         margin-top:-120px;
           }

        .section-title{
            text-align:center;
            font-size:42px;
            font-weight:900;
            margin-bottom:45px;
            color:#2b1d14;
        }

        .students-grid{
            display:grid;
            grid-template-columns:repeat(4,1fr);
            gap:25px;
        }

        .student-card{
            background:white;
            padding:35px 25px;
            border-radius:30px;
            text-align:center;
            border:1px solid #ead7bc;
            box-shadow:0 18px 40px rgba(43,29,20,0.08);
            transition:0.3s;
        }

        .student-card:hover{
            transform:translateY(-6px);
        }

        .student-number{
            width:82px;
            height:82px;
            margin:auto;
            border-radius:50%;
            background:#2b1d14;
            color:#f2c879;
            display:flex;
            justify-content:center;
            align-items:center;
            font-weight:900;
            font-size:18px;
            margin-bottom:20px;
        }

        .student-card h3{
            margin:0 0 12px;
            font-size:22px;
            color:#2b1d14;
        }

        .student-card p{
            color:#6b4b35;
            line-height:1.7;
            font-size:15px;
            margin:0;
        }

        .footer{
            text-align:center;
            padding:25px;
            background:#2b1d14;
            color:#f8ead5;
        }

        @media(max-width:1000px){
            .students-grid{grid-template-columns:1fr}
            .nav-links{display:none}
            .hero h1{font-size:42px}
        }
    </style>
</head>

<body><form id="form1" runat="server">

    <div class="navbar">
        <div class="logo">Narrativa</div>

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
        <div class="badge">About Narrativa</div>
    </section>

    <section class="about-section">
    </section>

    <section class="students-section">
        <div class="section-title">Meet Our Team</div>

        <div class="students-grid">

            <div class="student-card">
                <div class="student-number">12970</div>
                <h3>Taif M Alanazi</h3>
                <p>Narrativa Project Team Member</p>
            </div>

            <div class="student-card">
                <div class="student-number">12969</div>
                <h3>Nourah F Alsahliy</h3>
                <p>Narrativa Project Team Member</p>
            </div>

            <div class="student-card">
                <div class="student-number">13028</div>
                <h3>Jwahr Mohammed Alenezi</h3>
                <p>Narrativa Project Team Member</p>
            </div>

            <div class="student-card">
                <div class="student-number">12925</div>
                <h3>Shouq Alsayed</h3>
                <p>Narrativa Project Team Member</p>
            </div>

        </div>
    </section>

    <div class="footer">
        © 2026 Narrativa — Smart Digital Library
    </div>

</form>
</body>
</html>