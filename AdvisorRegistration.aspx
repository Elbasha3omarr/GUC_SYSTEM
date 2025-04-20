<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorRegistration.aspx.cs" Inherits="GUC_SYSTEM.AdvisorRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            margin-left: 76px;
        }
        .auto-style4 {
            margin-left: 35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Registration Menu For Advisor</h2>
            <h3>Advisor Name:<asp:TextBox ID="Advisorname" runat="server"></asp:TextBox>
            </h3>
            <h3>Password:<asp:TextBox ID="Password" runat="server" CssClass="auto-style4" Width="159px"></asp:TextBox>
            </h3>
            <h3>Email:<asp:TextBox ID="Email" runat="server" CssClass="auto-style3"></asp:TextBox>
            </h3>
            <h3>Office:<asp:TextBox ID="Office" runat="server" CssClass="auto-style3"></asp:TextBox>
            </h3>
            <p>
                <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
            &nbsp;
                <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" />
            </p>
        </div>
    </form>
</body>
</html>
