
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    String msg=" ";
    msg=request.getParameter("msg");
    if(msg==null){
        msg=" ";
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Residue</title>
        <script class="jsbin" src="styles/jquery.js"></script>
<script class="jsbin" src="styles/jquery-ui.js"></script>
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
         function selectMuncipality(x){


            if(window.XMLHttpRequest){
                xmlhttp=new XMLHttpRequest();

            }
            else{
                xmlhttp=new ActiveObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function(){
                if(xmlhttp.readyState==4 && xmlhttp.status==200){
                    document.getElementById("selMuncipality").innerHTML=xmlhttp.responseText;
                }
            }
           
            xmlhttp.open("GET","responseMuncipality.jsp?q="+x,true);
            xmlhttp.send();
           
           
        }
       function readURL(input) {
			
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
					
                    $('#imgpreview').attr('src', e.target.result);
                }
				
                reader.readAsDataURL(input.files[0]);
            }
        }
        </script>
      	<%@include  file="header.html" %>
          <link rel="stylesheet" type="text/css" href="mystyle.css"/>
    </head>
    <body>
        <form name="frmUserRegistration" action="actionUserRegistration.jsp" method="POST" enctype="multipart/form-data">
            <center>
                <table class="CSSTableGenerator2">
             
                    <tr>
                        <td colspan="3">User Registration</td>
                      
                    </tr>
                
                    <tr>
                        <td>State</td>
                        <td><select name="selState" id="selState"  onchange="selectDistrict(this.value)" required="required">
                                <option value="">---Select State---</option>
                            <%
                                String strState="select * from tbl_state";
                                ResultSet rsState=obj.select(strState);
                                while(rsState.next())
                                {
                                
                                %>
                                <option value="<%=rsState.getString("state_id")%>"><%=rsState.getString("state_name") %></option>
                                <%}
                                    %>
                            </select></td>
                            <td rowspan="5"><img id="imgpreview" name="imgpreview" src="" alt="your image" height="100px" width="100px"/></td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td><select name="selDistrict" id="selDistrict" onchange="selectMuncipality(this.value)" required="required" >
                                <option value="">---Select District---</option>
                              
                            </select></td>
                    </tr>
                    <tr>
                        <td>Muncipality</td>
                        <td><select name="selMuncipality" id="selMuncipality" required="required" >
                                <option value="">---Select Muncipality---</option>
                              
                            </select></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txtName" value="" size="40" required="required" maxlength="40" /></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea name="txtAddress" rows="4" cols="40" required="required" maxlength="100"></textarea></td>
                    </tr>
                    <tr>
                        <td>Contact No1</td>
                        <td><input type="tele" name="txtContact1" pattern="[789][0-9]{9}" value="" size="40" required="required" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Contact No2</td>
                        <td><input type="tele" pattern="[789][0-9]{9}" name="txtContact2" value="" size="40" required="required" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Adhar No</td>
                        <td><input type="text" name="txtAdharno" value="" size="40" required="required" maxlength="18" /></td>
                         <td></td>
                    </tr>
                    <tr>
                        <td>Photo</td>
                        <td><input type="file" name="filePhoto" value="" onchange="readURL(this)" required="required"  /></td>
                         <td></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="txtEmail" value="" size="40" required="required" maxlength="40" /></td>
                         <td></td>
                    </tr>
                    <tr>
                        <td>Introducer Name</td>
                        <td><input type="text" name="txtIntroducer" value="" size="40" required="required" maxlength="40" /></td>
                         <td></td>
                    </tr>
                    <tr>
                        <td>Introducer Address</td>
                        <td><textarea name="txtIntrAddress" rows="4" cols="40">
                            </textarea></td>
                             <td></td>
                    </tr>
                    <tr>
                        <td>Introducer Contact</td>
                        <td><input type="tele" pattern="[789][0-9]{9}" name="txtIntrContact" value="" size="40" required="required" /></td>
                         <td></td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="txtUsername" value="" size="40" required="required" maxlength="15" /></td>
                         <td></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtPassword" value="" size="40" required="required" maxlength="15" /></td>
                         <td></td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="submit" value="Submit" name="btnSubmit" /></td>
                    </tr>
                     <tr>
                        <td colspan="3"><div style="color:red; text-align:center;font-weight: bold; "><%=msg%></div></td>
                        
                    </tr>
              
            </table>
            </center>                
        </form>
    </body>
</html>
<%@include  file="footer.html" %>
