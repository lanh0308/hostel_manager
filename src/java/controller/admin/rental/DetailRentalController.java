/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.rental;

import controller.admin.auth.BaseAuthAdminController;
import dl.RoomRentalDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pagination;
import model.RoomRental;

/**
 *
 * @author lanh0
 */
public class DetailRentalController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        int pageSize = 3;
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        if (search == null) {
            search = "";
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
        int id = Integer.parseInt(idString);
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        Pagination pagination = new Pagination(pageIndex, pageSize, roomRentalDB.getSize());
        RoomRental roomRental = roomRentalDB.getRoomRentalBySearch(id, search, pageIndex, pageSize);
        request.setAttribute("roomRental", roomRental);
        request.setAttribute("pagination", pagination);
        request.getRequestDispatcher("/view/admin/rental/detail.jsp").forward(request, response);
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
