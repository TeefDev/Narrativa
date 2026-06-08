<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBooks.aspx.cs" Inherits="Narrativa.Pages.ManageBooks" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Books - Narrativa</title>

    <style>
        *{box-sizing:border-box}

        body{
            margin:0;
            font-family:'Segoe UI',sans-serif;
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
            font-size:38px;
            font-weight:900;
            color:#f2c879;
        }

        .nav-links a{
            color:#fff;
            text-decoration:none;
            margin-left:22px;
            font-weight:700;
        }

        .container{
            width:92%;
            max-width:1300px;
            margin:50px auto;
        }

        .card{
            background:white;
            padding:35px;
            border-radius:35px;
            box-shadow:0 15px 40px rgba(0,0,0,.08);
            margin-bottom:40px;
        }

        .title{
            font-size:45px;
            margin-bottom:10px;
            font-weight:900;
        }

        .subtitle{
            color:#7b5a45;
            margin-bottom:35px;
        }

        .grid{
            display:grid;
            grid-template-columns:1fr 1fr;
            gap:25px;
        }

        .field{
            margin-bottom:22px;
        }

        .field label{
            display:block;
            font-size:18px;
            font-weight:700;
            margin-bottom:10px;
        }

        .input,.textarea,.file{
            width:100%;
            padding:16px;
            border-radius:18px;
            border:1px solid #d8c1a6;
            font-size:16px;
            outline:none;
        }

        .textarea{
            height:130px;
            resize:none;
        }

        .radio-list{
            margin:10px 0 20px;
            font-weight:800;
            color:#5b3b2a;
        }

        .radio-list td{
            padding-right:28px;
        }

        .buttons{
            margin-top:25px;
            display:flex;
            gap:18px;
        }

        .btn{
            padding:16px 35px;
            border:none;
            border-radius:18px;
            font-size:18px;
            font-weight:800;
            cursor:pointer;
        }

        .btn-add{background:#a96f49;color:white}
        .btn-update{background:#2b2d3c;color:white}
        .btn-clear{background:#ead8be;color:#2b1d14}

        .message{
            display:block;
            margin-top:20px;
            font-size:17px;
            font-weight:700;
            color:#8b5e34;
        }

        .table{
            width:100%;
            border-collapse:collapse;
            border-radius:25px;
            overflow:hidden;
        }

        .table th{
            background:#2b2d3c;
            color:#f2c879;
            padding:18px;
        }

        .table td{
            background:white;
            padding:18px;
            text-align:center;
            border-bottom:1px solid #eee;
        }

        .book-cover{
            width:70px;
            height:90px;
            object-fit:cover;
            border-radius:10px;
        }

        .action-btn{
            border:none;
            padding:10px 18px;
            border-radius:12px;
            font-weight:700;
            cursor:pointer;
        }

        .edit-btn{background:#2b2d3c;color:white}
        .delete-btn{background:#c95b5b;color:white}
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
            <a href="ManageMessages.aspx">Messages</a><a href="Home.aspx">View Site</a>
            <a href="Login.aspx">Logout</a>
        </div>
    </div>

    <div class="container">

        <div class="card">

            <div class="title">Manage Books</div>
            <div class="subtitle">Add, update, and manage Narrativa books.</div>

            <asp:HiddenField ID="hfBookID" runat="server" />

            <div class="grid">

                <div class="field">
                    <label>Book Title</label>
                    <asp:TextBox ID="txtBookTitle" runat="server" CssClass="input"></asp:TextBox>
                </div>

                <div class="field">
                    <label>Author Name</label>
                    <asp:TextBox ID="txtAuthor" runat="server" CssClass="input"></asp:TextBox>
                </div>

                <div class="field">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Category" Value="" />
                    <asp:ListItem Text="Novel" Value="Novel" />
                    <asp:ListItem Text="Science" Value="Science" />
                    <asp:ListItem Text="History" Value="History" />
                    <asp:ListItem Text="Technology" Value="Technology" />
                </asp:DropDownList>

                <div class="field">
                    <label>Book Type</label>

                    <asp:RadioButtonList ID="rblBookType"
                        runat="server"
                        CssClass="radio-list"
                        RepeatDirection="Horizontal">

                        <asp:ListItem Text="PDF" Value="PDF" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="EPUB" Value="EPUB"></asp:ListItem>
                        <asp:ListItem Text="AudioBook" Value="AudioBook"></asp:ListItem>

                    </asp:RadioButtonList>
                </div>

                <div class="field">
                    <label>Publish Date</label>
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="input"></asp:TextBox>
                </div>

                <div class="field">
                    <label>Copies</label>
                    <asp:TextBox ID="txtCopies" runat="server" CssClass="input"></asp:TextBox>
                </div>

            </div>

            <div class="field">
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="textarea"></asp:TextBox>
            </div>

            <div class="field">
                <label>Book Cover</label>
                <asp:FileUpload ID="fuBookCover" runat="server" CssClass="file" />
            </div>

            <div class="field">
                <label>Book File</label>
                <asp:FileUpload ID="fuBookFile" runat="server" CssClass="file" />
            </div>

            <div class="buttons">
                <asp:Button ID="btnAdd" runat="server" Text="Add Book" CssClass="btn btn-add" OnClick="btnAdd_Click" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update Book" CssClass="btn btn-update" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-clear" OnClick="btnClear_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

        </div>

        <div class="card">

            <div class="title">Books List</div>

            <asp:GridView ID="gvBooks"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table"
                OnRowCommand="gvBooks_RowCommand">

                <Columns>

                    <asp:BoundField DataField="BookID" HeaderText="ID" />

                    <asp:TemplateField HeaderText="Cover">
                        <ItemTemplate>
                            <img src='../images/<%# Eval("BookCover") %>' class="book-cover" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="BookTitle" HeaderText="Title" />
                    <asp:BoundField DataField="AuthorName" HeaderText="Author" />
                    <asp:BoundField DataField="Category" HeaderText="Category" /><asp:BoundField DataField="BookType" HeaderText="Type" />
                    <asp:BoundField DataField="Copies" HeaderText="Copies" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>

                            <asp:Button ID="btnEdit"
                                runat="server"
                                Text="Edit"
                                CssClass="action-btn edit-btn"
                                CommandName="EditBook"
                                CommandArgument='<%# Eval("BookID") %>' />

                            <asp:Button ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CssClass="action-btn delete-btn"
                                CommandName="DeleteBook"
                                CommandArgument='<%# Eval("BookID") %>' />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</form>
</body>
</html>