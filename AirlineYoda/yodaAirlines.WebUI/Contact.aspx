<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="yodaAirlines.WebUI.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Yoda Airlines Co.</h3>
    <address>
        One Yoda Airlines Way<br />
        Buca - İzmir<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:filiz.yilmaz@ceng.deu.edu.tr">support@yodaairlines.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:ezgi.sahin@ceng.deu.edu.tr">marketing@yodaairlines.com</a>
    </address>
</asp:Content>
