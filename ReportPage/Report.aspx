<%@ Page Title="Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Flight_Reservation.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

    <div class="container body-content">
<form id="form1" method="post">

  <div id="allThing" style="padding-bottom:100px;">
        <div>

        
    <div style="margin-bottom:-50px;">
            
        &nbsp;<h1 id="title1" runat="server">Monthly Average Sales Report </h1>
        <br />
        </div><br /><br />
        <p>
            Select a year :
            <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="artworkCategories" DataValueField="artworkCategories" AutoPostBack="True">
                <asp:ListItem>2020</asp:ListItem>
                <asp:ListItem>2019</asp:ListItem>
            </asp:DropDownList>
            &nbsp;
        </p>
        </div>
    
        </div>
 

          <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="510px" Width="768px">
                <Series>
                     <asp:Series Name="Series1" XValueMember="Month" YValueMembers="TotalSales" YValuesPerPoint="4">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Titles>
                    <asp:Title Name="Average">
                    </asp:Title>
                </Titles>
            </asp:Chart>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="
                SELECT {fn MONTHNAME(paymentDate)} As Month,Sum(paymentAmount) As TotalSales
                FROM Payment
                WHERE Year(paymentDate)=@year
                GROUP BY  {fn MONTHNAME(paymentDate)}">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="year" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</form>
        </div>

</asp:Content>
