<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course_Req.aspx.cs" Inherits="GUC_SYSTEM.Course_Req" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>
            Course Request
            </h2>
        <h4>
            Enter The following details:</h4>
        <p>
            Course ID:<asp:TextBox ID="course_id" runat="server" Width="210px"></asp:TextBox>
        </p>
        <p>
            Comment:<asp:TextBox ID="Comment" runat="server" CssClass="auto-style2" Width="206px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Send" runat="server" OnClick="Button1_Click" Text="Send" />
        </p>
    </form>
</body>
</html>
