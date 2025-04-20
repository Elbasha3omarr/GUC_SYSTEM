<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateGraduationPlan.aspx.cs" Inherits="GUC_SYSTEM.CreateGraduationPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add A Graduation Plan</h2>
            <h4>Semester Code: 
                <asp:TextBox ID="semester_code" runat="server"></asp:TextBox>
            </h4>
            <h4>expected graduation date:<asp:TextBox ID="expected_date" runat="server"></asp:TextBox>
            </h4>
            <h4>Semester Credit Hours:<asp:TextBox ID="credit_hour" runat="server"></asp:TextBox>
            </h4>
            <h4>Student ID:<asp:TextBox ID="student_id" runat="server"></asp:TextBox>
            </h4>
            <p>
                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
            </p>
        </div>
    </form>
</body>
</html>
