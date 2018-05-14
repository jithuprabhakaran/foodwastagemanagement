

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String sel="",date="";
    ResultSet rs=null;
    LocalDate localDate = LocalDate.now();
    date=DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include  file="header.html" %>
            <link rel="stylesheet" type="text/css" href="../mystyle.css"/>
    </head>
    <body>
        <form name="frmEvents" action="ViewEvents.jsp" method="POST">
            <center>
                <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="6">Events Details</td>
                       
                    </tr>
                
                    <tr>
                        <td width="200">Event Manager</td>
                        <td width="250">Address</td>
                        <td width="150">Contact No</td>
                        <td width="300">Event</td>
                        <td width="100">Date</td>
                        <td width="100">Time</td>
                    </tr>
                    <%
                        sel="select * from tbl_events,tbl_eventmanager where tbl_events.eventmgr_id=tbl_eventmanager.eventmgr_id and event_date>='"+date+"'";
                        rs=obj.select(sel);
                        while(rs.next()){
                     %>
                    <tr>
                        <td><%=rs.getString("eventmgr_name") %></td>
                        <td><%=rs.getString("eventmgr_address") %></td>
                        <td><%=rs.getString("eventmgr_contactno") %></td>
                        <td><%=rs.getString("event_name") %></td>
                        <td><%=rs.getString("event_date") %></td>
                        <td><%=rs.getString("event_time") %></td>
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
