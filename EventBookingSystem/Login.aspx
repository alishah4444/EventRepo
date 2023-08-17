<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventBookingSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="icon" href="Images/logo.png">
    <link href="Content/login.css" rel="stylesheet" />
</head>
<body>
    <div class="login-page">
        <div class="form">
            <form class="login-form" id="form1" runat="server">
                <asp:TextBox ID="txtEmail" required runat="server" MaxLength="25" TextMode="Email" placeholder="email address" />
                <asp:RegularExpressionValidator ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic" ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Email not valid" />
                <asp:TextBox ID="txtPassword" minlength="6" MaxLength="10" required runat="server" TextMode="Password" placeholder="password" />
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                 <p class="message">Not registered? <a href="Register.aspx">Create an account</a></p>
            </form>
        </div>
    </div>
</body>
</html>
