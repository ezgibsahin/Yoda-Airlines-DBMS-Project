<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ticket.aspx.cs" Inherits="yodaAirlines.WebUI.ticket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div align="center" class="jumbotron">
      <p class="lead"><span style="color:darksalmon" style="font-weight:bold">Buy Ticket</span></p>
      <p>
          <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack ="true">
              <asp:ListItem Text="One Way" Value="1" Selected="True"></asp:ListItem>
              <asp:ListItem Text="Round Trip" Value="2" Selected="False"></asp:ListItem>
          </asp:RadioButtonList>
      </p>
      <p class="lead">
          <asp:Label ID="LabelTicketFrom" runat="server" Text="From?"></asp:Label>
      &nbsp;<asp:DropDownList ID="DropDownListTicketFrom" runat="server" OnSelectedIndexChanged="DropDownListTicketFrom_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
          &nbsp;<asp:Label ID="LabelTicketWhere" runat="server" Text="Where?"></asp:Label>
      &nbsp;<asp:DropDownList ID="DropDownListTicketWhere" runat="server" OnSelectedIndexChanged="DropDownListTicketWhere_SelectedIndexChanged" AutoPostBack="true">
            </asp:DropDownList>
      &nbsp;<asp:Label ID="LabelTicketDate" runat="server" Text="Date"></asp:Label>
      &nbsp;<asp:DropDownList ID="DropDownListTicketDate" runat="server" OnSelectedIndexChanged="DropDownListTicketDate_SelectedIndexChanged">
            </asp:DropDownList>
      &nbsp;<asp:Label ID="LabelTicketPassengerNumber" runat="server" Text="Number of Passengers"></asp:Label>
      &nbsp;<asp:DropDownList ID="DropDownListTicketPassengerNumber" runat="server" Height="40px" OnSelectedIndexChanged="DropDownListTicketPassengerNumber_SelectedIndexChanged">
              <asp:ListItem Enabled="true" Text="0" Value="-1"></asp:ListItem>
              <asp:ListItem Text="1" Value="1"></asp:ListItem>
              <asp:ListItem Text="2" Value="2"></asp:ListItem>
              <asp:ListItem Text="3" Value="3"></asp:ListItem>
              <asp:ListItem Text="4" Value="4"></asp:ListItem>
              <asp:ListItem Text="5" Value="5"></asp:ListItem>
          </asp:DropDownList>
      &nbsp;&nbsp;
          </p>
          <p>
      <asp:Button ID="ButtonFindTicket" runat="server" Text="FIND TICKET" Visible="true" OnClick="ButtonFindTicket_Click" AutoPostback = false/>
          </p>
          <p>
              <asp:Label ID="LabelSelectOUT" runat="server" Text=" "></asp:Label>
          </p>
          <p visible="false">
      <asp:RadioButtonList ID="RadioButtonListOUT" runat="server" OnSelectedIndexChanged="RadioButtonListOUT_SelectedIndexChanged">
      </asp:RadioButtonList>
              <asp:RadioButtonList ID="RadioButtonListOUTseat" runat="server">
              </asp:RadioButtonList>
           </p>
            <p>
                <asp:Label ID="LabelSelectIN" runat="server" Text=" "></asp:Label>
            </p>
           <p visible="false">
               <asp:RadioButtonList ID="RadioButtonListIN" runat="server" OnSelectedIndexChanged="RadioButtonListIN_SelectedIndexChanged">
               </asp:RadioButtonList>
               <asp:RadioButtonList ID="RadioButtonListINSeat" runat="server" >
               </asp:RadioButtonList>
           <p><asp:Button ID="ButtonGO" runat="server" OnClick="ButtonGO_Click" Text="GO" Visible ="true" />
      </p>
    </div>
</asp:Content>
