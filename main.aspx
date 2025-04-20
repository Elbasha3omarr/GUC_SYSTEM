<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="WebApplication5.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Button ID="Button1" runat="server" Text="graduation plan and assigned courses" OnClick="Button1_Click" /><br \ /> <br \ /> 
            <asp:Button ID="Button2" runat="server" Text="upcoming not paid installments" OnClick="Button2_Click" /><br \ /> <br \ /> 
            <asp:Button ID="Button3" runat="server" Text="courses with exam details" OnClick="Button3_Click" /><br \ /> <br \ /> 
            <asp:Button ID="Button4" runat="server" Text="Register for first makeup exam" OnClick="Button4_Click" /><br \ /> <br \ /> 
            <asp:Button ID="Button5" runat="server" Text="Register for second makeup exam" OnClick="Button5_Click" /><br \ /> <br \ /> 
            <asp:Button ID="Button6" runat="server" Text="courses with slots and instructors" OnClick="Button6_Click" /><br \ /> <br \ /> 
   <asp:Button ID="Button7" runat="server" Text="slot of certain course taught by certain instructor" OnClick="Button7_Click" /><br \ /> <br \ /> 
   <asp:Button ID="Button8" runat="server" Text="choose instructor for course " OnClick="Button8_Click" /><br \ /> <br \ /> 
            <asp:Button ID="Button9" runat="server" Text="view courses with their prerequisite" OnClick="Button9_Click" />
        </div>
    </form>
</body>
</html>
