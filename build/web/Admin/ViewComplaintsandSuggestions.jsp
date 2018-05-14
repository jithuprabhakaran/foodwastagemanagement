

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    String sel="";
    ResultSet rs=null;
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Residue</title>
        <%@include  file="header.html" %>
            <link rel="stylesheet" type="text/css" href="../mystyle.css"/>
    </head>
    <body>
        <form name="frmViewComplaints" action="ViewComplaintsandSuggestions.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
              
                    <tr>
                        <td colspan="5">Complaints and Suggestions</td>                        
                    </tr>
                
                    <tr>
                        <td width="100">Date</td>
                        <td width="100">Time</td>
                        <td width="200">Charitable Trust</td>
                        <td width="150">Contact No</td>
                        <td width="300">Complaint</td>
                    </tr>
                    <%
                        sel="select * from tbl_complsugg,tbl_charitabletrust where tbl_complsugg.chari_id=tbl_charitabletrust.chari_id  order by complsugg_date desc ";
                        rs=obj.select(sel);
                        while(rs.next())
                        {
                    
                    %>
                    <tr>
                        <td><%=rs.getString("complsugg_date") %></td>
                        <td><%=rs.getString("complsugg_time") %></td>
                        <td><%=rs.getString("chari_name") %></td>
                        <td><%=rs.getString("chari_contact1") %></td>
                        <td><%=rs.getString("complsugg_text") %></td>
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