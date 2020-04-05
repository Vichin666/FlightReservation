<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginSignUp.aspx.cs" Inherits="Flight_Reservation.LoginSignUpPage.LoginSignUp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

	<div class="bg-contact3" style="background-image: url('images/bg-01.jpg');">
		<div class="container-contact3">
			<div class="wrap-contact3">
				<form class="contact3-form validate-form" method="post">
					<span class="contact3-form-title">
						SkyLine
					</span>

					<div class="wrap-contact3-form-radio" id="radioGroup">
						<div class="contact3-form-radio m-r-42">
							<input class="input-radio3" id="radio1" type="radio" name="choiceGroup" value="Login" checked="checked" onclick="changeButtonType()" ">
							<label class="label-radio3" for="radio1">
								Login
							</label>
						</div>

						<div class="contact3-form-radio">
							<input class="input-radio3" id="radio2" type="radio" name="choiceGroup" value="Sign Up Now" onclick="changeButtonType()">
							<label class="label-radio3" for="radio2">
								Sign Up
							</label>
						</div>
					</div>

					<div class="wrap-input3 validate-input" data-validate="Username is required">
						<asp:TextBox class="input3" ID="username" placeholder="Username" runat="server"></asp:TextBox>
						<span class="focus-input3"></span>
					</div>

					<div class="wrap-input3 validate-input" data-validate="Password is required">
						<asp:TextBox class="input3" type="password" ID="password" placeholder="Password" runat="server"></asp:TextBox>
						<span class="focus-input3"></span>
					</div>

					<div class="wrap-input3 input3-select">
						<asp:TextBox class="input3" type="password" ID="confirmPassword" placeholder="Confirm Password" runat="server"></asp:TextBox>
						<asp:CompareValidator id="comparePasswords" 
              runat="server"
              ControlToCompare="password"
              ControlToValidate="confirmPassword"
              ErrorMessage="Your passwords do not match up!"
              Display="Dynamic" />
                        <span class="focus-input3"></span>
					</div>

					<div class="wrap-input3 input3-select">
						<asp:TextBox class="input3" ID="ic" placeholder="Identity Card"  maxlength="12" runat="server"></asp:TextBox>
						<span class="focus-input3"></span>
					</div>

					<div class="wrap-input3 input3-select">
						<asp:TextBox class="input3" ID="contact" placeholder="Contact No" runat="server"></asp:TextBox>
						<span class="focus-input3"></span>
					</div>

					<div class="wrap-input3 input3-select">
						<asp:TextBox class="input3" type="email" ID="email" placeholder="Email" runat="server"></asp:TextBox>
						<span class="focus-input3"></span>
					</div>

					<center>
						<div class="container-contact3-form-btn">
						    <asp:Button class="contact3-form-btn" id="Button1" runat="server" OnClick="Button1_Click" text="Login/Register Account" BorderStyle="Double"/> 
						</div>
					</center>
				</form>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>

	   <script> 
           function changeButtonType() {
               var checkRadio = document.querySelector(
                   'input[name="choiceGroup"]:checked');

               if (checkRadio != null) {
                   document.getElementById("btnAction").innerText
                       = checkRadio.value;
                   document.getElementById("btnAction").value = checkRadio.value;
               }
           }
    </script> 
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
        $(".selection-2").select2({
            minimumResultsForSearch: 20,
            dropdownParent: $('#dropDownSelect1')
        });
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');
</script>

</asp:Content>