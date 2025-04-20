<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sign Up.aspx.cs" Inherits="GUC_SYSTEM.Sign_Up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <label for="txtUsername">First Name:</label>
        <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
        <br />
        Last Name:<asp:TextBox ID="Lastname" runat="server" style="margin-left: 8px" Width="158px"></asp:TextBox>
        <br />
        password:
        <asp:TextBox ID="Password" runat="server" style="margin-left: 8px" Width="158px"></asp:TextBox>
        <br />
        Faculty:<asp:TextBox ID="Faculty" runat="server" style="margin-left: 31px" Width="155px"></asp:TextBox>
        <br />
        Email:<asp:TextBox ID="Email" runat="server" style="margin-left: 43px" Width="151px"></asp:TextBox>
        <br />
        Major:<asp:TextBox ID="Major" runat="server" style="margin-left: 43px" Width="148px"></asp:TextBox>
        <br />
        Semester:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Semessterr" runat="server" Width="146px"></asp:TextBox>
        <br />
        <br />
    </div>
    <div>
        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
