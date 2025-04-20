<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AvailableCourse.aspx.cs" Inherits="GUC_SYSTEM.AvailableCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        Enter The Required Credentials
        <div>
            <br />
            Current Semester Code<asp:TextBox ID="sem_code2" runat="server" style="margin-left: 14px" Width="258px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Enter" Width="235px" />
            <br />
            <br />
        </div>
        <div>
            <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
        </div>
    </form>
    <br />
</body>
</html>
