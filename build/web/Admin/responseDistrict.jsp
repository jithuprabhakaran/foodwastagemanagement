

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>

<select name="selDistrict" id="selDistrict">
    <option value="">---Select District---</option>
    
     <%
int id=Integer.parseInt(request.getParameter("q"));

String qry="select * from tbl_district where state_id=" + id;
out.println(qry);
ResultSet rs=obj.select(qry);
while(rs.next()){

    %>
    <option value="<%=rs.getInt("dist_id")%>"><%=rs.getString("dist_name")%></option>
    <%}%>
</select>