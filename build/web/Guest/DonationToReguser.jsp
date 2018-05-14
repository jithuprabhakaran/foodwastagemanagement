

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
      int guestid=Integer.parseInt(""+session.getAttribute("userid"));
    String sel="",username="",address="",contact="",date="",date1="",time="",type="",str="";
    int uid=0,amt=0;
    ResultSet rs=null;
    LocalDate localDate = LocalDate.now();
    date=DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
    date1=DateTimeFormatter.ofPattern("dd/MM/yyy").format(localDate);
    if(request.getParameter("UId")!=null){
        sel="select * from tbl_reguser where reguser_id="+request.getParameter("UId");
        rs=obj.select(sel);
        if(rs.next()){
            username=rs.getString("reguser_name");
            address=rs.getString("reguser_address");
            contact=rs.getString("reguser_contact1");          
            uid=Integer.parseInt(rs.getString("reguser_id"));
        }
    }
    if(request.getParameter("btnSubmit")!=null){
        uid=Integer.parseInt(request.getParameter("hid"));
        time=request.getParameter("txtTime");
        type=request.getParameter("rdType");
        amt=Integer.parseInt(request.getParameter("txtAmount"));
        str="insert into tbl_donation(guest_id,reguser_id,chari_id,don_date,don_time,don_type,don_worthamt,don_status) values("+
                guestid+","+uid+",0,'"+date+"','"+time+"','"+type+"',"+amt+",'P')";
      
        if(obj.insert(str))
        {
            response.sendRedirect("DonationToReguser.jsp");
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
        <form name="frmDonationToReguser" action="DonationToReguser.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="2">Donation To Registered User</td>
                        
                    </tr>
               
                    <tr>
                        <td width="200">Reg User</td>
                        <td width="350"><%=username%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%=address%></td>
                    </tr>
                    <tr>
                        <td>Contact No</td>
                        <td><%=contact%></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><%=date1 %></td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td><input type="text" name="txtTime" id="txtTime" value="" required="required" /></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><input type="radio" name="rdType" value="A" >Amount</input>
                            <input type="radio" name="rdType" value="S" >Study Materials</input>
                            <input type="radio" name="rdType" value="D" >Dress</input>
                            <input type="radio" name="rdType" value="O" >Others</input>                            
                        
                        </td>
                    </tr>
                     <tr>
                        <td>Worth Amount</td>
                        <td><input type="text" name="txtAmount" value="" required="required" maxlength="50" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right;"><input type="submit" value="Submit" name="btnSubmit" /></td>
                    </tr>
                <input type="hidden" name="hid" id="hid" value="<%=uid%>"/>
                
            </table>
            <Br>
            
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="6">Reguser Details</td>
                      
                    </tr>
                
                    <tr>
                        <td width="200">Username</td>
                        <td width="250">Address</td>
                        <td width="150">Contact No1</td>
                        <td width="150">Contact No2</td>
                        <td width="200">Email</td>
                        <td width="150">Select User</td>
                    </tr>
                    <%
                        sel="select * from tbl_reguser where reguser_status='A'";
                        rs=obj.select(sel);
                        while(rs.next())
                        {
                        %>
                    <tr>
                        <td><%=rs.getString("reguser_name") %></td>
                        <td><%=rs.getString("reguser_address") %></td>
                        <td><%=rs.getString("reguser_contact1") %></td>
                        <td><%=rs.getString("reguser_contact2") %></td>
                        <td><%=rs.getString("reguser_email") %></td>
                        <td><a href="DonationToReguser.jsp?UId=<%=rs.getString("reguser_id") %>">Select User</a></td>
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