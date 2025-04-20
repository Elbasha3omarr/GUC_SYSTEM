<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addgradcourse.aspx.cs" Inherits="GUC_SYSTEM.Addgradcourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add course in Graduation Plan</h2>
            <h4>Student ID:<asp:TextBox ID="student_id" runat="server"></asp:TextBox>
            </h4>
            <h4>Semester Code:<asp:TextBox ID="semcode" runat="server"></asp:TextBox>
            </h4>
            <h4>Course Name:<asp:TextBox ID="course_name" runat="server"></asp:TextBox>
            </h4>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
    </form>
</body>
</html>
