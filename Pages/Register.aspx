<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Narrativa.Pages.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Narrativa - Register</title>

    <style>

        *{
            box-sizing:border-box;
        }

        body{
            margin:0;
            font-family:'Segoe UI',Arial,sans-serif;
            background:
            linear-gradient(rgba(43,29,20,0.75),rgba(43,29,20,0.75)),
            url('../images/library-bg.jpg');
            background-size:cover;
            background-position:center;
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .card{
            width:420px;
            background:rgba(255,255,255,0.95);
            padding:40px;
            border-radius:30px;
            box-shadow:0 25px 60px rgba(0,0,0,0.25);
        }

        .logo{
            text-align:center;
            font-size:38px;
            font-weight:900;
            color:#8b5e34;
            margin-bottom:10px;
        }

        .subtitle{
            text-align:center;
            color:#6b4b35;
            margin-bottom:28px;
        }

        label{
            display:block;
            margin:15px 0 8px;
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
        }

        .btn:hover{
            background:#6b4b35;
        }

        .msg{
            display:block;
            margin-top:18px;
            text-align:center;
            color:#8b5e34;
            font-weight:800;
        }

        .link{
            text-align:center;
            margin-top:18px;
        }

        .link a{
            color:#8b5e34;
            text-decoration:none;
            font-weight:800;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="card">

        <div class="logo">
            Narrativa
        </div>

        <div class="subtitle">
            Create your reading account
        </div>

        <label>Full Name</label>
        <asp:TextBox ID="txtFullName" runat="server" CssClass="input"></asp:TextBox>

        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>

        <label>Password</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>

        <asp:Button ID="btnRegister" runat="server"
            Text="Create Account"
            CssClass="btn"
            OnClick="btnRegister_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="msg"></asp:Label>

        <div class="link">
            Already have an account?
            <a href="Login.aspx">Login</a>
        </div>

    </div>

</form>

</body>
</html>