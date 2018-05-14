
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Residue</title>
        <%@include  file="header.html" %>
         <link rel="stylesheet" type="text/css" href="../mystyle.css"/>
    </head>
    <body>
        <form name="frmGuestHome" action="GuestHome.jsp">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td><a href="FoodDetails.jsp"> Food Details</a></td>
                    </tr>
                    <tr>
                        <td><a href="ViewFoodCollectonRequest.jsp"> View Food Collection Request</a></td>
                    </tr>
                     <tr>
                         <td><a href="DonationToReguser.jsp"> Donation To Registered User</a></td>
                    </tr>
                    <tr>
                         <td><a href="DonationToCharitableTrust.jsp"> Donation To Charitable Trust</a></td>
                    </tr>
                     <tr>
                         <td><a href="ViewCharitableTrust.jsp">View Charitable Trust</a></td>
                    </tr>
                     <tr>
                         <td><a href="ViewRegisteredUsers.jsp">View Registered Users</a></td>
                    </tr>
                
            </table>
                </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>