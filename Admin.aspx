<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication1.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div> 
            <asp:Label ID="Label1" runat="server" Text="Sign in to The Addving System"></asp:Label> <br \ /> 
            <br \ />
            <asp:Label ID="Label4" runat="server" Text="Your login information will be sent securely."></asp:Label> <br \ /> <br \ /> 
            <asp:Label ID="Label2" runat="server" Text="Admin ID:"></asp:Label>   <asp:TextBox ID="admin_id" runat="server"></asp:TextBox>  <br \ /> 
            <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>  <asp:TextBox ID="password" runat="server"></asp:TextBox>   <br \ /> 
            <br \ /> 
            <asp:Button ID="signin" runat="server" OnClick="enter" Text="ENTER" />
        </div>
    </form>
</body>
</html>
