<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewpendingreq.aspx.cs" Inherits="GUC_SYSTEM.viewpendingreq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div><h2>View Pending Requests</h2>
            <p>
                <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
            </p>
            <p>
                <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
            </p>
        </div>
    </form>
</body>
</html>
