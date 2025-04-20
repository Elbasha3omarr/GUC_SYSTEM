<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteGPCourse.aspx.cs" Inherits="GUC_SYSTEM.DeleteGPCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Delete course from a certain graduation plan in a certain semester</h2>
            <h4>Enter the follow credentials</h4>
            <h4>Student ID:<asp:TextBox ID="student_id" runat="server"></asp:TextBox>
            </h4>
            <h4>Semester Code:<asp:TextBox ID="sem_id" runat="server"></asp:TextBox>
            </h4>
            <h4>Course ID:<asp:TextBox ID="course_id" runat="server"></asp:TextBox>
            </h4>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete" />
    </form>
</body>
</html>
