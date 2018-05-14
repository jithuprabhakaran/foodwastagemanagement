

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    int distid=0;
    int stateid=0;
    int munid=0;
    int hid=0;
    String muncipality="";
    String str="";
    String distname="";
    if(request.getParameter("DelId")!=null){
        str="delete from tbl_muncipality where mun_id="+request.getParameter("DelId");
        obj.insert(str);
        response.sendRedirect("Muncipality.jsp");
    }
    if(request.getParameter("EId")!=null){
        str="select * from tbl_muncipality,tbl_district where mun_id="+request.getParameter("EId")+" and tbl_muncipality.dist_id=tbl_district.dist_id";
        ResultSet rsDet=obj.select(str);
        if(rsDet.next()){
            distid=Integer.parseInt(rsDet.getString("dist_id"));
            munid=Integer.parseInt(rsDet.getString("mun_id"));
            stateid=Integer.parseInt(rsDet.getString("state_id"));
            muncipality=rsDet.getString("mun_name"); 
            distname=rsDet.getString("dist_name");
        }
          
     }
    
    if(request.getParameter("btnSubmit")!=null){
        distid=Integer.parseInt(request.getParameter("selDistrict"));
        muncipality=request.getParameter("txtMuncipality");
        hid=Integer.parseInt(request.getParameter("hid"));
        if(hid!=0)
        {
            str="update tbl_muncipality set dist_id="+distid+",mun_name='"+muncipality+"' where mun_id="+hid;
        }
        else{
          str="insert into tbl_muncipality(dist_id,mun_name) values("+distid+",'"+muncipality+"')";          
        }        
        obj.insert(str);
        response.sendRedirect("Muncipality.jsp");
    }
    
    
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Residue</title>
          <script type="text/javascript">
        function selectDistrict(x){


            if(window.XMLHttpRequest){
                xmlhttp=new XMLHttpRequest();

            }
            else{
                xmlhttp=new ActiveObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function(){
                if(xmlhttp.readyState==4 && xmlhttp.status==200){
                    document.getElementById("selDistrict").innerHTML=xmlhttp.responseText;
                }
            }
           
            xmlhttp.open("GET","responseDistrict.jsp?q="+x,true);
            xmlhttp.send();
           
           
        }
        </script>
        <%@include  file="header.html" %>
            <link rel="stylesheet" type="text/css" href="../mystyle.css"/>
    </head>
    <body>
        <form name="frmMuncipality" action="Muncipality.jsp" method="POST">
            <center>
            <table class="CSSTableGenerator2">
                    <tr>
                        <td colspan="2">Muncipality Details</td>
                        
                    </tr>
                
                    <tr>
                        <td width="200">State</td>
                        <td width="300"><select name="selState" onchange="selectDistrict(this.value)" required="required">
                                <option value="">---Select State---</option>
                                <%
                                    String selState="select * from tbl_state";
                                    ResultSet rsState=obj.select(selState);
                                    while(rsState.next()){
                                    if(stateid==Integer.parseInt(rsState.getString("state_id"))){
                                    %>
                                    <option value="<%= rsState.getString("state_id") %>" selected="selected"><%= rsState.getString("state_name") %></option>
                                    <%
                                        }
                                        else
                                        {
                                        %>
                                    <option value="<%= rsState.getString("state_id") %>"><%= rsState.getString("state_name") %></option>
                                <% }
}
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td><select name="selDistrict" id="selDistrict" required="required">
                                <option value="">---Select District---</option>
                                <%
                                    if(distid!=0)
                                    {
                                    %>
                                    
                                    <option value="<%=distid%>" selected="selected"><%=distname%></option>
                                    <%
                                        }
                                        %>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Muncipality</td>
                        <td><input type="text" name="txtMuncipality" value="<%=muncipality%>" required="required" maxlength="40"  /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Submit" name="btnSubmit" /></td>
                <input type="hidden" name="hid" id="hid" value="<%=munid%>"/>
                    </tr>
                
            </table>
                    <p> &nbsp; </p>
                            <table class="CSSTableGenerator2">
                                    <tr>
                                        <td colspan="3">Muncipality Details</td>                                        
                                    </tr>
                                
                                    <%
                                        selState="select * from tbl_state";
                                        rsState=obj.select(selState);
                                        while(rsState.next())
                                        {
                                     %>
                                     <tr style="background-color: aquamarine;">
                                        <td colspan="3">State : <%=rsState.getString("state_name")%> </td>
                                       
                                    </tr>
                                    <%
                                        String selDist="select * from tbl_district where state_id=" + rsState.getString("state_id");
                                        ResultSet rsDist=obj.select(selDist);
                                        while(rsDist.next())
                                        {
                                        %>
                                        <tr style="background-color: burlywood;">
                                        <td colspan="3">District : <%= rsDist.getString("dist_name") %> </td>
                                       
                                    </tr>
                                     <tr>
                                        <td width="300">Muncipality</td>
                                        <td width="100">Edit</td>
                                        <td width="100">Delete</td>
                                    </tr>
                                    <%
                                        String selMun="select * from tbl_muncipality where dist_id="+rsDist.getString("dist_id");
                                        ResultSet rsMun=obj.select(selMun);
                                        while(rsMun.next())
                                        {
                                        
                                        %>
                                   
                                     <tr>
                                        <td><%=rsMun.getString("mun_name") %></td>
                                        <td><a href="Muncipality.jsp?EId=<%=rsMun.getString("mun_id")%>">Edit</a></td>
                                        <td><a href="Muncipality.jsp?DelId=<%=rsMun.getString("mun_id")%>">Delete</a></td>
                                    </tr>
                                    <%}
                                        }
                                        }
                                        %>
                                    
                               
                            </table>

                            
            </center>                
        </form>
    </body>
</html>
<%@include  file="footer.html" %>
