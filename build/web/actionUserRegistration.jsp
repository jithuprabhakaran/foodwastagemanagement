

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page  import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %> 

<jsp:useBean class="conn.clsConn" id="obj"></jsp:useBean>
<%
String name="";
String address="";
String contact1="";
String contact2="";
String adharno="";
String photo="";
String email="";
String intrname="";
String intraddress="";
String intrcontact="";
String username="";
String password="";
int munid=0;
String sel="";
String str="";
   
   
       
String selUser="";
ResultSet rsUser=null;
                   
                            
                           
                   String field_name="";
        FileItem f_item=null;
        String file_name="";

        File savedFile=null;
        String fn="",pf="";

        String field[] = new String[16];
        String value[]=new String[16];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                System.out.println(k+" "+value[k]);
                k++;
                
                
                
                
                
        }
       else
       {
            //f_item=(FileItem)itr.next();
            
           file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("filePhoto"))
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\UserPhoto\\";
            Random r=new Random();
            int r_num=r.nextInt(1111)+999;
           sel="select * from tbl_reguser";
           ResultSet rs=obj.select(sel);
           if(rs.next())
           {
            sel="select max(reguser_id) as m from tbl_reguser";
            rs=obj.select(sel);
            
            if(rs.next()){
               fn=(Integer.parseInt(rs.getString("m"))+1)+ext; 
                //str="update tbl_document set docu_file='"+fn+"' where document_id="+rs.getString("m");
               // obj.insert(str);
            }
           }
            else{
                
                fn=1+ext;
            }
            
            //creating a file object
            savedFile=new File(file_path+fn);
            try
            {
                //writing the file object
                f_item.write(savedFile);  
               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
         
          
           
       }
           
           }
}

                            
                            //*****************************************
            selUser="select * from tbl_login where login_name='"+value[12]+"' and login_password='"+value[13]+"'";
                rsUser=obj.select(selUser);
                if(!rsUser.next())
                {
                      
                    selUser="select * from tbl_charitabletrust where chari_username='" + value[12] + "' and chari_password='"+value[13]+"'";
                    rsUser=obj.select(selUser);
                    if(!rsUser.next())
                    {
                        selUser="select * from tbl_reguser where reguser_username='" +value[12] +"' and reguser_password='" +value[13]  +"'";
                        rsUser=obj.select(selUser);
                        if(!rsUser.next())
                        {
                            selUser="select * from tbl_guestuser where guest_username='"+value[12]+"' and guest_password='"+value[13]+"'";
                            rsUser=obj.select(selUser);
                            if(!rsUser.next())
                            {
                            str="select * from tbl_eventmanager where eventmgr_username='"+ value[12]+"' and eventmgr_password='"+value[13] + "'";
                        rsUser=obj.select(str);
                        if(!rsUser.next()){
                             str="insert into tbl_reguser(reguser_name,reguser_address,reguser_contact1,reguser_contact2,reguser_adharno,reguser_email,reguser_intrname,reguser_intraddress,reguser_intrcontact,reguser_status,mun_id,reguser_username,reguser_password,reguser_photo) values('"+
                                    value[3]+"','"+value[4]+"','"+value[5]+"','"+value[6]+"','"+value[7]+"','"+value[8]+"','"+value[9]+"','"+value[10]+"','"+value[11]+"','P',"+value[2]+",'"+value[12]+"','"+value[13]+"','"+fn+"')";
                             
                            out.println(str);
                              obj.insert(str);   
                               response.sendRedirect("UserRegistration.jsp");
                                }
                        else{
                            response.sendRedirect("UserRegistration.jsp?msg=Username and Password Already Exists!");
                        }
                            }
                            else{
                                response.sendRedirect("UserRegistration.jsp?msg=Username and Password Already Exists!");
                            }
                           
                            }
                        else
                        {
                              response.sendRedirect("UserRegistration.jsp?msg=Username and Password Already Exists!");
                        }
                    }
                    else
                    {
                         response.sendRedirect("UserRegistration.jsp?msg=Username and Password Already Exists!");
                    }
                   
                }
                else
                {
                   response.sendRedirect("UserRegistration.jsp?msg=Username and Password Already Exists!");
                }
      
      
      
        
%>