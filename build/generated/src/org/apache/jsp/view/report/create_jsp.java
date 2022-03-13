package org.apache.jsp.view.report;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class create_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Add rental Page</title>\n");
      out.write("    </head>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../base/header.jsp", out, false);
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div class=\"flex\">\n");
      out.write("            <div class=\"w-64  bg-gray-50\">\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../navbar/navbar.jsp", out, false);
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"w-full px-10 py-5\">\n");
      out.write("                <div class=\"flex justify-center items-center\" style=\"min-height: 93vh\">\n");
      out.write("                    <form style=\"width: 500px\" action=\"/admin/rental/add\" method=\"post\">\n");
      out.write("                        <div class=\"mb-6\">\n");
      out.write("                            <label for=\"title\" class=\"block mb-2 text-sm font-medium text-gray-900\">Title</label>\n");
      out.write("                            <input required type=\"text\" id=\"title\" name=\"title\" class=\"bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-pink-500 focus:border-pink-500 block w-full p-2.5\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mb-6\">\n");
      out.write("                            <label for=\"content\" class=\"block mb-2 text-sm font-medium text-gray-900\">Content</label>\n");
      out.write("                            <textarea cols=\"10\" rows=\"6\"></textarea>\n");
      out.write("                        </div>\n");
      out.write("                        <button type=\"submit\" class=\"text-white bg-pink-700 hover:bg-pink-800 focus:ring-4 focus:ring-pink-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center\">Submit</button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../base/footer.jsp", out, false);
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
