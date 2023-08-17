<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="EventBookingSystem.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header events-page-header" style="background-image: url(images/events-page-header-bg.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <header class="entry-header">
                        <h1 class="entry-title">Events.</h1>
                    </header>
                </div>
            </div>
        </div>
    </div>
    </Header>
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-3">
                <asp:TextBox TextMode="Date" ID="txtDate" runat="server" style="width: 100%; padding: 12px 24px; margin: 0 6px 30px; border: 1px solid #e5e5e5; font-size: 16px; outline: none; background: #f3f8f9; color: #232127;" />
            </div>
            <div class="col-12 col-md-3">
                <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" class="btn gradient-bg" Text="Search Events" />
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row" style="margin-bottom: 20px">
            <asp:Repeater ID="rptEvents" runat="server">
                <ItemTemplate>
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="next-event-wrap" style="margin-top: 96px; text-align: center;">
                            <figure style="position: relative;">
                                <a href="EventDetails.aspx?id=<%#Eval("Id") %>">
                                    <asp:Image ID="imgHome" runat="server" ImageUrl='<%# Eval("ImageUrl", "images/{0}") %>' alt="1" Style="width: 100%" /></a>

                                <div class="event-rating" style="display: flex; justify-content: center; align-items: center; position: absolute; top: -32px; left: 32px; width: 78px; height: 78px; border: 2px solid #fff; border-radius: 50%; font-size: 22px; font-weight: bold; color: #fff; background: #9a28d7;">
                                    <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price", "$ {0}") %>' />
                                </div>
                            </figure>

                            <header class="entry-header">
                                <h3 class="entry-title">
                                    <asp:Label ID="lblNmae" runat="server" Text='<%#Eval("Title") %>' />
                                    in
                                    <asp:Label ID="lblCity" runat="server" Text='<%#Eval("City") %>' /></h3>

                                <div class="posted-date" style="font-size: 18px; font-weight: bold; text-transform: uppercase; color: #9a28d7">
                                    <span>
                                        <asp:Label ID="lbl" runat="server" Text='<%#Eval("BeginOn") %>' /></span>
                                </div>
                            </header>

                            <div class="entry-content">
                                <p>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Description") %>' />
                                </p>
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

</asp:Content>
