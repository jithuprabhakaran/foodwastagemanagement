

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
      int reguserid=Integer.parseInt(""+session.getAttribute("userid"));
    String str="",strTemp="",date="";
    ResultSet rs=null;
    LocalDate localDate = LocalDate.now();
    date=DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);    
    ResultSet rsTemp=null;
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
        <form name="frmFoodSupplyRequest" action="FoodSupplyRequest.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="9">Supply Request For Charitable Trust</td>
                       
                    </tr>
                
                    <tr>
                        <td width="300">Posted By</td>
                        <td width="300">Address</td>
                        <td width="150">Contact No</td>
                        <td width="100">Date</td>
                        <td width="100">Time</td>
                        <td width="100">For Date</td>
                        <td width="400">Details</td> 
                        <td width="50">Type</td>
                        <td width="100">Select Charitable Trust</td>
                       
                    </tr>
                <%
                    str="select * from tbl_fooddetails,tbl_guestuser where fooddet_fordate>='"+date+"' and tbl_guestuser.guest_id=tbl_fooddetails.guest_id and fooddet_id in(select fooddet_id from tbl_foodcollrequest where foodcollreq_status='A')";                   
                    rs=obj.select(str);
                    while(rs.next())
                    {
                    
                    %>
                    <tr>
                        <td><%=rs.getString("guest_name") %></td>
                        <td><%=rs.getString("guest_address") %></td>
                        <td><%=rs.getString("guest_contact") %></td>
                        <td><%=rs.getString("fooddet_date") %></td>
                        <td><%=rs.getString("fooddet_time") %></td>
                        <td><%=rs.getString("fooddet_fordate") %></td>
                        <td><%=rs.getString("fooddet_details") %></td>
                        <td><%=rs.getString("fooddet_type") %></td>
                        <td>
                            <% 
                                int fdetid=Integer.parseInt(rs.getString("fooddet_id"));
                                strTemp="select * from tbl_foodsupplyreq where fooddet_id="+fdetid+" and foodsuppreq_status='A'";
                            rsTemp=obj.select(strTemp);
                            if(rsTemp.next()){
                                %>
                               Accept
                                <%                            
                            
                                }
                            
                             else
                            {
                            
                                strTemp="select * from tbl_foodsupplyreq where fooddet_id="+fdetid+" and foodsuppreq_status='P'";
                                 rsTemp=obj.select(strTemp);
                                if(rsTemp.next())
                                {%>
                                Request Sent
                               <% }
else{
%>
<a href="FoodSupplyRequest1.jsp?FDId=<%= fdetid %>">Select Charitable Trust</a>
<%
}
                            }
                                
                                                          
                                
                            %>
                         
                        
                        </td>
                        
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