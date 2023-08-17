<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="EventBookingSystem.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="swiper-container hero-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide" data-date="2018/05/01" style="background: url('images/header-bg.jpg') no-repeat">
                <div class="hero-content">
                    <div class="container">
                        <div class="row">
                            <div class="col flex flex-column justify-content-center">
                                <div class="entry-header">
                                    <h2 class="entry-title">We have the best events.
                                            <br>
                                        Get your tiket now!</h2>
                                </div>
                                <!--- .entry-header -->

                                <div class="entry-footer">
                                    <a class="btn gradient-bg" href="Events.aspx">Book events here</a>
                                </div>
                                <!-- .entry-footer" -->
                            </div>
                            <!-- .col -->
                        </div>
                        <!-- .container -->
                    </div>
                    <!-- .hero-content -->
                </div>
                <!-- .swiper-slide -->
            </div>
            <!-- .swiper-wrapper -->


        </div>
    </div>
    </Header>
    <div class="homepage-info-section">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4 col-lg-5">
                    <figure>
                        <img src="images/logo.png" alt="logo">
                    </figure>
                </div>

                <div class="col-12 col-md-8 col-lg-7">
                    <header class="entry-header">
                        <h2 class="entry-title">What is EBS and why choose our services?</h2>
                    </header>

                    <div class="entry-content">
                        <p>We provide the best events and best services for your events where you can customize everything to start your business and individuals can become enterpreouership.</p>
                    </div>

                    <footer class="entry-footer">
                        <a href="#" class="btn gradient-bg">Read More</a>
                    </footer>
                </div>
            </div>
        </div>
    </div>

    <div class="homepage-next-events">
        <div class="container">
            <div class="row">
                <div class="next-events-section-header">
                    <h2 class="entry-title">Our next events</h2>
                </div>
            </div>

            <div class="row">
                <asp:Repeater ID="rptHomePage" runat="server">
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 col-md-4">
                            <div class="next-event-wrap">
                                <figure>
                                    <a href="EventDetails.aspx?id=<%#Eval("Id") %>">
                                        <asp:Image ID="imgHome" runat="server" ImageUrl='<%# Eval("ImageUrl", "images/{0}") %>' alt="1" /></a>

                                    <div class="event-rating">
                                        <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price", "$ {0}") %>' /></div>
                                </figure>

                                <header class="entry-header">
                                    <h3 class="entry-title">
                                        <asp:Label ID="lblNmae" runat="server" Text='<%#Eval("Title") %>' />
                                        in
                                        <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>' /></h3>

                                    <div class="posted-date"><span>
                                        <asp:Label ID="lbl" runat="server" Text='<%#Eval("BeginOn") %>' /></span></div>
                                </header>

                                <div class="entry-content">
                                    <p>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Description") %>' /></p>
                                </div>

                                <footer class="entry-footer">
                                    <asp:LinkButton OnClick="lbEventId_Click" ID="lbEventId" class="btn gradient-bg" runat="server" CommandArgument='<%#Eval("Id") %>' Text="Buy Ticket" />
                                </footer>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>

</asp:Content>
