<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="slots_of certain course_inst.aspx.cs" Inherits="WebApplication5.slots_of_certain_course_inst" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            courseID
            <asp:TextBox ID="courseID" runat="server"></asp:TextBox>
            InstructorID
            <asp:TextBox ID="InstructorID" runat="server"></asp:TextBox>

            <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
