
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String sel="";
    ResultSet rs=null;
    String name="",address="",mun="",contact1="",contact2="",email="",website="",aname="",aaddress="",acontact="";
    if(request.getParameter("CId")!=null){
        sel="select * from tbl_charitabletrust,tbl_muncipality where tbl_charitabletrust.mun_id=tbl_muncipality.mun_id";
        rs=obj.select(sel);
        if(rs.next()){
            name=rs.getString("chari_name");
            address=rs.getString("chari_address");
            contact1=rs.getString("chari_contact1");
            contact2=rs.getString("chari_contact2");
            email=rs.getString("chari_email");
            website=rs.getString("chari_website");
            aname=rs.getString("chari_authorityname");
            aaddress=rs.getString("chari_authorityaddress");
            acontact=rs.getString("chari_authoritycontact");
            mun=rs.getString("mun_name");
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
        <form name="frmCharitableFull" action="ViewCharitableTrustFull.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="2">Charitable Trust</td>                        
                    </tr>
                
                    <tr>
                        <td width="200">Name</td>
                        <td width="300"><%=name%></td>
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
                        <td>Email</td>
                        <td><%=email%></td>
                    </tr>
                    <tr>
                        <td>Website</td>
                        <td><%=website%></td>
                    </tr>
                    <tr>
                        <td>Authority</td>
                        <td><%=aname%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%=aaddress%></td>
                    </tr>
                    <tr>
                        <td>Contact No</td>
                        <td><%=acontact%></td>
                    </tr>
                
            </table>
            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>
