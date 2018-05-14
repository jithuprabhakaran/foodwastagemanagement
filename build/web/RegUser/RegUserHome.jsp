
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
        <form name="frmViewFoodDetails" action="RegUserHome.jsp">
            <center>  <table class="CSSTableGenerator2">
                    <tr>
                        <td><a href="ViewFoodDetails.jsp">View Food Details</a></td>
                    </tr>
                    <tr>
                        <td><a href="FoodSupplyRequest.jsp">Food Supply Request To Charitable Trust</a></td>
                    </tr>
                    <tr>
                        <td><a href="FoodCollectionDetails.jsp">Food Collection Details</a></td>
                    </tr>
                    <tr>
                        <td><a href="FoodSupplyDetails.jsp">Food Supply Details</a></td>
                    </tr>
                     <tr>
                         <td><a href="AcceptRejectDonation.jsp">Accept Reject Donation</a></td>
                    </tr>
                     <tr>
                         <td><a href="ViewComplaintsandSuggestions.jsp">View Complaints and Suggestions</a></td>
                    </tr>
                
            </table>

        </form>
        </center>
    </body>
</html>
<%@include  file="footer.html" %>