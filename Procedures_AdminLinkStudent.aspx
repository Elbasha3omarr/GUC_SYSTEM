<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Procedures_AdminLinkStudent.aspx.cs" Inherits="WebApplication6.Procedures_AdminLinkStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div> 
                       Course ID
            <asp:TextBox ID="courseid" runat="server"></asp:TextBox> 
            Instructor ID
            <asp:TextBox ID="instructorid" runat="server"></asp:TextBox>  
            Student ID 
            <asp:TextBox ID="studentid" runat="server"></asp:TextBox> 
            Semester Code
            <asp:TextBox ID="semstercode" runat="server"></asp:TextBox> 
            <asp:Button ID="Button1" runat="server" Text="Link" OnClick="Button1_Click" /> 
                       <br />
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
