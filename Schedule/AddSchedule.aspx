<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSchedule.aspx.cs" Inherits="Flight_Reservation.Schedule.Schedule" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Schedule</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="main">
        <div class="container">
            <form id="addSchedule" class="appointment-form" method="post" runat="server">
                <h2>Add Schedule</h2>
                <div class="form-group-1">
                    <label for="agree-term" class="label-agree-term">Flight Name </label>
                    <asp:DropDownList ID="flight" runat="server" DataSourceID="flightdbEntities" DataTextField="flightName" DataValueField="flightID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="flightdbEntities" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\flightdb.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [flightID], [flightName] FROM [Flight]"></asp:SqlDataSource> 
					<label for="agree-term" class="label-agree-term">Date </label>
                    <input name="departureDate" type="date" required/>
                    <label for="agree-term" class="label-agree-term">Departure Time </label>
                    <input name="departureTime" type="time" required />
                    <label for="agree-term" class="label-agree-term">Origin </label>
                    <asp:TextBox ID="origin" Text="" runat="server"></asp:TextBox>
                    <label for="agree-term" class="label-agree-term">Destination </label>
                    <asp:TextBox ID="destination" Text="" runat="server"></asp:TextBox>
                    
                    <label for="agree-term" class="label-agree-term">Adult Price(RM)</label>
                    <asp:TextBox ID="adultPrice" type="number" Text="150.00" runat="server"></asp:TextBox>
                    <label for="agree-term" class="label-agree-term">Children Price(RM) </label>
                    <asp:TextBox ID="childPrice" type="number" Text="100.00" runat="server"></asp:TextBox>
                </div>
                <div class="form-submit">
                    <div>
                        <asp:Button id="submit" runat="server" Text="Add" CssClass="submit" OnClick="onSubmitClicked"/>
   
                        <input type="button" class="submit" onclick="back()" value="Back" />
                    </div>
                </div>
            </form>
        </div>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        function back() {
            window.location.replace("ViewSchedule.aspx");
        }
    </script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
