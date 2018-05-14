

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
     int charid=Integer.parseInt(""+session.getAttribute("userid"));
    String date="",date1="",time="",complaint="",charname="";
    String str="",sel="";
    ResultSet rs=null;
    LocalDate localDate = LocalDate.now();
    date=DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate);
    date1=DateTimeFormatter.ofPattern("dd/MM/yyy").format(localDate);
    sel="select * from tbl_charitabletrust where chari_id="+charid;
    rs=obj.select(sel);
    if(rs.next()){
        charname=rs.getString("chari_name");
    }
    if(request.getParameter("btnSubmit")!=null){
        time=request.getParameter("txtTime");
        complaint=request.getParameter("txtComplaint");
        str="insert into tbl_complsugg(complsugg_date,complsugg_time,complsugg_text,chari_id)values('"+
                date +"','"+time+"','"+complaint+"',"+charid+")";
        obj.insert(str);
        response.sendRedirect("ChariTrustHome.jsp");
       
    }

 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Residue</title>
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
//document.forms.frmComplaintsandSuggestions.txtTime.value=strTrime;
tt=display_c();
}
</script>
<%@include  file="header.html" %>
    <link rel="stylesheet" type="text/css" href="../mystyle.css"/>
    </head>
    <body onload="display_ct()">
        <form name="frmComplaintsandSuggestions" action="ComplaintsandSuggestions.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="2">Complaints and Suggestions</td>
                       
                    </tr>
                
                     <tr>
                        <td>Charitable Trust</td>
                        <td><%=charname%></td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td><%=date1%></td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td><input type="text" name="txtTime" id="txtTime" value="" required="required"  /></td>
                    </tr>
                    <tr>
                        <td>Complaint and Suggestions</td>
                        <td><textarea name="txtComplaint" rows="3" cols="50" required="required" maxlength="300"></textarea></td>
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
