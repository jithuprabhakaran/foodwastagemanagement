

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
      int reguserid=Integer.parseInt(""+session.getAttribute("userid"));
    String str="",username="",details="",date="",time="",feedback="",chariturst="";
    int fid=0,fsrid=0;
    ResultSet rs=null;
    if(request.getParameter("FId")!=null){
        fid=Integer.parseInt(request.getParameter("FId"));
        str="select * from tbl_fooddetails,tbl_guestuser,tbl_foodsupplyreq,tbl_charitabletrust where tbl_fooddetails.fooddet_id="+fid +" and tbl_fooddetails.guest_id=tbl_guestuser.guest_id and tbl_fooddetails.fooddet_id=tbl_foodsupplyreq.fooddet_id and tbl_foodsupplyreq.chari_id=tbl_charitabletrust.chari_id";
        rs=obj.select(str);
        if(rs.next()){
            username=rs.getString("guest_name");
            details=rs.getString("fooddet_details");
            chariturst=rs.getString("chari_name");      
            fsrid=Integer.parseInt(rs.getString("foodsuppreq_id"));
        }
    }
    
if(request.getParameter("btnSubmit")!=null){
    fsrid=Integer.parseInt(request.getParameter("hid"));
    date=request.getParameter("txtDate");
    time=request.getParameter("txtTime");
    feedback=request.getParameter("txtFeedback");
    str="insert into tbl_foodsupplydet(foodsuppreq_id,foodsupplydet_date,foodsupplydet_time,foodsupplydet_feedback) values("+
            fsrid+",'"+date+"','"+time+"','"+feedback+"')";
    if(obj.insert(str)){
        request.getParameter("FoodSupplyDetails.jsp");
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
        <form name="frmFoodSupplyDetails" action="FoodSupplyDetails.jsp">
             <center>
                 
                 <table class="CSSTableGenerator2">
                         <tr>
                             <td colspan="2">Food Supply Details</td>
                           
                         </tr>
                     
                         <tr>
                             <td width="200">Posted By</td>
                             <td width="300"><%=username %></td>
                         </tr>
                         <tr>
                             <td>Food Details</td>
                             <td><%=details %></td>
                         </tr>
                         <tr>
                             <td>Charitable Trust</td>
                             <td><%=chariturst %></td>
                         </tr>
                         <tr>
                             <td>Date</td>
                             <td><input type="date" name="txtDate" value="" required="required" /></td>
                         </tr>
                         <tr>
                             <td>Time</td>
                             <td><input type="time" name="txtTime" value="" required="required" /></td>
                         </tr>
                         <tr>
                             <td>Feedback</td>
                             <td><textarea name="txtFeedback" rows="3" cols="50" required="required" maxlength="200" ></textarea></td>
                         </tr>
                         <tr>
                             <td colspan="2" style="text-align: right;"><input type="submit" value="Submit" name="btnSubmit" /></td>
                     <input type="hidden" id="hid" name="hid" value="<%=fsrid %>"/>
                         </tr>
                     
                 </table>

                 
                 
                 <br>
                 
                 
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="7">Food Supply Details</td>
                       
                    </tr>
               
                    <tr>
                        <td width="250">Posted By</td>
                        <td width="250">Address</td>
                        <td width="150">Contact No</td>
                        <td width="100">Date</td>                      
                        <td width="300">Details</td> 
                        <td width="200">Charitable Trust</td>
                        <td width="150">Food Supply Details</td>
                       
                    </tr>
                <%
                    str="select * from tbl_fooddetails,tbl_guestuser,tbl_foodsupplyreq,tbl_charitabletrust,tbl_foodcollection where tbl_guestuser.guest_id=tbl_fooddetails.guest_id and tbl_foodsupplyreq.fooddet_id=tbl_fooddetails.fooddet_id and tbl_foodsupplyreq.chari_id=tbl_charitabletrust.chari_id and foodsuppreq_status='A' and tbl_foodcollection.fooddet_id=tbl_fooddetails.fooddet_id and tbl_foodcollection.reguser_id="+reguserid +" and foodsuppreq_id not in(select foodsuppreq_id from tbl_foodsupplydet)";
                   
                    rs=obj.select(str);
                    while(rs.next())
                    {
                    
                    %>
                    <tr>
                        <td><%=rs.getString("guest_name") %></td>
                        <td><%=rs.getString("guest_address") %></td>
                        <td><%=rs.getString("guest_contact") %></td>
                        <td><%=rs.getString("fooddet_fordate") %></td>                        
                        <td><%=rs.getString("fooddet_details") %></td>
                        <td><%=rs.getString("chari_name") %></td>
                        <td>                      
<a href="FoodSupplyDetails.jsp?FId=<%= rs.getString("fooddet_id") %>">Food Supply Details</a>

                        
                        </td>
                        
                    </tr>
                    <%
                        
                        }
                        %>
               
            </table>
            </center>
    </body>
</html>
<%@include  file="footer.html" %>