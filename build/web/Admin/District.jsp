

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    int stateid=0;
    int distid=0;
    String distname="";
    String str="";
    int eid=0;
    if(request.getParameter("DelId")!=null){
        str="delete from tbl_district where dist_id="+request.getParameter("DelId");
        obj.insert(str);
        response.sendRedirect("District.jsp");
    }
    if(request.getParameter("EId")!=null){
        str="select * from tbl_district where dist_id="+request.getParameter("EId");
        ResultSet rsDist=obj.select(str);
        if(rsDist.next()){
            stateid=Integer.parseInt(rsDist.getString("state_id"));
            distid=Integer.parseInt(rsDist.getString("dist_id"));
            distname=rsDist.getString("dist_name");
        }
    }
    if(request.getParameter("btnSubmit")!=null){
        stateid=Integer.parseInt(request.getParameter("selState"));
        distname=request.getParameter("txtDistrict");
        eid=Integer.parseInt(request.getParameter("hid"));
        if(eid!=0){
            str="update tbl_district set dist_name='"+distname+"',state_id="+stateid+" where dist_id="+eid;
        }
        else{
            str="insert into tbl_district(dist_name,state_id) values('"+distname+"',"+stateid+")";
        }
       out.println(str);
        obj.insert(str);
        response.sendRedirect("District.jsp");
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
        <form name="frmDistrict" action="District.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="2">District Details</td>
                       
                    </tr>
                
                    <tr>
                        <td width="200">State</td>
                        <td width="300"><select name="selState" required="required">
                                <option value="">---Select State---</option>
                            <%
                                String selState="select * from tbl_state";
                                ResultSet rsState=obj.select(selState);
                                while(rsState.next()){
                                    if(Integer.parseInt(rsState.getString("state_id"))==stateid)
                                    {
                                     %>
                                     <option value="<%=rsState.getString("state_id")%>" selected="selected"><%= rsState.getString("state_name") %></option>
                                <%
                                }
                                else{
                                %>
                                <option value="<%=rsState.getString("state_id")%>"><%= rsState.getString("state_name") %></option>
                                <%
                                    }
                                }
                                 %>
                            </select></td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td><input type="text" name="txtDistrict" value="<%=distname %>" size="40" required="required" maxlength="40" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit" name="btnSubmit" /></td>
                <input type="hidden" name="hid" value="<%=distid%>"/>
                    </tr>
              
            </table>
                    
                    <p> &nbsp; </p>
                            <table class="CSSTableGenerator2">
                                    <tr>
                                        <td colspan="3">District Details</td>                                       
                                    </tr>
                                
                                    <%
                                        selState="select * from tbl_state";
                                        rsState=obj.select(selState);                                        
                                        while(rsState.next()){
                                     %>
                                     <tr style="background-color:aquamarine;">
                                         <td colspan="3">State : <%= rsState.getString("state_name") %></td>
                                         
                                     </tr>
                                    <tr>
                                        <td>District</td>
                                        <td>Edit</td>
                                        <td>Delete</td>
                                    </tr>
                                    <%
                                        String selDist="select * from tbl_district where state_id="+rsState.getString("state_id");
                                        ResultSet rsDist=obj.select(selDist);
                                        while(rsDist.next())
                                        {
                                        %>
                                    <tr>
                                        <td width="300"><%=rsDist.getString("dist_name") %></td>
                                        <td width="100"><a href="District.jsp?EId=<%=rsDist.getString("dist_id")%>">Edit</a></td>
                                        <td width="100"><a href="District.jsp?DelId=<%=rsDist.getString("dist_id")%>">Delete</a></td>
                                    </tr>
                                    <%}
                                        }
                                      %>
                            
                            </table>

            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>