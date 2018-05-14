

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    int charid=Integer.parseInt(""+session.getAttribute("userid"));
    String sel="",str="",type="";
    ResultSet rs=null;
    if(request.getParameter("AId")!=null){
        str="update tbl_donation set don_status='A' where don_id="+request.getParameter("AId");
        if(obj.insert(str)){
            response.sendRedirect("AcceptRejectDonation.jsp");
        }
    }
    if(request.getParameter("RId")!=null){
        str="update tbl_donation set don_status='R' where don_id="+request.getParameter("RId");
        if(obj.insert(str)){
            response.sendRedirect("AcceptRejectDonation.jsp");
        }
    }
    
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
        <form name="frmAcceptRejectDonation" action="AcceptRejectDonation.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="8">Donation Requests</td>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="200">Username</td>
                        <td width="150">Contact No</td>
                        <td width="100">Date</td>
                        <td width="100">Time</td>
                        <td width="100">Type</td>
                        <td width="100">Worth Amount</td>
                        <td width="100">Accept</td>
                        <td width="100">Reject</td>
                    </tr>
                    <%
                        sel="select * from tbl_donation,tbl_guestuser where chari_id="+charid+" and tbl_donation.guest_id=tbl_guestuser.guest_id and don_status='P'";
                        rs=obj.select(sel);
                        while(rs.next())
                        {
                            if(rs.getString("don_type").equals("A"))
                                type="Amount";
                            else if(rs.getString("don_type").equals("S"))
                                type="Study Material";
                            else if(rs.getString("don_type").equals("D"))
                                type="Dress";
                            else
                                type="Others";
                    %>
                    <tr>
                        <td><%=rs.getString("guest_name") %></td>
                        <td><%=rs.getString("guest_contact") %></td>
                        <td><%=rs.getString("don_date") %></td>
                        <td><%=rs.getString("don_time") %></td>
                        <td><%=type %></td>
                        <td><%=rs.getString("don_worthamt") %></td>
                        <td><a href="AcceptRejectDonation.jsp?AId=<%=rs.getString("don_id") %>">Accept</a></td>
                        <td><a href="AcceptRejectDonation.jsp?RId=<%=rs.getString("don_id") %>">Reject</a></td>
                    </tr>
                    <%
                        }
                    %>
                
            </table>
                
                <br>
                
                 <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="6">Accepted Donations</td>
                        
                    </tr>
                
                    <tr>
                        <td width="200">Username</td>
                        <td width="150">Contact No</td>
                        <td width="100">Date</td>
                        <td width="100">Time</td>
                        <td width="100">Type</td>
                        <td width="100">Worth Amount</td>
                       
                    </tr>
                    <%
                        sel="select * from tbl_donation,tbl_guestuser where chari_id="+charid+" and tbl_donation.guest_id=tbl_guestuser.guest_id and don_status='A'";
                        rs=obj.select(sel);
                        while(rs.next())
                        {
                            if(rs.getString("don_type").equals("A"))
                                type="Amount";
                            else if(rs.getString("don_type").equals("S"))
                                type="Study Material";
                            else if(rs.getString("don_type").equals("D"))
                                type="Dress";
                            else
                                type="Others";
                    %>
                    <tr>
                        <td><%=rs.getString("guest_name") %></td>
                        <td><%=rs.getString("guest_contact") %></td>
                        <td><%=rs.getString("don_date") %></td>
                        <td><%=rs.getString("don_time") %></td>
                        <td><%=type %></td>
                        <td><%=rs.getString("don_worthamt") %></td>
                      
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