

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    int guestid=Integer.parseInt(""+session.getAttribute("userid"));
    String str="";
    ResultSet rs=null;
    if(request.getParameter("AId")!=null){
        str="update tbl_foodcollrequest set foodcollreq_status='A' where foodcollreq_id="+request.getParameter("AId");
        obj.insert(str);
        response.sendRedirect("ViewFoodCollectonRequest.jsp");
    }
     if(request.getParameter("RId")!=null){
        str="update tbl_foodcollrequest set foodcollreq_status='R' where foodcollreq_id="+request.getParameter("RId");
        obj.insert(str);
        response.sendRedirect("ViewFoodCollectonRequest.jsp");
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
        <form name="frmFoodCollectionRequest" action="ViewFoodCollectonRequest.jsp">
            <center>
                <table class="CSSTableGenerator2">
                        <tr>
                            <td colspan="8">Food Collection Request</td>
                          
                        </tr>
                    
                        <tr>
                            <td width="150">Username</td>
                            <td width="200">Address</td>
                            <td width="100">Contact No1</td>
                            <td width="100">Contact No2</td>
                            <td width="100">For Date</td>
                            <td width="300">Food Details</td>
                            <td width="100">Accept</td>
                            <td width="100">Reject</td>
                        </tr>
                        <%
                            str="select * from tbl_fooddetails,tbl_foodcollrequest,tbl_reguser where guest_id="+guestid+
                                    " and tbl_fooddetails.fooddet_id=tbl_foodcollrequest.fooddet_id and tbl_foodcollrequest.reguser_id=tbl_reguser.reguser_id and foodcollreq_status='P' and tbl_fooddetails.fooddet_id not in(select fooddet_id from tbl_foodcollrequest where foodcollreq_status='A')";
                            rs=obj.select(str);
                            while(rs.next())
                            {
                            %>
                        <tr>
                            <td><%=rs.getString("reguser_name") %></td>
                            <td><%=rs.getString("reguser_address") %></td>
                            <td><%=rs.getString("reguser_contact1")%></td>
                            <td><%=rs.getString("reguser_contact2") %></td>
                            <td><%=rs.getString("fooddet_fordate") %></td>
                            <td><%=rs.getString("fooddet_details") %></td>
                            <td><a href="ViewFoodCollectonRequest.jsp?AId=<%=rs.getString("foodcollreq_id")%>">Accept</a></td>
                            <td><a href="ViewFoodCollectonRequest.jsp?RId=<%=rs.getString("foodcollreq_id")%>">Rejects</a></td>
                        </tr>
                        <%}
                        %>
                    
                </table>

                
            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>