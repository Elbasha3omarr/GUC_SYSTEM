<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="credithour_request.aspx.cs" Inherits="GUC_SYSTEM.credithour_request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            margin-left: 10px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>
            Credit Hour Request;</h2>
        <h4>
            Enter The following details:</h4>
        <p>
            Credit Hour:<asp:TextBox ID="credithour" runat="server" Width="194px"></asp:TextBox>
        </p>
        <p>
            Comment:<asp:TextBox ID="Comment" runat="server" CssClass="auto-style2" Width="206px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Send" runat="server" OnClick="Button1_Click" Text="Send" />
        </p>
    </form>
</body>
</html>
