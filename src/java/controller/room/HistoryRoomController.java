/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.room;

import controller.auth.BaseAuthController;
import dl.RoomRentalDBContext;
import dl.ServiceDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class HistoryRoomController extends BaseAuthController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("phong");
        String phong = account.getUsername().toLowerCase().replaceAll("[^0-9]", "").trim();
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        int pageSize = 3;
        String page = request.getParameter("page");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
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
        RoomRental roomRental = roomRentalDB.getRoomRentalByPhong(phong, start_date, end_date, pageIndex, pageSize);
        ServiceDBContext serviceDB = new ServiceDBContext();
        ArrayList<Date> start_dates = serviceDB.getAllStartDate(roomRental.getId());
        ArrayList<Date> end_dates = serviceDB.getAllEndDate(roomRental.getId());
        Pagination pagination = new Pagination(pageIndex, pageSize, serviceDB.getSize(roomRental.getId(), start_date, end_date));
        request.setAttribute("roomRental", roomRental);
        request.setAttribute("pagination", pagination);
        request.setAttribute("start_dates", start_dates);
        request.setAttribute("end_dates", end_dates);
        request.getRequestDispatcher("/view/room/history.jsp").forward(request, response);
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
