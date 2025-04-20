    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addsemester.aspx.cs" Inherits="WebApplication1.addsemester" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            start_date
            <asp:TextBox ID="start_date" runat="server" ></asp:TextBox>
            end_date
            <asp:TextBox ID="end_date" runat="server" ></asp:TextBox>
            code
            <asp:TextBox ID="code" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
            <br />
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
