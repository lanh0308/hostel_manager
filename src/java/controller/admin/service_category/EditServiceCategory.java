/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.service_category;

import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.ServiceCategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class EditServiceCategory extends BaseAuthAdminController {
    
    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "SERVICE_CATEGORY", "UPDATE");
        return isPer;
    }
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        ServiceCategoryDBContext serviceCategoryDBContext = new ServiceCategoryDBContext();
        ServiceCategory serviceCategory = serviceCategoryDBContext.getServiceCategory(id);
        request.setAttribute("serviceCategory", serviceCategory);
        request.getRequestDispatcher("/view/admin/servicecategory/edit.jsp").forward(request, response);
    }

   
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        String x_name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        String x_price = request.getParameter("price");
        int price = Integer.parseInt(x_price);
        ServiceCategoryDBContext serviceDB = new ServiceCategoryDBContext();
        ServiceCategory serviceCategory = serviceDB.getServiceCategory(id);
        serviceCategory.setName(x_name);
        serviceCategory.setUnit_price(price);
        serviceDB.updateServiceCategory(serviceCategory);
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
