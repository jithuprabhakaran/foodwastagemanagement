
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String selChari="";
    ResultSet rsChari=null;
    String regno="";
    String name="";
    String address="";
    String contact1="";
    String contact2="";
    String email="";
    String website="";
    String authname="";
    String authaddress="";
    String authcontact="";
    String state="";
    String dist="";
    String muncipality="";
    int id=0;
    String str="";
            
    if(request.getParameter("CId")!=null){
        selChari="select * from tbl_charitabletrust,tbl_muncipality,tbl_district,tbl_state where chari_id="+request.getParameter("CId")
                +" and tbl_charitabletrust.mun_id=tbl_muncipality.mun_id and tbl_muncipality.dist_id=tbl_district.dist_id and tbl_district.state_id=tbl_state.state_id";
        rsChari=obj.select(selChari);
        if(rsChari.next()){
           regno=rsChari.getString("chari_regno");
           name=rsChari.getString("chari_name");
           address=rsChari.getString("chari_address");
           contact1=rsChari.getString("chari_contact1");
           contact2=rsChari.getString("chari_contact2");
           email=rsChari.getString("chari_email");
           website=rsChari.getString("chari_website");
           authname=rsChari.getString("chari_authorityname");
           authaddress=rsChari.getString("chari_authorityaddress");
           authcontact=rsChari.getString("chari_authoritycontact");
           state=rsChari.getString("state_name");
           dist=rsChari.getString("dist_name");
           muncipality=rsChari.getString("mun_name");
           id=Integer.parseInt(rsChari.getString("chari_id")) ;       
        }
    }
    if(request.getParameter("AId")!=null){
        
        str="update tbl_charitabletrust set chari_status='A' where chari_id="+request.getParameter("AId");
        obj.insert(str);
        response.sendRedirect("AcceptRejectCharitableTrust.jsp");    
    }
    if(request.getParameter("RId")!=null){
        
        str="update tbl_charitabletrust set chari_status='R' where chari_id="+request.getParameter("RId");
        obj.insert(str);
        response.sendRedirect("AcceptRejectCharitableTrust.jsp");
    
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
        <form name="frmAcceptRejectCharitableTrust" action="AcceptRejectCharitableTrust.jsp" method="POST">
            
            <center>
    
            <p> &nbsp; </p>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="7">Request From Charitable Trust</td>
                       
                    </tr>
                
                    <tr>
                        <td width="100">Reg No</td>
                        <td width="400">Name</td>
                        <td width="400">Address</td>
                        <td width="150">Contact No1</td>
                        <td width="150">Contact No2</td>
                        <td width="300">Email</td>
                        <td width="200">View Full Details</td>
                    </tr>
                <%
                    selChari="select * from tbl_charitabletrust where chari_status='P'";
                    rsChari=obj.select(selChari);
                    while(rsChari.next())
                    {
                    %>
                    <tr>
                        <td><%=rsChari.getString("chari_regno")%></td>
                        <td><%=rsChari.getString("chari_name")%></td>
                        <td><%=rsChari.getString("chari_address")%></td>
                        <td><%=rsChari.getString("chari_contact1")%></td>
                        <td><%=rsChari.getString("chari_contact2")%></td>
                        <td><%=rsChari.getString("chari_email")%></td>
                        <td><a href="AcceptRejectCharitableTrust.jsp?CId=<%=rsChari.getString("chari_id")%>">View Full Details</a></td>
                    </tr>
                    <%}
                    %>
                
            </table>
                    <p> &nbsp; </p>
       <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="7">Accepted Charitable Trust Details</td>
                       
                    </tr>
                
                    <tr>
                        <td width="100">Reg No</td>
                        <td width="400">Name</td>
                        <td width="400">Address</td>
                        <td width="150">Contact No1</td>
                        <td width="150">Contact No2</td>
                        <td width="300">Email</td>
                        <td width="200">View Full Details</td>
                    </tr>
                <%
                    selChari="select * from tbl_charitabletrust where chari_status='A'";
                    rsChari=obj.select(selChari);
                    while(rsChari.next())
                    {
                    %>
                    <tr>
                        <td><%=rsChari.getString("chari_regno")%></td>
                        <td><%=rsChari.getString("chari_name")%></td>
                        <td><%=rsChari.getString("chari_address")%></td>
                        <td><%=rsChari.getString("chari_contact1")%></td>
                        <td><%=rsChari.getString("chari_contact2")%></td>
                        <td><%=rsChari.getString("chari_email")%></td>
                        <td><a href="AcceptRejectCharitableTrust.jsp?CId=<%=rsChari.getString("chari_id")%>">View Full Details</a></td>
                    </tr>
                    <%}
                    %>
                
            </table>
                    <p> &nbsp; </p>
                <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="7">Rejected Charitable Trust Details</td>
                       
                    </tr>
                
                    <tr>
                        <td width="100">Reg No</td>
                        <td width="400">Name</td>
                        <td width="400">Address</td>
                        <td width="150">Contact No1</td>
                        <td width="150">Contact No2</td>
                        <td width="300">Email</td>
                        <td width="200">View Full Details</td>
                    </tr>
                <%
                    selChari="select * from tbl_charitabletrust where chari_status='R'";
                    rsChari=obj.select(selChari);
                    while(rsChari.next())
                    {
                    %>
                    <tr>
                        <td><%=rsChari.getString("chari_regno")%></td>
                        <td><%=rsChari.getString("chari_name")%></td>
                        <td><%=rsChari.getString("chari_address")%></td>
                        <td><%=rsChari.getString("chari_contact1")%></td>
                        <td><%=rsChari.getString("chari_contact2")%></td>
                        <td><%=rsChari.getString("chari_email")%></td>
                        <td><a href="AcceptRejectCharitableTrust.jsp?CId=<%=rsChari.getString("chari_id")%>">View Full Details</a></td>
                    </tr>
                    <%}
                    %>
                
            </table>
                   
              <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="2">Charitable Trust Details</td>
                        
                    </tr>
                
                     <tr>
                        <td width="200">State</td>
                        <td width="300"><%=state%></td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td><%=dist%></td>
                    </tr>
                    <tr>
                        <td>Muncipality</td>
                        <td><%=muncipality %></td>
                    </tr>
                    <tr>
                        <td>Registration No</td>
                        <td><%=regno %></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><%=name %></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%=address %></td>
                    </tr>
                    <tr>
                        <td>Contact No1</td>
                        <td><%=contact1 %></td>
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
                        <td>Authority Name</td>
                        <td><%=authname%></td>
                    </tr>
                    <tr>
                        <td>Authority Address</td>
                        <td><%= authaddress%></td>
                    </tr>
                    <tr>
                        <td>Authority Contact</td>
                        <td><%= authcontact %></td>
                    </tr>
                    <tr>
                        <td><a href="AcceptRejectCharitableTrust.jsp?AId=<%= id %>">Accept</a></td>
                        <td><a href="AcceptRejectCharitableTrust.jsp?RId=<%= id %>">Reject</a></td>
                        
                    </tr>
              </table>
             </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>
