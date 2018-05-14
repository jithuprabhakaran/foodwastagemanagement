

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    int reguserid=Integer.parseInt(""+session.getAttribute("userid"));
    String str="",date="",username="",address="",contactno="",details="",time="",date1="";
    int fid=0;
    ResultSet rs=null;
    LocalDate localDate = LocalDate.now();
    date=DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
    if(request.getParameter("FId")!=null){
        str="select * from tbl_fooddetails,tbl_guestuser where tbl_fooddetails.guest_id=tbl_guestuser.guest_id and fooddet_id="+request.getParameter("FId");
        rs=obj.select(str);
        if(rs.next()){
            username=rs.getString("guest_name");
            address=rs.getString("guest_address");
            contactno=rs.getString("guest_contact");
            details=rs.getString("fooddet_details");
            fid=Integer.parseInt(rs.getString("fooddet_id"));
        }
    }
    if(request.getParameter("btnSubmit")!=null){
       
        date1=request.getParameter("txtDate");
        time=request.getParameter("txtTime");
        fid=Integer.parseInt(request.getParameter("hid"));
       
           str="insert into tbl_foodcollection(fooddet_id,reguser_id,foodcoll_date,foodcoll_time) values(" + fid+","+reguserid+",'"+date1+"','"+time+"')";
           
            if(obj.insert(str)){
                response.sendRedirect("FoodCollectionDetails.jsp");
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
        <form name="frmFoodCollection" action="FoodCollectionDetails.jsp" method="POST">
      
         <center>
           
             <table class="CSSTableGenerator2">
                     <tr>
                         <td colspan="2">Food Collection Details</td>
                         
                     </tr>
                 
                     <tr>
                         <td width="200">Posted By</td>
                         <td width="300"><%=username%></td>
                     </tr>
                     <tr>
                         <td>Address</td>
                         <td><%=address%></td>
                     </tr>
                     <tr>
                         <td>Contact No</td>
                         <td><%=contactno %></td>
                     </tr>
                      <tr>
                         <td>Details</td>
                         <td><%=details%></td>
                     </tr>
                      <tr>
                         <td>Date</td>
                         <td><input type="date" name="txtDate" value="" required="required" /></td>
                     </tr>
                      <tr>
                         <td>Time</td>
                         <td><input type="time" name="txtTime" value="" required="required" /></td>
                     </tr>
                     <tr style="text-align: right;">
                          <td colspan="2"><input type="submit" value="Submit" name="btnSubmit" id="btnSubmit" /></td> 
                     </tr>
                 <input type="hidden" name="hid" id="hid" value="<%=fid%>"/>
                 
             </table>

             
             <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="9">Food Details</td>                       
                    </tr>
                
                    <tr>
                        <td width="300">Posted By</td>
                        <td width="300">Address</td>
                        <td width="150">Contact No</td>
                        <td width="100">Date</td>
                        <td width="100">Time</td>
                        <td width="100">For Date</td>
                        <td width="300">Details</td> 
                        <td width="50">Type</td>
                        <td width="200">Food Collection Details</td>
                       
                    </tr>
                <%
                    str="select * from tbl_fooddetails,tbl_guestuser where fooddet_fordate>='"+date+"' and tbl_guestuser.guest_id=tbl_fooddetails.guest_id and fooddet_id in(select fooddet_id from tbl_foodcollrequest where foodcollreq_status='A') and fooddet_id not in (select fooddet_id from tbl_foodcollection)";                   
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

                            <a href="FoodCollectionDetails.jsp?FId=<%=rs.getString("fooddet_id")%>">Food Collection Details</a>
                          
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