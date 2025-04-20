<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentphone.aspx.cs" Inherits="GUC_SYSTEM.studentphone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Phone number
        <asp:TextBox ID="phonenum" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
