<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Flight_Reservation.HomePage.Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

	<div id="booking" class="section">
		<div class="section-center">
			<div class="container body-content">
				<div class="row">
                  <div>
                      <asp:Label ID="lb1" runat="server" ></asp:Label>
                  </div>
					<div class="col-md-4">
						<div class="booking-cta">
							<h1>Book your flight today</h1>
							<p>“Welcome to our webaite. our mission is provide a better service and conveniance to you.Other than that, we also the most safe flight .   ”</p>
						</div>
					</div>
                    
					<div class="col-md-7 col-md-offset-1">
						<div class="booking-form">
							<form id="showFlightForm" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Flying from</span>
										
                                            <asp:DropDownList ID="origin" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="origin" DataValueField="origin"></asp:DropDownList>
										    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\flightdb.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [origin] FROM [Schedule]"></asp:SqlDataSource>
										</div>
									</div>
									<div class="auto-style1">
										<div class="form-group">
											<span class="form-label">Flying to</span>
                                            <asp:DropDownList ID="destination" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="destination" DataValueField="destination"></asp:DropDownList>

											<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\flightdb.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [destination] FROM [Schedule]"></asp:SqlDataSource>

								
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Departing</span>
                                            		<input  name="departureDate"  id="txtDate" class="form-control" type="date" required>
                                            
										</div>
									</div>
								</div>


								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Adults (18+)</span>
											<select  name="adultQty" class="form-control">
												<option>1</option>
                                                <option>0</option>
												<option>2</option>
												<option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>

											</select>
											<span class="select-arrow"></span>
										</div>
									</div>

                                    <script>
                                        $(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    
    var maxDate = year + '-' + month + '-' + day;
    
    $('#txtDate').attr('min', maxDate);
});
                                    </script>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">Children (0-17)</span>
											 <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
											<span class="select-arrow"></span>
										</div>
									</div>
								</div>
                               <script >
                                       var cmbID = "<%=DropDownList1.ClientID %>";
                            if (document.getElementById(cmbID).selectedIndex == 0) {
                              alert("Please select a Value");
                                  return false;
                            }
                                    return true;
                               </script>

								<div>
									<asp:Button  OnClick="showBtnClicked" runat="server" Text="Show Flight" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="header">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 50%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</asp:Content>


