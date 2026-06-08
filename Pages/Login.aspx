<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Narrativa.Pages.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Narrativa - Login</title>

    <style>
        *{
            box-sizing:border-box;
        }

        body{
            margin:0;
            font-family:'Segoe UI',Arial,sans-serif;
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            background:
                linear-gradient(rgba(43,29,20,0.72),rgba(43,29,20,0.72)),
                url('../images/library-bg.jpg');
            background-size:cover;
            background-position:center;
        }

        .card{
            width:420px;
            background:rgba(255,255,255,0.96);
            padding:42px;
            border-radius:30px;
            box-shadow:0 25px 60px rgba(0,0,0,0.25);
        }

        .logo{
            text-align:center;
            font-size:40px;
            font-weight:900;
            color:#8b5e34;
            margin-bottom:8px;
        }

        .subtitle{
            text-align:center;
            color:#6b4b35;
            margin-bottom:30px;
        }

        label{
            display:block;
            margin:16px 0 8px;
            font-weight:800;
            color:#2b1d14;
        }

        .input{
            width:100%;
            padding:14px 16px;
            border-radius:15px;
            border:1px solid #d6b17a;
            background:#fffaf3;
            outline:none;
            font-size:15px;
        }

        .input:focus{
            border-color:#8b5e34;
        }

        .btn{
            width:100%;
            margin-top:25px;
            padding:15px;
            border:none;
            border-radius:16px;
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

        .msg{
            display:block;
            margin-top:18px;
            text-align:center;
            color:#b91c1c;
            font-weight:800;
        }

        .link{
            text-align:center;
            margin-top:20px;
            color:#6b4b35;
        }

        .link a{
            color:#8b5e34;
            text-decoration:none;
            font-weight:900;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="card">

        <div class="logo">Narrativa</div>

        <div class="subtitle">
            Welcome back to your library
        </div>

        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>

        <label>Password</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>

        <asp:Button ID="btnLogin" runat="server"
            Text="Login"
            CssClass="btn"
            OnClick="btnLogin_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="msg"></asp:Label>

        <div class="link">
            Don’t have an account?
            <a href="Register.aspx">Create Account</a>
        </div>

    </div>

</form>
</body>
</html>