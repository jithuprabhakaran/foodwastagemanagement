

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
        <form name="frmViewCharitableTrust" action="ViewCharitableTrust.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="7">Charitable Trust Details</td>
                       
                    </tr>
               
                    <tr>
                        <td width="200">Name</td>
                        <td width="250">Address</td>
                        <td width="200">Muncipality</td>
                        <td width="150">Contact No</td>
                        <td width="200">Email</td>
                        <td width="150">Reg No</td>
                        <td width="150">View Full Details</td>
                    </tr>
                    <%
                        sel="select * from tbl_charitabletrust,tbl_muncipality where tbl_charitabletrust.mun_id=tbl_muncipality.mun_id and chari_status='A'";
                        rs=obj.select(sel);
                        while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString("chari_name") %></td>
                        <td><%=rs.getString("chari_address") %></td>
                        <td><%=rs.getString("mun_name") %></td>
                        <td><%=rs.getString("chari_contact1") %></td>
                        <td><%=rs.getString("chari_email") %></td>
                        <td><%=rs.getString("chari_regno") %></td>
                        <td><a href="ViewCharitableTrustFull.jsp?CId=<%=rs.getString("chari_id")%>">View Full Details</a></td>
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