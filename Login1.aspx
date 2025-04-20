<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="GUC_SYSTEM.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Login</h2>
            <p>UserName:</p>
            <asp:TextBox ID="Username" runat="server"></asp:TextBox>
            <br />
            <p>Password:</p>
            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
            <p>
                <asp:Button ID="Button1" runat="server" OnClick="Log_In" Text="Log In" />
                <asp:Button ID="Button2" runat="server" OnClick="Register" Text="Register" style="margin-left: 33px" />
            </p>
        </div>
    </form>
</body>
</html>
