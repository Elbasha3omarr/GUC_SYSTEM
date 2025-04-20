<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_graduationdate.aspx.cs" Inherits="GUC_SYSTEM.update_graduationdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Update Graduation Date</h2>
            <h4>Enter The credentials</h4>
            <h4>Expected Graduation Date:<asp:TextBox ID="expected_grad" runat="server"></asp:TextBox>
            </h4>
            <h4>Student ID:<asp:TextBox ID="student_id" runat="server"></asp:TextBox>
            </h4>
            <h4>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
            </h4>
        </div>
    </form>
</body>
</html>
