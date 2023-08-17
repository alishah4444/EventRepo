<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EventBookingSystem.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="icon" href="Images/logo.png">
    <link href="Content/login.css" rel="stylesheet" />
</head>
<body>
    <div class="login-page">
        <div class="form">
            <form id="form1" runat="server">
                <asp:TextBox ID="txtName" MaxLength="20" required runat="server" placeholder="name" />
                <asp:TextBox ID="txtEmail" required runat="server" MaxLength="25" TextMode="Email" placeholder="email address" />
                <asp:RegularExpressionValidator ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic" ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Email not valid" />
                <asp:TextBox ID="txtPassword" minlength="6" MaxLength="10" required runat="server" TextMode="Password" placeholder="password" />
                <asp:TextBox ID="txtCPassword" minlength="6" MaxLength="10" required runat="server" TextMode="Password" placeholder="confirm password" />
                <asp:CompareValidator ID="cvCPassword" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="Password does not matched" ForeColor="Red" runat="server" Display="Dynamic" />
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                <p class="message">Already registered? <a href="Login.aspx">Sign In</a></p>
            </form>
        </div>
    </div>
</body>
</html>
