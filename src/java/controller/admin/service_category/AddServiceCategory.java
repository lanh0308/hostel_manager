/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.service_category;

import controller.admin.auth.BaseAuthAdminController;
import dl.BedCategoryDBContext;
import dl.ServiceCategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class AddServiceCategory extends BaseAuthAdminController {
    
    @Override
    protected boolean isPermission(HttpServletRequest request) {
        return true;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/servicecategory/add.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String x_name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        String x_price = request.getParameter("price");
        int price = Integer.parseInt(x_price);
        ServiceCategoryDBContext serviceDB = new ServiceCategoryDBContext();
        serviceDB.insertServiceCategory(x_name, price);
        response.sendRedirect("/admin/service/category");
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