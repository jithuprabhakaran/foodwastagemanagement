

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>

<select name="selMuncipality" id="selMuncipality">
    <option value="">---Select Muncipality---</option>
    
     <%
int id=Integer.parseInt(request.getParameter("q"));

String qry="select * from tbl_muncipality where dist_id=" + id;

ResultSet rs=obj.select(qry);
while(rs.next()){

    %>
    <option value="<%=rs.getInt("mun_id")%>"><%=rs.getString("mun_name")%></option>
    <%}%>
</select>