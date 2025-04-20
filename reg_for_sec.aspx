<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg_for_sec.aspx.cs" Inherits="WebApplication5.reg_for_sec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             CourseID
            <asp:TextBox ID="courseid" runat="server"></asp:TextBox>
            Student current semester
            <asp:TextBox ID="semester" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Regist" OnClick="Button1_Click" />

        </div>
    </form>
</body>
</html>
