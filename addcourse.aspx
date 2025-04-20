<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addcourse.aspx.cs" Inherits="WebApplication1.addcourse" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div> 
             <h4>Major</h4><asp:TextBox ID="major" runat="server"></asp:TextBox>
            <h4>semester</h4><asp:TextBox ID="semesterr" runat="server"></asp:TextBox>  
            <h4>credit hours</h4> <asp:TextBox ID="credit_hours" runat="server"></asp:TextBox> 
            <h4>Name</h4> <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <h4>is_offered<asp:TextBox ID="is_offered" runat="server"></asp:TextBox></h4>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
