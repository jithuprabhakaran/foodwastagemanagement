

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String name="",address="",contactno="",email="",username="",password="",str="";
     String msg=" ";
     ResultSet rs=null;
    if(request.getParameter("btnSubmit")!=null){
        name=request.getParameter("txtName");
        address=request.getParameter("txtAddress");
        contactno=request.getParameter("txtContactno");
        email=request.getParameter("txtEmail");
        username=request.getParameter("txtUsername");
        password=request.getParameter("txtPassword");
        str="insert into tbl_eventmanager(eventmgr_name,eventmgr_address,eventmgr_contactno,eventmgr_email,eventmgr_username,eventmgr_password) values('"+
                name+"','"+address+"','"+contactno+"','"+email+"','"+username+"','"+password+"')";
         str="select * from tbl_login where login_name='"+username+"' and login_password='"+password+"'";
        rs=obj.select(str);
        if(!rs.next())
        {
            str="select * from tbl_charitabletrust where chari_username='"+username+"' and chari_password='"+password+"'";
            rs=obj.select(str);
            if(!rs.next()){
                str="select * from tbl_reguser where reguser_username='"+username+"' and reguser_password='"+password+"'";
                rs=obj.select(str);
                if(!rs.next())
                {
                    str="select * from tbl_guestuser where guest_username='"+username+"' and guest_password='"+password+"'";
                    rs=obj.select(str);
                    if(!rs.next()){
                        str="select * from tbl_eventmanager where eventmgr_username='"+ username+"' and eventmgr_password='"+password + "'";
                        rs=obj.select(str);
                        if(!rs.next()){
                            
                            if(obj.insert(str)){
                                response.sendRedirect("index.jsp");
                            }
                        }
                        else{
                            msg="Username and Password Already Exists!!!!"; 
                        }
                         }
                      else{
                        msg="Username and Password Already Exists!!!!";
                    }
                }
                else{
                     msg="Username and Password Already Exists!!!!";
                }
            }
            else{
                msg="Username and Password Already Exists!!!!";
            }   
           
        }
        else{
            msg="Username and Password Already Exists!!!!";
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Residue</title>
        <%@include  file="header.html" %>
          <link rel="stylesheet" type="text/css" href="mystyle.css"/>
    </head>
    <body>
        <form name="frmEventMgrRegistration" action="EventManagerRegistration.jsp" method="POST">
            <center>
                <table class="CSSTableGenerator2">
              
                    <tr>
                        <td colspan="2">Event Manager Registration</td>                       
                    </tr>
                
                
                    <tr>
                        <td width="100">Name</td>
                        <td width="300"><input type="text" name="txtName" value="" size="30" required="required" maxlength="50" /></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="txtAddress" value="" size="30" required="required" maxlength="100"  /></td>
                    </tr>
                    <tr>
                        <td>Contact No</td>
                        <td><input type="tele" name="txtContactno" pattern="[789][0-9]{9}" value="" size="30" required="required"   /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="txtEmail" value="" size="30" required="required" maxlength="30"  /></td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="txtUsername" value="" size="30" required="required" maxlength="50"  /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtPassword" value="" size="30" required="required" maxlength="50"  /></td>
                    </tr>
                      <tr>
                          <td colspan="2" style="text-align: right;"><input type="submit" value="Submit" name="btnSubmit" /></td>
                       
                    </tr>
                    <tr>
                        <td colspan="2"><div style="color:red; text-align:center;font-weight: bold; "><%=msg%></div></td>
                    </tr>
               
            </table>
  </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>
