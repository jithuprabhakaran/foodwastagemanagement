

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String str="",date="";
    int chariid=Integer.parseInt(""+session.getAttribute("userid"));
    ResultSet rs=null;
     LocalDate localDate = LocalDate.now();
    date=DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);    
    if(request.getParameter("AId")!=null){
        str="update tbl_foodsupplyreq set foodsuppreq_status='A'  where foodsuppreq_id="+request.getParameter("AId");
        if(obj.insert(str)){
            response.sendRedirect("AcceptRejectFoodSupplyRequest.jsp");
        }
    }
      if(request.getParameter("RId")!=null){
        str="update tbl_foodsupplyreq set foodsuppreq_status='R'  where foodsuppreq_id="+request.getParameter("RId");
        if(obj.insert(str)){
            response.sendRedirect("AcceptRejectFoodSupplyRequest.jsp");
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
        <form name="frmAccRejFoodSupplyRequest" action="AcceptRejectFoodSupplyRequest.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="8">Food Supply Request</td>                        
                    </tr>
               
                    <tr>
                        <td width="100">Date</td>
                        <td width="100">Food Type</td>
                        <td width="300">Food Details</td>
                        <td width="200">User</td>
                        <td width="300">Address</td>
                        <td width="200">Contact No</td>
                        <td width="100">Accept</td>
                        <td width="100">Reject</td>
                    </tr>
                    <%
                        str="select * from tbl_foodsupplyreq,tbl_fooddetails,tbl_reguser,tbl_foodcollrequest where foodsuppreq_status='P' and tbl_foodsupplyreq.fooddet_id=tbl_fooddetails.fooddet_id and tbl_foodsupplyreq.fooddet_id=tbl_foodcollrequest.fooddet_id and tbl_foodcollrequest.reguser_id=tbl_reguser.reguser_id and tbl_foodsupplyreq.chari_id="+chariid+" and fooddet_fordate>='"+date+"'";                       
                       
                        rs=obj.select(str);
                        while(rs.next())
                        {
                        
                        %>
                    <tr>
                        <td><%=rs.getString("fooddet_fordate")%></td>
                        <td><%=rs.getString("fooddet_type") %></td>
                        <td><%=rs.getString("fooddet_details") %></td>
                        <td><%=rs.getString("reguser_name") %></td>
                        <td><%=rs.getString("reguser_address") %></td>
                        <td><%=rs.getString("reguser_contact1") %></td>
                        <td><a href="AcceptRejectFoodSupplyRequest.jsp?AId=<%=rs.getString("foodsuppreq_id") %>">Accept</a></td>
                        <td><a href="AcceptRejectFoodSupplyRequest.jsp?RId=<%=rs.getString("foodsuppreq_id") %>">Reject</a></td>
                    </tr>
                    <%
                        }
                        %>
                  
                </tbody>
            </table>
                        <br>
                        <br>
                          <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="6">Coming Food Supply Details</td>                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="100">Date</td>
                        <td width="100">Food Type</td>
                        <td width="300">Food Details</td>
                        <td width="200">User</td>
                        <td width="300">Address</td>
                        <td width="200">Contact No</td>
                       
                    </tr>
                    <%
                        str="select * from tbl_foodsupplyreq,tbl_fooddetails,tbl_reguser,tbl_foodcollrequest where foodsuppreq_status='A' and tbl_foodsupplyreq.fooddet_id=tbl_fooddetails.fooddet_id and tbl_foodsupplyreq.fooddet_id=tbl_foodcollrequest.fooddet_id and tbl_foodcollrequest.reguser_id=tbl_reguser.reguser_id and tbl_foodsupplyreq.chari_id="+chariid+" and fooddet_fordate>='"+date+"'";                       
                       
                        rs=obj.select(str);
                        while(rs.next())
                        {
                        
                        %>
                    <tr>
                        <td><%=rs.getString("fooddet_fordate")%></td>
                        <td><%=rs.getString("fooddet_type") %></td>
                        <td><%=rs.getString("fooddet_details") %></td>
                        <td><%=rs.getString("reguser_name") %></td>
                        <td><%=rs.getString("reguser_address") %></td>
                        <td><%=rs.getString("reguser_contact1") %></td>
                      
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
