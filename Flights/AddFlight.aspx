<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFlight.aspx.cs" Inherits="Flight_Reservation.Flights.Flights" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Flight</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="main">
        <div class="container">
            <form id="addFlight" class="appointment-form" method="post" runat="server">
                <h2>Add Flight</h2>
                <div class="form-group-1">
                    <label for="agree-term" class="label-agree-term">Flight Name </label>
                    <asp:TextBox ID="flightName" Text="MH370" runat="server"></asp:TextBox>
                     <label for="agree-term" class="label-agree-term">Children Seats </label>
                    <asp:TextBox TextMode="Number" MaxLength="3"  ID="Childrenseat" Text="150" runat="server"></asp:TextBox>
                 <label for="agree-term" class="label-agree-term">Adult Seats </label>
                    <asp:TextBox TextMode="Number" MaxLength="3"  ID="Adultseat" Text="150" runat="server"></asp:TextBox>
                </div>
                <div class="form-submit">
                    <asp:Button id="submit" runat="server" Text="Add" CssClass="submit" OnClick="onSubmitClicked"/>
                     <input type="button" class="submit" onclick="back()" value="Back" />
                </div>
            </form>
        </div>
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        function back() {
            window.location.replace("ViewFlights.aspx");
        }
    </script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
