<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GUC_SYSTEM.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="OptionCourse" runat="server" Text="View Optional Courses" Width="295px" Height="82px" OnClick="Optional_Course" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="AvailCourse" runat="server" Text="View Available Courses" Width="295px" Height="82px" OnClick="Available_Course" />
            <br />
            <br />
            <asp:Button ID="RequirCourse" runat="server" Text="View Required Courses" Width="295px" Height="82px" OnClick="Required_Course"/>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="MissCourse" runat="server" Text="View Missing Courses" Width="295px" Height="82px" OnClick="Missed_Course" />
            <br />
            <br />
            <asp:Button ID="CourseReq" runat="server" Text="Send a Course Request" Width="295px" Height="82px" OnClick="Course_Request" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Hour" runat="server" Text="Send a Credit Hour request" Width="295px" Height="82px" OnClick="Hour_Request"/>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Add phone" OnClick="Button2_Click" />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Student Page 2" OnClick="Button1_Click" />
            <br />
            </div>
    </form>
</body>
</html>
