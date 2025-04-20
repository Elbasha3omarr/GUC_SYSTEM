<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApproveCourseReq.aspx.cs" Inherits="GUC_SYSTEM.ApproveCourseReq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h2>Approve Course Request</h2>
             <h4>Request ID:<asp:TextBox ID="req_id" runat="server"></asp:TextBox>
             </h4>
             <h4>Current Semester Code:<asp:TextBox ID="sem_code" runat="server"></asp:TextBox>
             </h4>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Check" />
    </form>
</body>
</html>
