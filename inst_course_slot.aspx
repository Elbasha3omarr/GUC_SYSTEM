<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inst_course_slot.aspx.cs" Inherits="WebApplication1.inst_course_slot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>  
                     CourseID <asp:TextBox ID="course" runat="server"></asp:TextBox> 
                       InstructorID<asp:TextBox ID="instructor" runat="server"></asp:TextBox> 
                         SlotID<asp:TextBox ID="slot" runat="server"></asp:TextBox> 
                 <asp:Button ID="Link" runat="server" Text="Button" OnClick="Link_Click" />

                        <br />

                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
