/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.bed_category;

import controller.admin.auth.BaseAuthAdminController;
import dl.BedCategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BedCategory;

/**
 *
 * @author lanh0
 */
public class ListBedCategory extends BaseAuthAdminController {
    
    @Override
    protected boolean isPermission(HttpServletRequest request) {
        return true;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BedCategoryDBContext bedCategoryDBContext = new BedCategoryDBContext();
        ArrayList<BedCategory> bedCategorys = bedCategoryDBContext.getBedCategorys();
        request.setAttribute("bedCategorys", bedCategorys);
        request.getRequestDispatcher("/view/admin/bedcategory/list.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

   

}
