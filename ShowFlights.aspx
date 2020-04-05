<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowFlights.aspx.cs" Inherits="Flight_Reservation.Testing" %>

<asp:Content  ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <center>
    <asp:GridView ID="GridView" CssClass="container body-content" runat="server" AutoGenerateColumns="False" DataKeyNames="scheduleID" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="GridViewonChanged" Height="368px" Width="1300px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" >
        <Columns>
            <asp:BoundField DataField="scheduleID" HeaderText="Schedule ID" InsertVisible="False" ReadOnly="True" SortExpression="scheduleID" />
            <asp:BoundField DataField="origin" HeaderText="Origin" SortExpression="origin" />
            <asp:BoundField DataField="destination" HeaderText="Destination" SortExpression="destination" />
            <asp:BoundField DataField="departureDate" HeaderText="Departure Date" SortExpression="departureDate" />
            <asp:BoundField DataField="departureTime" HeaderText="DepartureTime" SortExpression="departureTime" />
            <asp:BoundField DataField="TotalAdultPrice" HeaderText="Total Adult Price" SortExpression="TotalAdultPrice" ReadOnly="True" />
            <asp:BoundField DataField="TotalChildPrice" HeaderText="Total Child Price" SortExpression="TotalChildPrice" ReadOnly="True" />
            <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" ReadOnly="True" SortExpression="TotalPrice" />
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
        </Columns>
        <EmptyDataTemplate>
        <div align="center">No Flight found. Please Choose Another Date</div>
    </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:flightdbConnectionString %>" SelectCommand="SELECT Schedule.scheduleID, Schedule.origin, Schedule.destination, Schedule.departureDate, Schedule.departureTime, Schedule.adultPrice * @adultQty AS TotalAdultPrice, Schedule.childPrice * @childQty AS TotalChildPrice, Schedule.adultPrice * @adultQty + Schedule.childPrice * @childQty AS TotalPrice, Flight.flightName FROM Schedule INNER JOIN Flight ON Schedule.flightID = Flight.flightID WHERE (Schedule.origin LIKE '%' + @origin + '%') AND (Schedule.destination LIKE '%' + @destination + '%') AND (Schedule.departureDate = @departureDate) ORDER BY Schedule.departureDate">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="10" Name="adultQty" QueryStringField="adultQty" />
            <asp:QueryStringParameter DefaultValue="2" Name="childQty" QueryStringField="childQty" />
            <asp:QueryStringParameter DefaultValue="Malaysia" Name="origin" QueryStringField="origin" />
            <asp:QueryStringParameter DefaultValue="Taiwan" Name="destination" QueryStringField="destination" />
            <asp:QueryStringParameter DefaultValue="2020-01-01" Name="departureDate" QueryStringField="departureDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </center>
   <div align="center">
      <asp:Button ID="Button"  runat="server" text="Back To Home Page" OnClick="Button_Click"/>
    </div>
</asp:Content>
