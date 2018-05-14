

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String name="",  address="",contact="",email="",username="",password="",msg="",str="";
    ResultSet rs=null;
    if(request.getParameter("btnSubmit")!=null){
      name=request.getParameter("txtName");
      address=request.getParameter("txtAddress");
      contact=request.getParameter("txtContact");
      email=request.getParameter("txtEmail");
      username=request.getParameter("txtUsername");
      password=request.getParameter("txtPassword");
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
                            str="insert into tbl_guestuser(guest_name,guest_address,guest_contact,guest_email,guest_username,guest_password)values('" +
                                    name +"','"+address+"','"+contact+"','"+email+"','"+username+"','"+password+"')";
                            out.println(str);
                            obj.insert(str);
                            response.sendRedirect("index.jsp");
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
        <div align="center">
        <form name="frmGuest" action="GuestRegistration.jsp" method="POST">
            <table class="CSSTableGenerator2">
               
                    <tr>
                        <td colspan="2">Guest Registration</td>
                       
                    </tr>
               
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txtName" value="" size="40" required="required" maxlength="40" /></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea name="txtAddress" rows="4" cols="40" required="required" maxlength="100" size="40" ></textarea></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><input type="tele" pattern="[789][0-9]{9}" name="txtContact" value="" required="required" size="40" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="txtEmail" value="" required="required" maxlength="30" size="40" /></td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="txtUsername" value="" required="required" maxlength="30" size="40" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtPassword" value="" required="required" maxlength="30" size="40" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit" name="btnSubmit" /></td>
                        
                    </tr>
                    <tr>
                        <td colspan="2"><div style="color:red; text-align:center;font-weight: bold; "><%=msg%></div></td>
                    </tr>
      
            </table>

        </form>
        </div>
    </body>
</html>
<%@include  file="footer.html" %>
