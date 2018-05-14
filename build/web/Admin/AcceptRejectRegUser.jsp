
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    int reguserid=0;
    int hid=0;    
    String str="";
    String name="",address="",contact1="",contact2="",adharno="",photo="",email="",intrname="",intraddress="",intrcontact="",muncipality="",state="",district="";
    ResultSet  rsreguser=null;
    if(request.getParameter("UId")!=null){
        str="select * from tbl_reguser,tbl_muncipality,tbl_district,tbl_state where tbl_reguser.mun_id=tbl_muncipality.mun_id and tbl_muncipality.dist_id=tbl_district.dist_id and tbl_district.state_id=tbl_state.state_id and reguser_id="+request.getParameter("UId");
        rsreguser=obj.select(str);
        if (rsreguser.next())
        {
            reguserid=Integer.parseInt(rsreguser.getString("reguser_id"));
            name=rsreguser.getString("reguser_name");
            address=rsreguser.getString("reguser_address");
            contact1=rsreguser.getString("reguser_contact1");
            contact2=rsreguser.getString("reguser_contact2");
            adharno=rsreguser.getString("reguser_adharno");
            photo=rsreguser.getString("reguser_photo");
            email=rsreguser.getString("reguser_email");
            intrname=rsreguser.getString("reguser_intrname");
            intraddress=rsreguser.getString("reguser_intraddress");
            intrcontact=rsreguser.getString("reguser_intrcontact");
            muncipality=rsreguser.getString("mun_name");
            district=rsreguser.getString("dist_name");
            state=rsreguser.getString("state_name");
        }
    }
          if(request.getParameter("AId")!=null){
        
        str="update tbl_reguser set reguser_status='A' where reguser_id="+request.getParameter("AId");
        obj.insert(str);
        response.sendRedirect("AcceptRejectRegUser.jsp");    
    }
    if(request.getParameter("RId")!=null){
        
        str="update tbl_reguser set reguser_status='R' where reguser_id="+request.getParameter("RId");
        obj.insert(str);
        response.sendRedirect("AcceptRejectRegUser.jsp");
    
    }
    
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Residue</title>
        <%@include  file="header.html" %>
            <link rel="stylesheet" type="text/css" href="../mystyle.css"/>
    </head>
    <body>
        <form name="frmAcceptRejectReguser" action="AcceptRejectRegUser.jsp" method="POST">
            <center>
                <table class="CSSTableGenerator2">
                        <tr>
                            <td colspan="3">User Details</td>
                            
                        </tr>
                    
                        <tr>
                            <td width="200">Name</td>
                            <td width="300"><%=name %></td>
                            <td rowspan="13"><img src="..\\UserPhoto\\<%=photo%>" width="200" height="200"></img></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><%=address %></td>
                        </tr>
                        <tr>
                            <td>Contact1</td>
                            <td><%=contact1 %></td>
                        </tr>
                        <tr>
                            <td>Contact2</td>
                            <td><%=contact2 %></td>
                        </tr>
                        <tr>
                            <td>Adhar No</td>
                            <td><%=adharno %></td>
                            
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><%=email %></td>
                           
                        </tr>
                        <tr>
                            <td>Introducer Name</td>
                            <td><%=intrname %></td>
                            
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><%=intraddress %></td>
                          
                        </tr>
                        <tr>
                            <td>Contact No</td>
                            <td><%=intrcontact %></td>
                           
                        </tr>
                        <tr>
                            <td>State</td>
                            <td><%=state %></td>
                            
                        </tr>
                         <tr>
                            <td>District</td>
                            <td><%=district %></td>
                         
                        </tr>
                         <tr>
                            <td>Muncipality</td>
                            <td><%=muncipality %></td>
                           
                        </tr>
                        <tr>
                            <td><a href="AcceptRejectRegUser.jsp?AId=<%= reguserid %>">Accept</a></td>
                            <td><a href="AcceptRejectRegUser.jsp?RId=<%= reguserid %>">Reject</a></td>
                        </tr>
               
                </table>
                        <p> &nbsp; </p>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="7">Registeration Request</td>
                        
                    </tr>
                
                    <tr>
                        <td width="200">Name</td>
                        <td width="300">Address</td>
                        <td width="150">Contact No</td>
                        <td width="200">Email</td>
                        <td width="200">Introducer</td>
                        <td width="150">Introducer Contact</td>
                        <td width="150">View Full Details</td>
                    </tr>
                    <%
                        String selreguser="select * from tbl_reguser where reguser_status='P'";
                        rsreguser=obj.select(selreguser);
                        while(rsreguser.next())
                        {
                        %>
                    <tr>
                        <td><%=rsreguser.getString("reguser_name") %></td>
                        <td><%=rsreguser.getString("reguser_address") %></td>
                        <td><%=rsreguser.getString("reguser_contact1") %></td>
                        <td><%=rsreguser.getString("reguser_email") %></td>
                        <td><%=rsreguser.getString("reguser_intrname") %></td>
                        <td><%=rsreguser.getString("reguser_intrcontact") %></td>
                        <td><a href="AcceptRejectRegUser.jsp?UId=<%=rsreguser.getString("reguser_id")%>">View Full Details</a> </td>
                    </tr>
                    <%}
                        %>
               
            </table>
                <br>
                
         <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="7">Accepted Users</td>
                        
                    </tr>
               
                    <tr>
                        <td width="200">Name</td>
                        <td width="300">Address</td>
                        <td width="150">Contact No</td>
                        <td width="200">Email</td>
                        <td width="200">Introducer</td>
                        <td width="150">Introducer Contact</td>
                        <td width="150">View Full Details</td>
                    </tr>
                    <%
                        selreguser="select * from tbl_reguser where reguser_status='A'";
                        rsreguser=obj.select(selreguser);
                        while(rsreguser.next())
                        {
                        %>
                    <tr>
                        <td><%=rsreguser.getString("reguser_name") %></td>
                        <td><%=rsreguser.getString("reguser_address") %></td>
                        <td><%=rsreguser.getString("reguser_contact1") %></td>
                        <td><%=rsreguser.getString("reguser_email") %></td>
                        <td><%=rsreguser.getString("reguser_intrname") %></td>
                        <td><%=rsreguser.getString("reguser_intrcontact") %></td>
                        <td><a href="AcceptRejectRegUser.jsp?UId=<%=rsreguser.getString("reguser_id")%>">View Full Details</a> </td>
                    </tr>
                    <%}
                        %>
                
            </table>
                <br>
                
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="7">Rejected Users</td>
                        
                    </tr>
                
                    <tr>
                        <td width="200">Name</td>
                        <td width="300">Address</td>
                        <td width="150">Contact No</td>
                        <td width="200">Email</td>
                        <td width="200">Introducer</td>
                        <td width="150">Introducer Contact</td>
                        <td width="150">View Full Details</td>
                    </tr>
                    <%
                        selreguser="select * from tbl_reguser where reguser_status='R'";
                        rsreguser=obj.select(selreguser);
                        while(rsreguser.next())
                        {
                        %>
                    <tr>
                        <td><%=rsreguser.getString("reguser_name") %></td>
                        <td><%=rsreguser.getString("reguser_address") %></td>
                        <td><%=rsreguser.getString("reguser_contact1") %></td>
                        <td><%=rsreguser.getString("reguser_email") %></td>
                        <td><%=rsreguser.getString("reguser_intrname") %></td>
                        <td><%=rsreguser.getString("reguser_intrcontact") %></td>
                        <td><a href="AcceptRejectRegUser.jsp?UId=<%=rsreguser.getString("reguser_id")%>">View Full Details</a> </td>
                    </tr>
                    <%}
                        %>
                
            </table>
            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>
