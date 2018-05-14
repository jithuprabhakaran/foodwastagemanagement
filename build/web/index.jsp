

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String username="";
    String password="";
    String str="";
    ResultSet rsLogin=null;
    if(request.getParameter("btnLogin")!=null){
        username=request.getParameter("txtUsername");
        password=request.getParameter("txtPassword");
        str="select * from tbl_login where login_name='"+username+"' and login_password='"+password+"'";
        rsLogin=obj.select(str);
        if(rsLogin.next()){
            session.setAttribute("username", rsLogin.getString("login_name"));
            session.setAttribute("userid", rsLogin.getInt("login_id"));
            session.setAttribute("userstatus", "Admin");
            response.sendRedirect("Admin/AdminHome.jsp");
                    
        }
        else{
            str="select * from tbl_charitabletrust where chari_username='"+ username +"' and chari_password='"+password+"' and chari_status='A'";
            rsLogin=obj.select(str);
            if(rsLogin.next()){
                session.setAttribute("username", rsLogin.getString("chari_username"));
                session.setAttribute("userid", rsLogin.getInt("chari_id"));
                session.setAttribute("userstatus", "ChariTrust");
                response.sendRedirect("ChariTrust/ChariTrustHome.jsp");
            }
            else{
                str="select * from tbl_reguser where reguser_username='"+ username +"' and reguser_password='"+password+"' and reguser_status='A'";
                rsLogin=obj.select(str);
                if(rsLogin.next()){
                    session.setAttribute("username", rsLogin.getString("reguser_username"));
                    session.setAttribute("userid", rsLogin.getInt("reguser_id"));
                    session.setAttribute("userstatus", "RegUser");
                    response.sendRedirect("RegUser/RegUserHome.jsp");
                }else{
                str="select * from tbl_guestuser where guest_username='"+ username +"' and guest_password='"+password+"'";
                rsLogin=obj.select(str);
                if(rsLogin.next()){
                    session.setAttribute("username", rsLogin.getString("guest_username"));
                    session.setAttribute("userid", rsLogin.getInt("guest_id"));
                    session.setAttribute("userstatus", "Guest");
                    response.sendRedirect("Guest/GuestHome.jsp");
                }
                else{
                    
                    str="select * from tbl_eventmanager where eventmgr_username='"+ username +"' and eventmgr_password='"+password+"'";
                rsLogin=obj.select(str);
                if(rsLogin.next()){
                    session.setAttribute("username", rsLogin.getString("eventmgr_username"));
                    session.setAttribute("userid", rsLogin.getInt("eventmgr_id"));
                    session.setAttribute("userstatus", "EventMgr");
                    response.sendRedirect("EventMgr/EventMgrHome.jsp");
                }
                }
                
            }
        }
    }
    }
    
 %>
<!DOCTYPE html>
<html>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Residue</title>
        <%@include  file="header.html" %>
        <link rel="stylesheet" type="text/css" href="mystyle.css"/>
    
    <body>
        <form name="frmLogin" action="index.jsp" method="POST">
            <center>
                <table class="CSSTableGenerator">
                
                    <tr>
                        <td colspan="2">Login</td>
                    </tr>
                
                
                    <tr>
                        <td width="200">Username</td>
                        <td width="300"><input type="text" name="txtUsername" value="" size="40" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtPassword" value="" size="40" /></td>
                    </tr>
                    <tr>
                
                        <td colspan="2" ><input type="submit" value="Login" name="btnLogin" /></td>
                       
                    </tr>
            
            </table>
                
            <!--    <table border="1">
                   
                    <tbody>
                        <tr>
                            <td><a href="CharitableTrustReg.jsp"> Charitable Trust Registration</a></td>
                        </tr>
                        <tr>
                            <td><a href="UserRegistration.jsp">User Registration</a></td>
                        </tr>
                         <tr>
                            <td><a href="GuestRegistration.jsp">Guest User Registration</a></td>
                        </tr>
                          <tr>
                              <td><a href="EventManagerRegistration.jsp">Event Manager Registration</a></td>
                        </tr>
                    </tbody>
                </table> -->

            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>