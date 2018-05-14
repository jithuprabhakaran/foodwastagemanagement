
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String sel="";
    ResultSet rs=null;
    
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
        <form name="frmEventManager" action="ViewEventManager.jsp">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="4">Event Manager Details</td>
                     
                       
                    </tr>
                
                
                    <tr>
                        <td width="300">Name</td>
                        <td width="350">Address</td>
                        <td width="200">Contact No</td>
                        <td width="300">Email</td>
                    </tr>
                    <%
                        sel="select * from tbl_eventmanager order by eventmgr_name";
                        rs=obj.select(sel);
                        while(rs.next())
                        {
                        %>
                    <tr>
                        <td><%=rs.getString("eventmgr_name") %></td>
                        <td><%=rs.getString("eventmgr_address") %></td>
                        <td><%=rs.getString("eventmgr_contactno") %></td>
                        <td><%=rs.getString("eventmgr_email") %></td>
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