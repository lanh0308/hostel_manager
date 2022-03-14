/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.rental;

import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.RoomRentalDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Pagination;
import model.RoomRental;

/**
 *
 * @author lanh0
 */
public class RentalController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "RENTAL", "READ");
        return isPer;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        int pageSize = 20;
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        if (search == null) {
            search = "";
        }else{
            search = new String(search.getBytes("iso-8859-1"), "utf-8");
        }
        if (page == null || page.trim().length() == 0) {
            page = "1";
        }
        int pageIndex = 0;
        try {
            pageIndex = Integer.parseInt(page);
            if (pageIndex <= 0) {
                pageIndex = 1;
            }
        } catch (Exception e) {
            pageIndex = 1;
        }
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        Pagination pagination = new Pagination(pageIndex, pageSize, roomRentalDB.getSize(search.toLowerCase()));
        ArrayList<RoomRental> roomRentals = roomRentalDB.getRoomRentals(search.toLowerCase(), pageIndex, pageSize);
        request.setAttribute("roomRentals", roomRentals);
        request.setAttribute("pagination", pagination);
        request.getRequestDispatcher("/view/admin/rental/rentals.jsp").forward(request, response);
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
