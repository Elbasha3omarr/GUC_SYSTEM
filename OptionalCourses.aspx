<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OptionalCourses.aspx.cs" Inherits="GUC_SYSTEM.OptionalCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <h2>Optional Courses</h2>
        <h4>Enter The Required Credentials</h4>
        <div>
            Current Semester Code<asp:TextBox ID="sem_code" runat="server" style="margin-left: 14px" Width="258px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Enter" Width="235px" />
            <br />
            <br />
        </div>
        <div>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
    </form>
    <br />
</body>
</html>
