﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="receipt.aspx.cs" Inherits="Flight_Reservation.receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button Text="Generate Invoice" OnClick="GenerateInvoicePDF" runat="server" />
        </div>
    </form>
</body>
</html>
