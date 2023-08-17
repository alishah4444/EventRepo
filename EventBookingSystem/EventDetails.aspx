<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="EventBookingSystem.EventDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header single-event-page-header" style="background-image: url(images/single-event-bg.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <header class="entry-header">
                        <h1 class="entry-title">
                            <asp:Label ID="lblName" runat="server" /></h1>
                    </header>
                </div>
            </div>
        </div>
    </div>
    </Header>
    <div class="container">
        <div class="row">
            <div class="col-12 single-event">
                <div class="event-content-wrap">
                    <header class="entry-header flex flex-wrap justify-content-between align-items-end">
                        <div class="single-event-heading">
                            <h2 class="entry-title">
                                <asp:Label ID="lblTitle2" runat="server" /></h2>

                            <div class="event-location" style="padding-left: 32px; margin-top: 12px; background: url(images/location-icon.png) no-repeat left top; }">
                                <a href="#">
                                    <asp:Label ID="lblAddress" runat="server" /></a>
                            </div>

                            <div class="event-date">
                                <asp:Label ID="lblBegin" runat="server" />
                                -
                                <asp:Label ID="lblEnd" runat="server" /></div>
                        </div>

                        <div class="buy-tickets flex justify-content-center align-items-center">
                            <a class="btn gradient-bg" href="#buy">Buy Tikets</a>
                        </div>
                    </header>

                    <figure class="events-thumbnail" style="margin-top:30px">
                        <asp:Image ID="detailImg" style="width:100%" runat="server" AlternateText="Details Image"/>
                    </figure>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="tabs">
                    <ul class="tabs-nav flex">
                        <li class="tab-nav flex justify-content-center align-items-center active" data-target="#tab_details">Details</li>
                        </ul>

                    <div class="tabs-container">
                        <div id="tab_details" class="tab-content" style="display: block;">
                            <div class="flex flex-wrap justify-content-between">
                                <div class="single-event-details">
                                    <div class="single-event-details-row">
                                        <label>Start:</label>
                                        <p><asp:Literal ID="ltrStart" runat="server" /></p>
                                        
                                    </div>

                                    <div class="single-event-details-row">
                                        <label>End:</label>
                                        <p><asp:Literal ID="ltrEnd" runat="server" /></p>
                                    </div>

                                    <div class="single-event-details-row">
                                        <label>Price:</label>
                                        <p><asp:Label ID="lblPrice" runat="server" /></p>
                                    </div>

                                    <div class="single-event-details-row">
                                        <label>Address:</label>
                                        <p> <asp:Literal ID="ltrAddress" runat="server" /></p>
                                    </div>
                                </div>

                                <div class="single-event-map">
                                    <iframe id="gmap_canvas" src="https://maps.google.com/maps?q=<%= city %>&t=&z=15&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="buy" class="row">
            <div class="col-12">
                <div class="event-tickets">
                    <div class="ticket-row flex flex-wrap justify-content-between align-items-center">
                        <div class="ticket-type flex justify-content-between align-items-center">
                            <h3 class="entry-title"><span>Basic entry</span> </h3>

                            <div class="ticket-price"><asp:Label ID="lblPrice2" runat="server" /></div>
                        </div>

                        <div class="flex align-items-center">
                            <div class="number-of-ticket flex justify-content-between align-items-center">
                                <asp:LinkButton MaintainScrollPositionOnPostBack="false" style="text-decoration:none" OnClick="lblDecrease_Click" ID="lblDescrease" runat="server" class="decrease-ticket" Text="-" />
                                <asp:Label ID="lblQuantity" runat="server" class="ticket-count" Text="1"/>
                                <asp:LinkButton MaintainScrollPositionOnPostBack="false" style="text-decoration:none" OnClick="lblIncrease_Click" ID="lblIncrease" runat="server" class="decrease-ticket" Text="+" />
                               
                            </div>

                            <asp:Button ID="btnClear" OnClick="btnClear_Click" runat="server" Text="Clear" class="clear-ticket-count"/>
                        </div>

                        <asp:Button ID="btnBuy" OnClick="btnBuyNow_Click" CssClass="btn gradient-bg" runat="server" Text="Buy Ticket"/>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
