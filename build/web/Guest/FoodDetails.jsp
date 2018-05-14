

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
     int guestid=Integer.parseInt(""+session.getAttribute("userid"));
     String str="",details="",time="",date="",name="",address="",contact="",fordate="",type="";
     ResultSet rs=null;
     LocalDate localDate = LocalDate.now();
    date=DateTimeFormatter.ofPattern("dd/MM/yyy").format(localDate);
     str="select * from tbl_guestuser where guest_id="+guestid;
     rs=obj.select(str);
     if(rs.next()){
         name=rs.getString("guest_name");
         address=rs.getString("guest_address");
         contact=rs.getString("guest_contact");
     }
     if(request.getParameter("btnSubmit")!=null){
         time=request.getParameter("txtTime");
         details=request.getParameter("txtFoodDetails");
         date=DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
         fordate=request.getParameter("txtDate");
         type=request.getParameter("rdFoodType");
         str="insert into tbl_fooddetails(fooddet_date,fooddet_time,fooddet_details,guest_id,fooddet_fordate,fooddet_type)values('"+date+"','"+time+"','"+details+"',"+guestid+",'"+fordate+"','" + type+"')";
       //  out.println(str);
         obj.insert(str);
         response.sendRedirect("GuestHome.jsp");
     }
    
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Residue</title>
        <%@include  file="header.html" %>
         <link rel="stylesheet" type="text/css" href="../mystyle.css"/>
        <script type="text/javascript"> 
function display_c(){
var refresh=1000; // Refresh rate in milli seconds
mytime=setTimeout('display_ct()',refresh)
}


function display_ct() {
var strcount
var x = new Date()
var x1=x.getMonth() + "/" + x.getDate() + "/" + x.getYear(); 
var x2 =  x.getHours( )+ ":" + x.getMinutes() + ":" + x.getSeconds();

  var date=new Date();
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var seconds= date.getSeconds();
  var ampm = hours >= 12 ? 'pm' : 'am';
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? '0'+minutes : minutes;
  seconds=seconds<10?'0'+seconds : seconds
  var strTime = hours + ':' + minutes + ':' + seconds + ' ' + ampm;
  

//document.getElementById('t1').value=x1;
document.getElementById('txtTime').value=strTime;
tt=display_c();
}
</script>
    </head>
    <body onload="display_ct()">
        <form name="frmFoodDetails" action="FoodDetails.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="2">Food Details</td>
                       
                    </tr>
                
                    <tr>
                        <td>User</td>
                        <td><%= name %></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%= address %></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><%= contact %></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><%=date%></td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td><input type="text" name="txtTime" id="txtTime" value="" required="required" /></td>
                    </tr>
                     <tr>
                        <td>For Date</td>
                        <td><input type="date" name="txtDate" id="txtDate" value="" required="required" /></td>
                    </tr>
                    <tr>
                        <td>Food Details</td>
                        <td><textarea name="txtFoodDetails" rows="4" cols="40" required="required" maxlength="200"></textarea></td>
                    </tr>
                    <tr>
                        <td>Food Type</td>
                        <td><input type="radio" name="rdFoodType" value="V" >Veg</input>
                        <input type="radio" name="rdFoodType" value="N" >NonVeg</input>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit" name="btnSubmit" /></td>
                        
                    </tr>
                
            </table>
            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>