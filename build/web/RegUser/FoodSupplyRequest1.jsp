

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String str="",gname="",gaddress="",gcontact="",fordate="",cname="",ccontact1="",ccontact2="";
    String msg="";
    ResultSet rs=null;
    int fdid=0,cid=0;
    if(request.getParameter("FDId")!=null){
        str="select * from tbl_fooddetails,tbl_guestuser where tbl_fooddetails.guest_id=tbl_guestuser.guest_id and fooddet_id="+request.getParameter("FDId");
        rs=obj.select(str);
        if(rs.next()){
            gname=rs.getString("guest_name");
            gaddress=rs.getString("guest_address");
            gcontact=rs.getString("guest_contact");
            fordate=rs.getString("fooddet_fordate");
        }        
    }
    if(request.getParameter("CId")!=null){
        str="select * from tbl_charitabletrust where chari_id="+request.getParameter("CId");
        rs=obj.select(str);
        if(rs.next()){
            cname=rs.getString("chari_name");
            ccontact1=rs.getString("chari_contact1");
            ccontact2=rs.getString("chari_contact2");
            
        }        
    }
    if(request.getParameter("btnSubmit")!=null){
        fdid=Integer.parseInt(request.getParameter("fdid"));
        cid=Integer.parseInt(request.getParameter("cid"));       
        
        if(fdid!=0 && cid!=0){
            str="insert into tbl_foodsupplyreq(fooddet_id,chari_id,foodsuppreq_status)values(" + fdid + "," + cid+",'P')" ;
            if(obj.insert(str)){
                response.sendRedirect("ViewFoodDetails.jsp");
            }
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
        <form name="frmFoodSupplyRequest1" action="FoodSupplyRequest1.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="2">Food Supply Request</td>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="200">Posted By</td>
                        <td width="300"><%=gname%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%=gaddress%></td>
                    </tr>
                    <tr>
                        <td>Contact No</td>
                        <td><%=gcontact%></td>
                    </tr>
                    <tr>
                        <td>For Date</td>
                        <td><%=fordate%></td>
                    </tr>
                    <tr>
                        <td>Charitable Trust</td>
                        <td><%=cname %></td>
                    </tr>
                    <tr>
                        <td>Contact No1</td>
                        <td><%=ccontact1 %></td>
                    </tr>
                    <tr>
                        <td>Contact No2</td>
                        <td><%=ccontact2 %></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:right" ><input type="submit" value="Submit" name="btnSubmit" /></td>                        
                    </tr>
                <input type="hidden" name="fdid" id="fdid" value="<%= request.getParameter("FDId") %>"/>
                <input type="hidden" name="cid" id="cd" value="<%= request.getParameter("CId") %>"/>
                
            </table>
                <p> &nbsp; </p>
                    <table class="CSSTableGenerator2">
                            <tr>
                                <td colspan="5">Charitable Trusts</td>
                               
                            </tr>
                        
                            <tr>
                                <td width="250">Name</td>
                                <td width="350">Address</td>
                                <td width="150">Contact No1</td>
                                <td width="150">Contact No2</td>
                                <td width="200">Select</td>
                            </tr>
                            <%
                                str="select * from tbl_charitabletrust where chari_status='A'";
                                rs=obj.select(str);
                                while(rs.next())
                                {
                                
                                %>
                            <tr>
                                <td><%= rs.getString("chari_name") %></td>
                                <td><%= rs.getString("chari_address") %></td>
                                <td><%= rs.getString("chari_contact1") %></td>
                                <td><%= rs.getString("chari_contact2") %></td>
                                <td><a href="FoodSupplyRequest1.jsp?CId=<%=rs.getString("chari_id") %>&FDId=<%=request.getParameter("FDId") %>">Select Charitable Trust </a></td>
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