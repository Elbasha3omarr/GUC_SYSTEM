<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorLogin.aspx.cs" Inherits="GUC_SYSTEM.AdvisorLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2> Login Menu Page</h2>
        <h3>Enter The following Credentials</h3>
        <h4>Advisor ID:<asp:TextBox ID="advisor_id" runat="server"></asp:TextBox>
        </h4>
        <h4>Password:<asp:TextBox ID="Password" runat="server" CssClass="auto-style1"></asp:TextBox>
        </h4>
        <p>
            <asp:Button ID="Button2" runat="server" Text="Login" Width="89px" OnClick="Button2_Click" />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Register" OnClick="Button3_Click" />
        </p>
    </form>
</body>
</html>
