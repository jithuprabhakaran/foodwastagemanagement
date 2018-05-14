

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    int eventmgrid=Integer.parseInt(""+session.getAttribute("userid"));
    String sel="",eventmgr="",date="",time="",event="",str="",date1="";
    LocalDate date2;
    Date dt1,dt2;
    ResultSet rs=null;
    LocalDate localDate = LocalDate.now();
    date=DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate); 
  
    sel="select * from tbl_eventmanager where eventmgr_id="+eventmgrid;
    rs=obj.select(sel);
    if(rs.next()){
        eventmgr=rs.getString("eventmgr_name");        
    }
    if(request.getParameter("btnSubmit")!=null){
        date1=request.getParameter("txtDate");
        time=request.getParameter("txtTime");
        event=request.getParameter("txtEvent"); 
       
        
        str="insert into tbl_events(event_name,eventmgr_id,event_date,event_time)values('"+event+"',"+eventmgrid+",'"+date1+"','"+time+"')";
       
        obj.insert(str);
         response.sendRedirect("EventMgrHome.jsp");
        
        
        
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
        <form name="frmEventRegistration" action="EventRegistration.jsp" method="POST">
            <center>
                <table class="CSSTableGenerator2">
                
                    <tr>
                        <td colspan="2">Event Registration</td>                       
                    </tr>
                
                    <tr>
                        <td width="200">Event Manager</td>
                        <td width="300"><%=eventmgr%></td>
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
                        <td>Event</td>
                        <td><input type="text" name="txtEvent" value="" required="required" maxlength="50" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right;"><input type="submit" value="Submit" name="btnSubmit" /></td>
                    </tr>
                
            </table>
            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>
