<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Component1.aspx.cs" Inherits="WebApplication1.Component1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="advisors" Text="Advisors" /> <br \ />  
            <br \ />
            <asp:Button ID="Button2" runat="server" Text="Students with Advisors" OnClick="Button2_Click" />  <br \ />   <br \ /> 
            <asp:Button ID="Button4" runat="server" Text="pending requests" OnClick="Button4_Click" /> <br \ />  <br \ /> 
            <asp:Button ID="Button5" runat="server" Text="New Semester" OnClick="Button5_Click" /> <br \ /> <br \ /> 
            <asp:Button ID="Button6" runat="server" Text="New Course" OnClick="Button6_Click" /> <br \ /> <br \ /> 
             <asp:Button ID="Button7" runat="server"  Text="Instructor to Course in Slot" OnClick="Button7_Click" /> <br \ /> <br \ /> 
             <asp:Button ID="Button8" runat="server"  Text="Student to Advisor" OnClick="Button8_Click" /> <br \ /> <br \ /> 
             <asp:Button ID="Button9" runat="server"  Text="Student to Course with Instructor" OnClick="Button9_Click" /> <br \ /> <br \ /> 
             <asp:Button ID="Button10" runat="server"  Text="View Instructors with assigned courses" OnClick="Button10_Click" /> <br \ /> <br \ /> 
             <asp:Button ID="Button11" runat="server"  Text="All Semester with Offered Courses" OnClick="Button11_Click" /> <br \ /> <br \ /> <br \ /> 
            <asp:Button ID="Button3" runat="server" OnClick="back" Text="Back" />
        </div>
    </form>
</body>
</html>
