

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
    String name="";
    String str="";
    int id=0;
    int eid=0;
    if(request.getParameter("DelId")!=null){
        str="delete from tbl_state where state_id="+request.getParameter("DelId");
        obj.insert(str);
         response.sendRedirect("State.jsp");
    }
    if(request.getParameter("EId")!=null){
        str="select * from tbl_state where state_id="+request.getParameter("EId");
        ResultSet rsEdit=obj.select(str);
        if(rsEdit.next()){
            name=rsEdit.getString("state_name");
            id=Integer.parseInt(rsEdit.getString("state_id"));
        }
    }
    if(request.getParameter("btnSubmit")!=null){
        name=request.getParameter("txtState");
        eid=Integer.parseInt(request.getParameter("hid"));
        
        if(eid!=0){
           str="update tbl_state set state_name='"+name+"' where state_id="+eid; 
        }
        else{
             str="insert into tbl_state(state_name) values('"+name+"')";  
        }
            //out.println(str); 
        obj.insert(str);
       response.sendRedirect("State.jsp");
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
        <form action="State.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="2">State Details</td>
                       
                    </tr>
                
                    <tr>
                        <td width="200">State Name</td>
                        <td width="300"><input type="text" name="txtState" value="<%=name%>" size="40" required="required" maxlength="40" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit" name="btnSubmit" /></td>
                <input type="hidden" name="hid" value="<%=id%>"/>
                    </tr>
               
            </table>
                    <p> &nbsp; </p>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="3">State Details</td>
                       
                    </tr>
                
                    <tr>
                        <td width="300">State</td>
                        <td width="100">Edit</td>
                        <td width="100">Delete</td>
                    </tr>
                    <%
                        String selState="select * from tbl_state";
                        ResultSet rsState=obj.select(selState);
                        while(rsState.next())
                        {
                        
                        %>
                    <tr>
                        <td><%= rsState.getString("state_name") %></td>
                        <td><a href="State.jsp?EId=<%=rsState.getString("state_id") %>">Edit</a>  </td>
                        <td><a href="State.jsp?DelId=<%=rsState.getString("state_id") %>">Delete</a></td>
                    </tr>
                    <%
                        }
                        %>
                
            </table>

            </center>
        </form>
    </body>
</html>
<%@include  file="footer.html" %>