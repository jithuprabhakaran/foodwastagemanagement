
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String sel="";
    ResultSet rs=null;
    String photo="";
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Residue</title>
        <%@include  file="header.html" %>
         <link rel="stylesheet" type="text/css" href="../mystyle.css"/>
    </head>
    <body>
        <form name="frmViewRegisteredUsers" action="ViewRegisteredUsers.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="6">Registered Users</td>
                        
                    </tr>
                
                    <tr>
                        <td width="200">Name</td>
                        <td width="300">Address</td>
                        <td width="150">Contact No</td>
                        <td width="200">Email</td>
                        <td width="150">Photo</td>
                        <td width="150">View Full Details</td>
                    </tr>
                    <%
                        sel="select * from tbl_reguser where reguser_status='A'";
                        rs=obj.select(sel);
                        while(rs.next()){
                        %>
                    <tr>
                        <td><%=rs.getString("reguser_name") %></td>
                        <td><%=rs.getString("reguser_address") %></td>
                        <td><%=rs.getString("reguser_contact1") %></td>
                        <td><%=rs.getString("reguser_email") %></td>
                        <td style="text-align: center;">                    
                            <a href="../UserPhoto/<%=rs.getString("reguser_photo")%>"><img src="../UserPhoto/<%=rs.getString("reguser_photo")%>" width="100" height="100" /></a></td>
                        <td><a href="ViewRegistereduserFull.jsp?UId=<%=rs.getString("reguser_id") %>">View Full Details</a></td>
                    </tr>
                    <%
                        }
                    %>
            
            </table>
            </center>
        </form>
        
    </body>
</html>
<%@include  file="footer.html" %>
