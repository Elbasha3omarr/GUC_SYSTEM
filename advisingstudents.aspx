<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="advisingstudents.aspx.cs" Inherits="GUC_SYSTEM.advisingstudents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 39px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>View Advising Students</h2>
            <h4>View all students assigned to him/her from a certain major along with their current course</h4>
            <h4>Enter The Following Credentials</h4>
            <h4>Major:<asp:TextBox ID="Major" runat="server" CssClass="auto-style1"></asp:TextBox>
            </h4>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Enter" OnClick="Button1_Click" />
        <br />
        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
