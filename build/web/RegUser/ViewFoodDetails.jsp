

<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
   int reguserid=Integer.parseInt(""+session.getAttribute("userid"));
    String str="",date="",tm="";
    ResultSet rs=null;
     LocalDate localDate = LocalDate.now();
    date=DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
   GregorianCalendar gcalendar = new GregorianCalendar();
    tm=String.valueOf(gcalendar.get(Calendar.HOUR))+":"+String.valueOf(gcalendar.get(Calendar.MINUTE))+":"+String.valueOf(gcalendar.get(Calendar.SECOND));
    
    if(request.getParameter("FId")!=null){
        str="insert into tbl_foodcollrequest(fooddet_id,foodcollreq_date,foodcollreq_time,foodcollreq_status,reguser_id)values("+
                request.getParameter("FId")+",'"+date+"','"+tm+"','P',"+reguserid+")";
        out.println(str);
        obj.insert(str);
        response.sendRedirect("ViewFoodDetails.jsp");
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
        <form name="frmViewFoodDetails" action="ViewFoodDetails.jsp">
            <center>
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
                        <td width="400">Details</td> 
                        <td width="50">Type</td>
                        <td width="100">Send Request</td>
                       
                    </tr>
                <%
                    str="select * from tbl_fooddetails,tbl_guestuser where fooddet_fordate>='"+date+"' and tbl_guestuser.guest_id=tbl_fooddetails.guest_id and fooddet_id not in(select fooddet_id from tbl_foodcollrequest where foodcollreq_status='A')";                   
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
                            <% str="select * from tbl_foodcollrequest where reguser_id="+reguserid+" and fooddet_id="+rs.getString("fooddet_id");
                            ResultSet rsTemp=obj.select(str);
                            if(rsTemp.next()){
                                %>
                                Request Sent
                                <%
                            }
                            else
                            {
                            %>

                            <a href="ViewFoodDetails.jsp?FId=<%=rs.getString("fooddet_id")%>">Send Request</a>
                            <%
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