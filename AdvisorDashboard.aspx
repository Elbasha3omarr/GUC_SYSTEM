<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvisorDashboard.aspx.cs" Inherits="GUC_SYSTEM.AdvisorDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="Button1" runat="server" Text="View My Advising Students" OnClick="Button1_Click" Width="295px" Height="82px" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Add Graduation Plan For Student" Width="295px" Height="82px" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="Add Course For Graduation Plan" Width="295px" Height="82px" OnClick="Button3_Click" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" Text="Update Graduation Date" Width="295px" Height="82px" OnClick="Button4_Click" />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" Text="Delete Graduation Plan Course" Width="295px" Height="82px" OnClick="Button5_Click" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" Text="Specific Major Advising Students " Width="295px" Height="82px" OnClick="Button6_Click" />
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" Text="View All Requests" Width="295px" Height="82px" OnClick="Button7_Click" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button8" runat="server" Text="View Pending Requests" Width="295px" Height="82px" OnClick="Button8_Click" />
        <br />
        <br />
        <asp:Button ID="Button10" runat="server" Text="Approve credit hours request" Width="295px" Height="82px" OnClick="Button10_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button11" runat="server" Text="Approve courses request" Width="295px" Height="82px" OnClick="Button11_Click" />
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
