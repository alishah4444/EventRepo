<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="EventBookingSystem.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-4">
            <asp:TextBox ID="txtName" required MaxLength="25" class="form-control" runat="server" placeholder="Event Name" />
        </div>
        <div class="col-lg-4">
            <asp:FileUpload ID="fuEventImage" accept=".png, .jpg, .jpeg" required class="form-control" runat="server" placeholder="Event Image" />
        </div>
        <div class="col-lg-4">
            <asp:TextBox ID="txtPrice" TextMode="Number" required MaxLength="5" class="form-control" runat="server" placeholder="Event Price" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col">
            <asp:TextBox ID="txtDescription" TextMode="MultiLine" required minlength="10" class="form-control" runat="server" placeholder="Event description" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col">
            <label class="mr-sm-2" for="inlineFormCustomSelect">Event Begin at</label>
            <asp:TextBox ID="txtBeginAt" required TextMode="DateTimeLocal" class="form-control" runat="server" />
        </div>
        <div class="col">
            <label class="mr-sm-2" for="inlineFormCustomSelect">Event Finish at</label>
            <asp:TextBox ID="txtFinishAt" required TextMode="DateTimeLocal" class="form-control" runat="server" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-lg-4">
            <asp:TextBox ID="txtAddress" required MaxLength="75" class="form-control" runat="server" placeholder="Event Address" />
        </div>
        <div class="col-lg-4">
            <asp:TextBox ID="txtCity" required MaxLength="50" class="form-control" runat="server" placeholder="Event City" />
        </div>
         <div class="col-lg-4">
            <asp:TextBox ID="txtZip" required MaxLength="10" class="form-control" runat="server" placeholder="Event Zip" />
        </div>
    </div>
    <br />
    <asp:Button ID="btnAddEvent" CssClass="btn btn-primary" runat="server" Text="Add Event" OnClick="btnAddEvent_Click" />
</asp:Content>
