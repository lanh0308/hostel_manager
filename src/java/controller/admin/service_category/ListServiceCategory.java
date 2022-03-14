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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class ListServiceCategory extends BaseAuthAdminController {
    
    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "SERVICE_CATEGORY", "READ");
        return isPer;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServiceCategoryDBContext serviceCategoryDBContext = new ServiceCategoryDBContext();
        ArrayList<ServiceCategory> serviceCategorys = serviceCategoryDBContext.getServiceCategorys();
        request.setAttribute("serviceCategorys", serviceCategorys);
        request.getRequestDispatcher("/view/admin/servicecategory/list.jsp").forward(request, response);
    }

    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
