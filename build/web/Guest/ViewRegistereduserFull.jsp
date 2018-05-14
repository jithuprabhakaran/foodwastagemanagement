

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String sel="";
    String name="",address="",mun="",contact1="",contact2="",email="",adharno="",iname="",iaddress="",icontact="",photo="";
    ResultSet rs=null;
    if(request.getParameter("UId")!=null){
        sel="select * from tbl_reguser,tbl_muncipality where reguser_id="+request.getParameter("UId")+" and tbl_reguser.mun_id=tbl_muncipality.mun_id";
        rs=obj.select(sel);
        if(rs.next()){
            name=rs.getString("reguser_name");
            address=rs.getString("reguser_address");
            mun=rs.getString("mun_name");
            contact1=rs.getString("reguser_contact1");
            contact2=rs.getString("reguser_contact2");
            email=rs.getString("reguser_email");
            adharno=rs.getString("reguser_adharno");
            iname=rs.getString("reguser_intrname");
            iaddress=rs.getString("reguser_intraddress");
            icontact=rs.getString("reguser_intrcontact");
            photo=rs.getString("reguser_photo");
            
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
        <form name="frmRegUserFull" action="ViewRegistereduserFull.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="3">User Details</td>                       
                    </tr>
                
                    <tr>
                        <td width="200">Username</td>
                        <td width="300"><%=name%></td>
                        <td rowspan="10" width="200"><img src="../UserPhoto/<%=photo%>" width="200" height="200"/> </td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%=address%></td>
                    </tr>
                     <tr>
                        <td>Muncipality</td>
                        <td><%=mun%></td>
                    </tr>
                    <tr>
                        <td>Contact No1</td>
                        <td><%=contact1%></td>
                    </tr>
                    <tr>
                        <td>Contact No2</td>
                        <td><%=contact2%></td>
                    </tr>
                    <tr>
                        <td>Adhar No</td>
                        <td><%=adharno%></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%=email%></td>
                    </tr>
                    <tr>
                        <td>Introducer</td>
                        <td><%=iname%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%=iaddress%></td>
                    </tr>
                     <tr>
                        <td>Contact No</td>
                        <td><%=icontact%></td>
                    </tr>
                     
                    
               
            </table>
            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>