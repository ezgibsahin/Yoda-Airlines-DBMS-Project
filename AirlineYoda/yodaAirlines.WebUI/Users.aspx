<%@ Page Title="Users Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="yodaAirlines.WebUI.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            <asp:Label ID="LabelUserList" runat="server" Text="User List"></asp:Label>
            <asp:GridView ID="GridViewUser" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </p>
    </div>
    <h4>Get User by Id</h4>
    <div>
        <p>
            <asp:Label ID="LabelUserId" runat="server" Text="User Id"></asp:Label>
            <asp:TextBox ID="TextBoxId" runat="server" Width="136px"></asp:TextBox>
            <asp:Button ID="ButtonGetUser" runat="server" Text="Get User Infromation" OnClick="ButtonGetUser_OnClick"/>
            <asp:Button ID="ButtonDelete" runat="server" Text="Delete User" OnClick="ButtonDelete_OnClick"/>
        </p>
    </div>
    <div class="row">
        <asp:Label ID="LabelUserNId" runat="server" Text="User National Id" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUNId" runat="server"></asp:TextBox>
        <br />
    </div>
    <div class="row">
        <asp:Label ID="LabelUName" runat="server" Text="User Name" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUName" runat="server"></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelUserSurName" runat="server" Text="User Surname" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUSurname" runat="server"></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelUserGender" runat="server" Text="User Gender" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUGender" runat="server"></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelUserNationality" runat="server" Text="User Nationality" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUNationality" runat="server"></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelUserLanguage" runat="server" Text="User Language" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxULanguage" runat="server"></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelUserProfession" runat="server" Text="User Profession" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUProfession" runat="server"></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelUserBirthday" runat="server" Text="User Birthday" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUBirthday" runat="server"></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelUserPhone" runat="server" Text="User Phone" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUPhone" runat="server"></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelUserEmail" runat="server" Text="User Email" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUEmail" runat="server"></asp:TextBox>
        <br />
    </div>
    <div class="row">
        <asp:Label ID="LabelUserPassword" runat="server" Text="User Password" Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUPassword" runat="server" ReadOnly="false"></asp:TextBox>
        <br />
    </div>
    <h4>Add User</h4>
    <div class="row">
        <asp:Label ID="LabelAddUserNId" runat="server" Text="Enter National Id: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserNId" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserName" runat="server" Text="Enter Name: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserName" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserSurname" runat="server" Text="Enter Surname: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserSurname" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserGender" runat="server" Text="Enter Gender: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserGender" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserNationality" runat="server" Text="Enter Nationality: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserNationality" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserLanguage" runat="server" Text="Enter Language: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserLanguage" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserProfession" runat="server" Text="Enter Profession: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserProfession" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserBirthday" runat="server" Text="Enter Birthday: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserBirthday" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserPhone" runat="server" Text="Enter Phone: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserPhone" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserEmail" runat="server" Text="Enter Email: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserEmail" runat="server" ></asp:TextBox>
    </div>
    <div class="row">
        <asp:Label ID="LabelAddUserPassword" runat="server" Text="Enter Password: " Height="16px" Width="173px"></asp:Label>
        <asp:TextBox ID="TextBoxUserPassword" runat="server" ></asp:TextBox>
    </div>
    <asp:Button ID="ButtonAddUser" runat="server" Text="Add User" OnClick="ButtonAddUser_OnClick"/>
</asp:Content>
