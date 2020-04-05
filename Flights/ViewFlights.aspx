<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ViewFlights.aspx.cs" Inherits="Flight_Reservation.Flights.ViewFlights" %>

<asp:Content ID="body" ContentPlaceHolderID="MainContent" runat="server">
           <br />    <center>
    <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="flightID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="732px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            
            <asp:CommandField SelectText="Cancel Flight" ShowSelectButton="True" />
            
            <asp:BoundField DataField="flightID" HeaderText="flightID" SortExpression="flightID" InsertVisible="False" ReadOnly="True" >
            </asp:BoundField>
            <asp:BoundField DataField="flightName" HeaderText="flightName" SortExpression="flightName" >
            </asp:BoundField>
            <asp:BoundField DataField="aduktQty" HeaderText="aduktQty" SortExpression="aduktQty" />
            <asp:BoundField DataField="chilrQty" HeaderText="chilrQty" SortExpression="chilrQty" />
            <asp:BoundField DataField="totalSeats" HeaderText="totalseat" ReadOnly="True" SortExpression="totalseat" />
        </Columns>
        <EditRowStyle BackColor="White" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:flightdbConnectionString %>" DeleteCommand="DELETE FROM [Flight] WHERE [flightID] = @original_flightID AND [flightName] = @original_flightName AND [totalSeats] = @original_totalSeats" InsertCommand="INSERT INTO [Flight] ([flightName], [totalSeats]) VALUES (@flightName, @totalSeats)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT flightID, flightName, totalSeats, aduktQty, chilrQty FROM Flight" UpdateCommand="UPDATE [Flight] SET [flightName] = @flightName, [totalSeats] = @totalSeats WHERE [flightID] = @original_flightID AND [flightName] = @original_flightName AND [totalSeats] = @original_totalSeats">
        <DeleteParameters>
            <asp:Parameter Name="original_flightID" Type="Int32" />
            <asp:Parameter Name="original_flightName" Type="String" />
            <asp:Parameter Name="original_totalSeats" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="flightName" Type="String" />
            <asp:Parameter Name="totalSeats" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="flightName" Type="String" />
            <asp:Parameter Name="totalSeats" Type="Int32" />
            <asp:Parameter Name="original_flightID" Type="Int32" />
            <asp:Parameter Name="original_flightName" Type="String" />
            <asp:Parameter Name="original_totalSeats" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
               <br />
               <asp:Button ID="btnAddFlight" runat="server" Text="Add Flight" OnClick="btnAddFlight_Click" />
                              </center>

 
    


    </asp:Content>