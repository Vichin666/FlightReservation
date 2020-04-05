<%@ Page Title="Payment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Flight_Reservation.PaymentPage.Payment" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container body-content">
        <div style="max-width:80%;margin-left:auto;margin-right:auto;font-size:1.2em;">
    <b><asp:Label ID="lblPayment" runat="server" Text="PAYMENT" style="font-size:30px"></asp:Label></b><br /><br />
    <u>Please Enter Your Card Details</u>&nbsp;
           <form method="post"> 
       <table class="auto-style45">
           <br />
           <asp:Label ID="lblTotalPay" runat="server" Text=""></asp:Label>
           <br /><br />
        
        <tr>
            <td class="auto-style52">
                <asp:Label ID="nameCard" runat="server" Text="Name On Card :"></asp:Label></td>
            <td>
                <asp:TextBox ID="cardTxt" runat="server" ></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" style="color:red" ErrorMessage="only characters allowed" ControlToValidate="cardTxt" ValidationExpression="^[A-Za-z]*$"  ></asp:RegularExpressionValidator>
                <%--<asp:Label ID="cardError" runat="server" Text="*" style="color:red" Visible="false"></asp:Label>--%>

            </td>
        </tr>
        <tr>
            <td class="auto-style52">
                <asp:Label ID="type" runat="server" Text="Credit Card Type :"></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Visa</asp:ListItem>
                    <asp:ListItem>Master</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style52">
                <asp:Label ID="number" runat="server" Text="Credit Card Number :"></asp:Label></td>
            <td>
                
                  <asp:TextBox ID="NumTxt" runat="server" MaxLength="4" Width="50px"   ></asp:TextBox> 
                <asp:TextBox ID="NumTxt0" runat="server" MaxLength="4" Width="50px" ></asp:TextBox> 
                <asp:TextBox ID="NumTxt1" runat="server" MaxLength="4" Width="50px" ></asp:TextBox> 
                <asp:TextBox ID="NumTxt2" runat="server" MaxLength="4" Width="50px" ></asp:TextBox> 
              <asp:Label ID="numError" runat="server" Text="*" style="color:red" Visible="false"></asp:Label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" style="color:red" ErrorMessage="only Numeric allowed" ControlToValidate="NumTxt" ValidationExpression="^\d+"  ></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" style="color:red" ErrorMessage="only Numeric allowed" ControlToValidate="NumTxt0" ValidationExpression="^\d+"  ></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" style="color:red" ErrorMessage="only Numeric allowed" ControlToValidate="NumTxt1" ValidationExpression="^\d+"  ></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" style="color:red" ErrorMessage="only Numeric allowed" ControlToValidate="NumTxt2" ValidationExpression="^\d+"  ></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style52">

                <asp:Label ID="expiry" runat="server" Text="Expiry Date :"></asp:Label>
                </td>
            <td>
                month/year<br />
              <%--  <asp:TextBox ID="month" runat="server" Width="55px" TextMode="Number" MaxLength="2" min="1" CssClass="numberInput"></asp:TextBox>
              --%> 
											<select  name="month" >
												
                                                <option>1</option>
												<option>2</option>
												<option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>
                                                <option>11</option>
                                                <option>12</option>

											</select>
                <select  name="Year" >
												
                                                <option>2020</option>
												<option>2021</option>
												<option>2022</option>
                                                <option>2023</option>
                                                <option>2024</option>
                                                <option>2025</option>
                                                <option>2026</option>
                                                <option>2027</option>
                                                <option>2028</option>
                                                <option>2029</option>
                                                <option>2030</option>
                                                

											</select>
											
                
                <%---<asp:TextBox ID="year" runat="server" Width="55px" TextMode="Number" MaxLength="4" CssClass="numberInput"></asp:TextBox>
               --%> 


                <asp:Label ID="expiryError" runat="server" Text="*" style="color:red" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style52">

                <asp:Label ID="cvv" runat="server" Text="CVV/CVC2 :"></asp:Label></td>
            <td>
                <asp:TextBox ID="cvvTxt" runat="server" TextMode="Number" MaxLength="3" CssClass="numberInput"></asp:TextBox>
                <asp:Label ID="cvvError" runat="server" Text="*" style="color:red" Visible="false"></asp:Label>
            </td>
        </tr>

          
        <tr>
            <td class="auto-style52">&nbsp;</td>
            <td><asp:Label ID="invalidCard" runat="server" Text="Invalid Card Details..." style="color:red" Visible="false"></asp:Label></td>
        </tr>

            <tr>
               <td class="auto-style52">
                  
               </td>

               <td>
                <asp:Label ID="CurrentTime" runat="server" />
               </td>


           </tr>
        <tr>
            <td class="auto-style52">
                <asp:Button ID="cancel" runat="server" Text="Cancel" OnClick="cancel_Click" />
            </td>
            <td>
                <asp:Button ID="confirm" runat="server" Text="Confirm" OnClick="confirm_Click" />
            </td>
        </tr>
           
    </table>
         </form> 

        </div>
       
    
  
    <script type="text/javascript">
window.addEventListener('keydown',function(e){if(e.keyIdentifier=='U+000A'||e.keyIdentifier=='Enter'||e.keyCode==13){if(e.target.nodeName=='INPUT'&&e.target.type=='text'){e.preventDefault();return false;}}},true);
</script>
     </div>
</asp:Content>

