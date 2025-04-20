<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Choose_instructor_Forcourse.aspx.cs" Inherits="WebApplication5.Choose_instructor_Forcourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            InstructorID
            <asp:TextBox ID="InstructorID" runat="server"></asp:TextBox>
            CourseID
            <asp:TextBox ID="CourseID" runat="server"></asp:TextBox>
            Semester code 
            <asp:TextBox ID="Semester_code" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="choose" OnClick="Button1_Click" />


        </div>
    </form>
</body>
</html>
