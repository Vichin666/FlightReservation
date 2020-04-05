<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FlightConfirmation.aspx.cs" Inherits="Flight_Reservation.ShowFlightConfirmation.FlightConfirmation" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container body-content">
        
        <br />
        <br />

        <h1 style="text-align:center">Booking Confirmation</h1>

        <center>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="scheduleID" DataSourceID="SqlDataSource1" Height="50px" Width="585px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="scheduleID" HeaderText="scheduleID" InsertVisible="False" ReadOnly="True" SortExpression="scheduleID">
                </asp:BoundField>
                <asp:BoundField DataField="origin" HeaderText="origin" SortExpression="origin">
                </asp:BoundField>
                <asp:BoundField DataField="destination" HeaderText="destination" SortExpression="destination">
                </asp:BoundField>
                <asp:BoundField DataField="departureDate" HeaderText="departureDate" SortExpression="departureDate">
                </asp:BoundField>
                <asp:BoundField DataField="departureTime" HeaderText="departureTime" SortExpression="departureTime">
                </asp:BoundField>
                <asp:BoundField DataField="TotalAdultPrice" HeaderText="TotalAdultPrice" ReadOnly="True" SortExpression="TotalAdultPrice">
                </asp:BoundField>
                <asp:BoundField DataField="TotalChildPrice" HeaderText="TotalChildPrice" ReadOnly="True" SortExpression="TotalChildPrice">
                </asp:BoundField>
                <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" ReadOnly="True" SortExpression="TotalPrice">
                </asp:BoundField>
                <asp:BoundField DataField="flightName" HeaderText="FlightName" SortExpression="FlightName" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>

            <br />

            <asp:Button ID="btnPayment" runat="server" Text="Proceed to Payment" OnClick="btnPayment_Click" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\flightdb.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Schedule.scheduleID, Schedule.origin, Schedule.destination, Schedule.departureDate, Schedule.departureTime, Schedule.adultPrice * @adultQty AS TotalAdultPrice, Schedule.childPrice * @childQty AS TotalChildPrice, Schedule.adultPrice * @adultQty + Schedule.childPrice * @childQty AS TotalPrice, Flight.flightName FROM Schedule INNER JOIN Flight ON Schedule.flightID = Flight.flightID WHERE (Schedule.scheduleID = @scheduleID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="adultQty" QueryStringField="adultQty" />
                <asp:QueryStringParameter DefaultValue="0" Name="childQty" QueryStringField="childQty" />
                <asp:QueryStringParameter Name="scheduleID" QueryStringField="scheduleID" />
            </SelectParameters>
        </asp:SqlDataSource>

            </center>
        <br />

     </div>
</asp:Content>
