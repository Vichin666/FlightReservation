<%@ Page Title="Booking History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="Flight_Reservation.History.History" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container body-content">
    <form id="form1">

<h1><span class="auto-style45">Purchase History</span></h1>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flightdbConnectionString %>" SelectCommand="SELECT DISTINCT Payment.paymentID, Payment.paymentType, Payment.paymentDate, Payment.reservationID, Payment.paymentAmount, Reservation.reservationID AS Expr1, Reservation.scheduleID, Schedule.scheduleID AS Expr2, Schedule.origin, Schedule.destination, Schedule.departureDate, Schedule.departureTime, Flight.flightName FROM Payment INNER JOIN Reservation ON Payment.reservationID = Reservation.reservationID INNER JOIN Schedule ON Reservation.scheduleID = Schedule.scheduleID INNER JOIN Flight ON Schedule.flightID = Flight.flightID ORDER BY Payment.paymentDate" DeleteCommand="DELETE FROM Payment FROM Payment INNER JOIN Reservation ON Payment.reservationID = Reservation.reservationID INNER JOIN Schedule ON Reservation.scheduleID = Schedule.scheduleID">
        </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="paymentID,Expr1,Expr2" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Width="1300px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" SelectText="Cancel Booking" ShowSelectButton="True" />
            <asp:BoundField DataField="paymentID" HeaderText="PaymentID" InsertVisible="False" ReadOnly="True" SortExpression="paymentID" />
            <asp:BoundField DataField="paymentType" HeaderText="PaymentType" SortExpression="paymentType" />
            <asp:BoundField DataField="paymentDate" HeaderText="PaymentDate" SortExpression="paymentDate" />
            <asp:BoundField DataField="paymentAmount" HeaderText="PaymentAmount" SortExpression="paymentAmount" />
            <asp:BoundField DataField="origin" HeaderText="Origin" SortExpression="origin" />
            <asp:BoundField DataField="destination" HeaderText="Destination" SortExpression="destination" />
            <asp:BoundField DataField="departureDate" HeaderText="DepartureDate" SortExpression="departureDate" />
            <asp:BoundField DataField="departureTime" HeaderText="DepartureTime" SortExpression="departureTime" />
            <asp:BoundField DataField="flightName" HeaderText="FlightName" SortExpression="flightName" />
        </Columns>
        <EmptyDataTemplate>
        <div align="center">No Flight Booking. Please make a Booking</div>
    </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="Gray" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</form>
        </div>
    <div align="center">
      <asp:Button ID="Button"  runat="server" text="Back To Home Page" OnClick="Button_Click"/>
    </div>
</asp:Content>
