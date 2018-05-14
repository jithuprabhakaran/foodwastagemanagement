package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.html");
    _jspx_dependants.add("/footer.html");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(" \n");
      conn.clsConn obj = null;
      synchronized (_jspx_page_context) {
        obj = (conn.clsConn) _jspx_page_context.getAttribute("obj", PageContext.PAGE_SCOPE);
        if (obj == null){
          obj = new conn.clsConn();
          _jspx_page_context.setAttribute("obj", obj, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\n');

    String username="";
    String password="";
    String str="";
    ResultSet rsLogin=null;
    if(request.getParameter("btnLogin")!=null){
        username=request.getParameter("txtUsername");
        password=request.getParameter("txtPassword");
        str="select * from tbl_login where login_name='"+username+"' and login_password='"+password+"'";
        rsLogin=obj.select(str);
        if(rsLogin.next()){
            session.setAttribute("username", rsLogin.getString("login_name"));
            session.setAttribute("userid", rsLogin.getInt("login_id"));
            session.setAttribute("userstatus", "Admin");
            response.sendRedirect("Admin/AdminHome.jsp");
                    
        }
        else{
            str="select * from tbl_charitabletrust where chari_username='"+ username +"' and chari_password='"+password+"' and chari_status='A'";
            rsLogin=obj.select(str);
            if(rsLogin.next()){
                session.setAttribute("username", rsLogin.getString("chari_username"));
                session.setAttribute("userid", rsLogin.getInt("chari_id"));
                session.setAttribute("userstatus", "ChariTrust");
                response.sendRedirect("ChariTrust/ChariTrustHome.jsp");
            }
            else{
                str="select * from tbl_reguser where reguser_username='"+ username +"' and reguser_password='"+password+"' and reguser_status='A'";
                rsLogin=obj.select(str);
                if(rsLogin.next()){
                    session.setAttribute("username", rsLogin.getString("reguser_username"));
                    session.setAttribute("userid", rsLogin.getInt("reguser_id"));
                    session.setAttribute("userstatus", "RegUser");
                    response.sendRedirect("RegUser/RegUserHome.jsp");
                }else{
                str="select * from tbl_guestuser where guest_username='"+ username +"' and guest_password='"+password+"'";
                rsLogin=obj.select(str);
                if(rsLogin.next()){
                    session.setAttribute("username", rsLogin.getString("guest_username"));
                    session.setAttribute("userid", rsLogin.getInt("guest_id"));
                    session.setAttribute("userstatus", "Guest");
                    response.sendRedirect("Guest/GuestHome.jsp");
                }
                else{
                    
                    str="select * from tbl_eventmanager where eventmgr_username='"+ username +"' and eventmgr_password='"+password+"'";
                rsLogin=obj.select(str);
                if(rsLogin.next()){
                    session.setAttribute("username", rsLogin.getString("eventmgr_username"));
                    session.setAttribute("userid", rsLogin.getInt("eventmgr_id"));
                    session.setAttribute("userstatus", "EventMgr");
                    response.sendRedirect("EventMgr/EventMgrHome.jsp");
                }
                }
                
            }
        }
    }
    }
    
 
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("          <title>Residue</title>\n");
      out.write("        ");
      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<!--\r\n");
      out.write("\tMonochromed by TEMPLATED\r\n");
      out.write("    templated.co @templatedco\r\n");
      out.write("    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)\r\n");
      out.write("-->\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<title>Monochromed by TEMPLATED</title>\r\n");
      out.write("\t\t<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("\t\t<meta name=\"description\" content=\"\" />\r\n");
      out.write("\t\t<meta name=\"keywords\" content=\"\" />\r\n");
      out.write("\t\t<link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>\r\n");
      out.write("\t\t<!--[if lte IE 8]><script src=\"js/html5shiv.js\"></script><![endif]-->\r\n");
      out.write("        <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js\"></script>\r\n");
      out.write("\t\t<script src=\"js/skel.min.js\"></script>\r\n");
      out.write("\t\t<script src=\"js/skel-panels.min.js\"></script>\r\n");
      out.write("\t\t<script src=\"js/init.js\"></script>\r\n");
      out.write("\t\t<noscript>\r\n");
      out.write("\t\t\t<link rel=\"stylesheet\" href=\"css/skel-noscript.css\" />\r\n");
      out.write("\t\t\t<link rel=\"stylesheet\" href=\"css/style.css\" />\r\n");
      out.write("\t\t</noscript>\r\n");
      out.write("\t\t<!--[if lte IE 8]><link rel=\"stylesheet\" href=\"css/ie/v8.css\" /><![endif]-->\r\n");
      out.write("\t\t<!--[if lte IE 9]><link rel=\"stylesheet\" href=\"css/ie/v9.css\" /><![endif]-->\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body class=\"homepage\">\r\n");
      out.write("\r\n");
      out.write("\t<!-- Header -->\r\n");
      out.write("\t\t<div id=\"header\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t<!-- Logo -->\r\n");
      out.write("\t\t\t\t\t<div id=\"logo\">\r\n");
      out.write("\t\t\t\t\t\t<h1><a href=\"#\">FOOD WASTAGE</a></h1>\r\n");
      out.write("\t\t\t\t\t\t<span>Management System</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<!-- Nav -->\r\n");
      out.write("\t\t\t\t\t<nav id=\"nav\">\r\n");
      out.write("\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t<li class=\"active\"><a href=\"index.jsp\">Home</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li ><a href=\"CharitableTrustReg.jsp\">Charitable Trust Regn</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li ><a href=\"UserRegistration.jsp\">User Regn</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li ><a href=\"GuestRegistration.jsp\">Guest User Regn</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"EventManagerRegistration.jsp\">Event Manager Regn</a></li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</nav>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t<!-- Header -->\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t<!-- Main -->\r\n");
      out.write("\t\t<div id=\"main\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<header>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"mystyle.css\"/>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        <form name=\"frmLogin\" action=\"index.jsp\" method=\"POST\">\n");
      out.write("            <center>\n");
      out.write("                <table class=\"CSSTableGenerator\">\n");
      out.write("                \n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"2\">Login</td>\n");
      out.write("                    </tr>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                    <tr>\n");
      out.write("                        <td width=\"200\">Username</td>\n");
      out.write("                        <td width=\"300\"><input type=\"text\" name=\"txtUsername\" value=\"\" size=\"40\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Password</td>\n");
      out.write("                        <td><input type=\"password\" name=\"txtPassword\" value=\"\" size=\"40\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                \n");
      out.write("                        <td colspan=\"2\" ><input type=\"submit\" value=\"Login\" name=\"btnLogin\" /></td>\n");
      out.write("                       \n");
      out.write("                    </tr>\n");
      out.write("            \n");
      out.write("            </table>\n");
      out.write("                \n");
      out.write("            <!--    <table border=\"1\">\n");
      out.write("                   \n");
      out.write("                    <tbody>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><a href=\"CharitableTrustReg.jsp\"> Charitable Trust Registration</a></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><a href=\"UserRegistration.jsp\">User Registration</a></td>\n");
      out.write("                        </tr>\n");
      out.write("                         <tr>\n");
      out.write("                            <td><a href=\"GuestRegistration.jsp\">Guest User Registration</a></td>\n");
      out.write("                        </tr>\n");
      out.write("                          <tr>\n");
      out.write("                              <td><a href=\"EventManagerRegistration.jsp\">Event Manager Registration</a></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </tbody>\n");
      out.write("                </table> -->\n");
      out.write("\n");
      out.write("            </center>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<!--\r\n");
      out.write("\tMonochromed by TEMPLATED\r\n");
      out.write("    templated.co @templatedco\r\n");
      out.write("    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)\r\n");
      out.write("-->\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<title>Monochromed by TEMPLATED</title>\r\n");
      out.write("\t\t<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("\t\t<meta name=\"description\" content=\"\" />\r\n");
      out.write("\t\t<meta name=\"keywords\" content=\"\" />\r\n");
      out.write("\t\t<link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>\r\n");
      out.write("\t\t<!--[if lte IE 8]><script src=\"js/html5shiv.js\"></script><![endif]-->\r\n");
      out.write("        <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js\"></script>\r\n");
      out.write("\t\t<script src=\"js/skel.min.js\"></script>\r\n");
      out.write("\t\t<script src=\"js/skel-panels.min.js\"></script>\r\n");
      out.write("\t\t<script src=\"js/init.js\"></script>\r\n");
      out.write("\t\t<noscript>\r\n");
      out.write("\t\t\t<link rel=\"stylesheet\" href=\"css/skel-noscript.css\" />\r\n");
      out.write("\t\t\t<link rel=\"stylesheet\" href=\"css/style.css\" />\r\n");
      out.write("\t\t</noscript>\r\n");
      out.write("\t\t<!--[if lte IE 8]><link rel=\"stylesheet\" href=\"css/ie/v8.css\" /><![endif]-->\r\n");
      out.write("\t\t<!--[if lte IE 9]><link rel=\"stylesheet\" href=\"css/ie/v9.css\" /><![endif]-->\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body class=\"homepage\">\r\n");
      out.write("\r\n");
      out.write("\t<!-- Header --><!-- Header -->\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t<!-- Main --><!-- Main -->\r\n");
      out.write("    </header>\r\n");
      out.write("\t\t\t\t<div class=\"row\"></div>\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<!-- Content --><!-- /Content -->\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<!-- Sidebar --><!-- Sidebar -->\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<!-- Footer --><!-- Footer -->\r\n");
      out.write("\r\n");
      out.write("\t<!-- Copyright -->\r\n");
      out.write("\t\t<div id=\"copyright\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("                            Design: <a href=\"\">Food Wastage Management &COPY; 2018.</a> | All rights reserved.\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
