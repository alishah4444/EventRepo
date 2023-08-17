<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="EventBookingSystem.AdminProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:SqlDataSource ID="sdcProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ebsconnection %>" DeleteCommand="DELETE FROM [Events] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Events] ([Title], [Description], [ImageUrl], [BeginOn], [FinishAt], [Address], [City], [Zip],[Price]) VALUES (@Title, @Description, @ImageUrl, @BeginOn, @FinishAt, @Address, @City, @Zip,@Price)" SelectCommand="SELECT * FROM [Events]" UpdateCommand="UPDATE [Events] SET [Title] = @Title, [Description] = @Description, [BeginOn] = @BeginOn, [FinishAt] = @FinishAt, [Address] = @Address, [City] = @City, [Zip] = @Zip,[Price] = @Price WHERE [Id] = @Id" >
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ImageUrl" Type="String" />
                <asp:Parameter Name="BeginOn" Type="DateTime" />
                <asp:Parameter Name="FinishAt" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Zip" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ImageUrl" Type="String" />
                <asp:Parameter Name="BeginOn" Type="DateTime" />
                <asp:Parameter Name="FinishAt" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Zip" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
                 <asp:Parameter Name="Price" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView CssClass="w-100" ID="grdProduct" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="sdcProduct" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Event Image" SortExpression="ImageUrl">
                    <EditItemTemplate>
                        <asp:Image AlternateText='<%# Bind("Title") %>' ID="imgEvent" runat="server" style="width:100px;height:100px" ImageUrl='<%# Eval("ImageUrl", "images/{0}") %>'></asp:Image>
                       </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Image AlternateText='<%# Bind("Title") %>' ID="imgEvent" runat="server" style="width:100px;height:100px" ImageUrl='<%# Eval("ImageUrl", "images/{0}") %>'></asp:Image>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="false" />
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:TextBox MaxLength="25" ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvTitle" runat="server" ErrorMessage="Title is required" ForeColor="Red" ControlToValidate="TextBox1" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <EditItemTemplate>
                        <asp:TextBox MaxLength="5" TextMode="Number" ID="TextBox9" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPrice" runat="server" ErrorMessage="Price is required" ForeColor="Red" ControlToValidate="TextBox9" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" TextMode="MultiLine" MaxLength="200" minlength="10" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvDescription" runat="server" ErrorMessage="Description is required" ForeColor="Red" ControlToValidate="TextBox2" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Starts" SortExpression="BeginOn">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" TextMode="DateTimeLocal" runat="server" Text='<%# Bind("BeginOn") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator Display="Dynamic" ID="rfvBegin" runat="server" ErrorMessage="Begin time is required" ForeColor="Red" ControlToValidate="TextBox4" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("BeginOn") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ends" SortExpression="FinishAt">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" TextMode="DateTimeLocal" runat="server" Text='<%# Bind("FinishAt") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvFinish" runat="server" ErrorMessage="Finish time is required" ForeColor="Red" ControlToValidate="TextBox5" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("FinishAt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvAddress" runat="server" ErrorMessage="Address is required" ForeColor="Red" ControlToValidate="TextBox6" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvCity" runat="server" ErrorMessage="City is required" ForeColor="Red" ControlToValidate="TextBox7" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Zip" SortExpression="Zip">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvZip" runat="server" ErrorMessage="Zip is required" ForeColor="Red" ControlToValidate="TextBox8" />
                     </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" HeaderText="Action">
                    <EditItemTemplate>
                        <asp:LinkButton OnClientClick="return confirm('Are you sure want to Update?')" CssClass="btn btn-success" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton OnClientClick="return confirm('Are you sure want to cancel?')" CssClass="btn btn-danger" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton OnClientClick="return confirm('Are you sure want to delete?')" ID="LinkButton2" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

        </asp:GridView>
    </div>
</asp:Content>
