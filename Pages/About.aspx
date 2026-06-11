<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Narrativa.Pages.About" %>

<!DOCTYPE html>
<html>
<head runat="server">
<title>About - Narrativa</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
}

body{
font-family:'Segoe UI',sans-serif;
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
text-decoration:none;
color:white;
margin-left:20px;
font-weight:600;
}

.nav-links a:hover{
color:#f2c879;
}

.hero{
height:85vh;
display:flex;
justify-content:center;
align-items:center;
text-align:center;
padding:40px;
background:
linear-gradient(rgba(43,29,20,.75),rgba(43,29,20,.75)),
url('https://images.unsplash.com/photo-1521587760476-6c12a4b040da?auto=format&fit=crop&w=1600&q=80');
background-size:cover;
background-position:center;
}

.hero-content{
max-width:850px;
}

.hero h1{
font-size:72px;
color:white;
margin-bottom:20px;
}

.hero p{
font-size:20px;
line-height:2;
color:#f8ead5;
}

.about{
padding:100px 70px;
}

.about-container{
max-width:1200px;
margin:auto;
display:grid;
grid-template-columns:1fr 1fr;
gap:50px;
align-items:center;
}

.about-image img{
width:100%;
border-radius:30px;
box-shadow:0 20px 50px rgba(0,0,0,.15);
}

.about-text h2{
font-size:48px;
margin-bottom:25px;
}

.about-text p{
line-height:2;
color:#6b4b35;
font-size:17px;
}

.features{
padding:0 70px 100px;
}

.section-title{
text-align:center;
font-size:48px;
margin-bottom:50px;
}

.feature-grid{
display:grid;
grid-template-columns:repeat(3,1fr);
gap:25px;
max-width:1200px;
margin:auto;
}

.feature-card{
background:white;
padding:35px;
border-radius:30px;
border:1px solid #ead7bc;
box-shadow:0 15px 40px rgba(0,0,0,.08);
transition:.3s;
}

.feature-card:hover{
transform:translateY(-8px);
}

.icon{
font-size:40px;
margin-bottom:15px;
}

.feature-card h3{
margin-bottom:15px;
}

.feature-card p{
color:#6b4b35;
line-height:1.8;
}

.tech{
background:#2b1d14;
padding:100px 70px;
text-align:center;
}

.tech h2{
color:white;
font-size:48px;
margin-bottom:40px;
}

.tech-grid{
display:flex;
justify-content:center;
flex-wrap:wrap;
gap:15px;
}

.tech-item{
padding:15px 25px;
background:#f2c879;
border-radius:50px;
font-weight:700;
color:#2b1d14;
}

.footer{
padding:25px;
text-align:center;
background:#1f140d;
color:#f8ead5;
}

@media(max-width:1000px){

.about-container{
grid-template-columns:1fr;
}

.feature-grid{
grid-template-columns:1fr;
}

.hero h1{
font-size:45px;
}

.nav-links{
display:none;
}
}

</style>

</head>

<body>

<form runat="server">

<div class="navbar">
<div class="logo">Narrativa</div>

<div class="nav-links">
<a href="Home.aspx">Home</a>
<a href="About.aspx">About</a>
<a href="Books.aspx">Books</a>
<a href="MyLibrary.aspx">My Library</a>
<a href="Contact.aspx">Contact</a>
</div>
</div>

<section class="hero">

<div class="hero-content">

<h1>About Narrativa</h1>

<p>
Narrativa is a modern digital library platform designed to provide
an enjoyable reading experience through a clean interface,
organized book collections, and powerful management tools.
</p>

</div>

</section>

<section class="about">

<div class="about-container">

<div class="about-image">
<img src="https://images.unsplash.com/photo-1507842217343-583bb7270b66?auto=format&fit=crop&w=900&q=80" />
</div>

<div class="about-text">

<h2>Our Story</h2>

<p>
Narrativa was created to make books more accessible and easier
to manage through a modern web platform. The system allows users
to browse books, organize personal collections, and enjoy a smooth
digital reading journey.
</p>

<br />

<p>
The project demonstrates practical implementation of database
management, authentication systems, and user-friendly web design
using ASP.NET Web Forms and SQL Server.
</p>

</div>

</div>

</section>

<section class="features">

<h2 class="section-title">Platform Features</h2>

<div class="feature-grid">

<div class="feature-card">
<div class="icon">📚</div>
<h3>Book Catalog</h3>
<p>Explore a rich collection of books through a simple interface.</p>
</div>

<div class="feature-card">
<div class="icon">🔍</div>
<h3>Smart Search</h3>
<p>Quickly find books and content with efficient search tools.</p>
</div>

<div class="feature-card">
<div class="icon">💾</div>
<h3>My Library</h3>
<p>Save and manage favorite books in your personal collection.</p>
</div>

<div class="feature-card">
<div class="icon">👤</div>
<h3>User Accounts</h3>
<p>Secure registration and login functionality.</p>
</div>

<div class="feature-card">
<div class="icon">⚡</div>
<h3>Fast Experience</h3>
<p>Optimized navigation and responsive performance.</p>
</div>

<div class="feature-card">
<div class="icon">🛡️</div>
<h3>Secure Platform</h3>
<p>Reliable database and authentication management.</p>
</div>

</div>

</section>

<div class="footer">
© 2026 Narrativa — Digital Library Platform
</div>

</form>

</body>
</html>