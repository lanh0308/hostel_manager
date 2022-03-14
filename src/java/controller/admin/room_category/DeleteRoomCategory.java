/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.room_category;

import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.RoomCategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author lanh0
 */
public class DeleteRoomCategory extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "CATEGORY", "REMOVE");
        return isPer;
    }

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RoomCategoryDBContext roomCategoryDBContext = new RoomCategoryDBContext();
        roomCategoryDBContext.deleteRoomCategory(id);
         response.sendRedirect(request.getHeader("referer"));
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
