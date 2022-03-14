/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.bed_category;

import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.BedCategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.BedCategory;

/**
 *
 * @author lanh0
 */
public class AddBedCategory extends BaseAuthAdminController {
    
    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "BED_CATEGORY", "ADD");
        return isPer;
    }
    
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/bedcategory/add.jsp").forward(request, response);

    }

    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
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
