<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLinkAdvisor.aspx.cs" Inherits="GUC_SYSTEM.StudentLinkAdvisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div> 
            StudentID
            <asp:TextBox ID="studentID" runat="server"></asp:TextBox> 
            AdvisorID 
            <asp:TextBox ID="advisorID" runat="server"></asp:TextBox> 
            <asp:Button ID="Button1" runat="server" Text="Link" OnClick="Button1_Click" /> 
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
