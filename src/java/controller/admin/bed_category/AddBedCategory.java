/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.bed_category;

import dl.BedCategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BedCategory;

/**
 *
 * @author lanh0
 */
public class AddBedCategory extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/bedcategory/add.jsp").forward(request, response);

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String x_name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        BedCategoryDBContext bedCategoryDBContext = new BedCategoryDBContext();
        bedCategoryDBContext.addBedCategory(x_name);
        response.sendRedirect("/admin/bedcategory");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
