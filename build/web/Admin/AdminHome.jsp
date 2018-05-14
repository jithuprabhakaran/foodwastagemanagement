
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
        <form name="frmAdminHome" action="AdminHome.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td><a href="State.jsp"> State</a></td>
                    </tr>
                    <tr>
                        <td><a href="District.jsp">District</a></td>
                    </tr>
                    <tr>
                        <td><a href="Muncipality.jsp">Muncipality</a></td>
                    </tr>
                     <tr>
                        <td><a href="AcceptRejectCharitableTrust.jsp">Registration Request From Charitable Trust</a></td>
                    </tr>
                     <tr>
                         <td><a href="AcceptRejectRegUser.jsp">Registration Request From User</a></td>
                    </tr>
                      <tr>
                          <td><a href="ViewComplaintsandSuggestions.jsp">View Complaints and Suggestions</a></td>
                    </tr>
                
            </table>
            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>