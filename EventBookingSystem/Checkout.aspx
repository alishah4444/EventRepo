<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="EventBookingSystem.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .col-25 {
            -ms-flex: 25%; /* IE10 */
            flex: 25%;
        }

        .col-50 {
            -ms-flex: 50%; /* IE10 */
            flex: 50%;
        }

        .col-75 {
            -ms-flex: 75%; /* IE10 */
            flex: 75%;
        }

        .col-25,
        .col-50,
        .col-75 {
            padding: 0 16px;
        }

        .containerr {
            background-color: #f2f2f2;
            padding: 5px 20px 15px 20px;
            border: 1px solid lightgrey;
            border-radius: 3px;
        }

        input[type=text], input[type=number],select {
            width: 100%;
            margin-bottom: 20px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        label {
            margin-bottom: 10px;
            display: block;
        }

        .icon-container {
            margin-bottom: 20px;
            padding: 7px 0;
            font-size: 24px;
        }

        .btn {
            background-color: #04AA6D;
            color: white;
            padding: 12px;
            margin: 10px 0;
            border: none;
            width: 100%;
            border-radius: 3px;
            cursor: pointer;
            font-size: 17px;
        }

            .btn:hover {
                background-color: #45a049;
            }

        a {
            color: #2196F3;
        }

        hr {
            border: 1px solid lightgrey;
        }

        span.price {
            float: right;
            color: grey;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header single-event-page-header" style="background-image: url(images/single-event-bg.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <header class="entry-header">
                        <h1 class="entry-title">
                            <asp:Label ID="lblName" runat="server" Text="Checkout" /></h1>
                    </header>
                </div>
            </div>
        </div>
    </div>
    </Header>
    <br />
    <div class="col-25">
        <div class="containerr">
            <h4>Your Order <span class="price" style="color: black"><i class="fa fa-shopping-cart"></i></span></h4>
            <p>
                <asp:Label ID="lblTitle" runat="server" Text="Checkout" />
                <asp:Label class="price" ID="lblPrice" runat="server" Text="Checkout" />
            </p>
            <p>Quantity<asp:Label class="price" ID="lblQuantity" runat="server" Text="Checkout" /></p>
            <hr>
            <p>Total
                <asp:Label CssClass="price" ID="lblTotal" runat="server" Text="Checkout" /></p>
        </div>
    </div>
    <br />
    <div class="containerr">
        <h3>Payment</h3>
        <label for="fname">Accepted Cards</label>
        <div class="icon-container">
            <i class="fa fa-cc-visa" style="color: navy;"></i>
            <i class="fa fa-cc-amex" style="color: blue;"></i>
            <i class="fa fa-cc-mastercard" style="color: red;"></i>
            <i class="fa fa-cc-discover" style="color: orange;"></i>
        </div>
        <div class="row">
            <div class="col-50">
                <h3>Billing Address</h3>
                <label for="fname"><i class="fa fa-user"></i>Full Name</label>
                <input type="text" required disabled id="fname" value="<%=Session["uName"].ToString() %>" name="firstname" placeholder="John M. Doe">
                <label for="email"><i class="fa fa-envelope"></i>Email</label>
                <input type="text" required disabled id="email" value="<%=Session["uEmail"].ToString() %>" name="email" placeholder="john@example.com">
            </div>

            <div class="col-50">

                <label for="cname">Name on Card</label>
                <input type="text" id="cname" required maxlength="20" name="cardname" placeholder="John More Doe">
                <label for="ccnum">Credit card number</label>
                <input type="text" pattern="^[0-9]*$" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="ccnum" required minlength="16" maxlength="16" name="cardnumber" placeholder="1111-2222-3333-4444">
                <label for="expmonth">Exp Month</label>
                <select>
                    <option value="01">January</option>
                    <option value="02">February </option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <div class="row">
                    <div class="col-50">
                        <label for="expyear">Exp Year</label>
                        <select>
                            <option value="16">2023</option>
                            <option value="17">2024</option>
                            <option value="18">2025</option>
                            <option value="19">2026</option>
                            <option value="20">2027</option>
                            <option value="21">2028</option>
                            <option value="18">2029</option>
                            <option value="19">2030</option>
                            <option value="20">2031</option>
                            <option value="21">2032</option>
                        </select>
                    </div>
                    <div class="col-50">
                        <label for="cvv">CVV</label>
                        <input type="text" pattern="^[0-9]*$" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required minlength="3" maxlength="3" id="cvv" name="cvv" placeholder="352">
                    </div>
                </div>
            </div>

        </div>
        <asp:Button OnClick="btnCheckOut_Click" ID="btnCheckout" CssClass="btn gradient-bg" runat="server" Text="Continue to checkout" />

    </div>
</asp:Content>
