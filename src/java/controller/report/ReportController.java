/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.report;

import controller.auth.BaseAuthController;
import dl.ReportDBContext;
import dl.RoomDBContext;
import dl.RoomRentalDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Report;
import model.Room;
import model.RoomRental;

/**
 *
 * @author lanh0
 */
public class ReportController extends BaseAuthController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("room");
        RoomDBContext roomDB = new RoomDBContext();
        Room room = roomDB.getRoomByName(account.getUsername().replaceAll("[^0-9]", "").trim());
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        RoomRental roomRental = roomRentalDB.getRoomRentalByRoom(room.getId());
        ReportDBContext reportDB = new ReportDBContext();
        ArrayList<Report> reports = reportDB.getReportsByRoom(roomRental.getRoom().getId());
        request.setAttribute("reports", reports);
        request.getRequestDispatcher("/view/report/list.jsp").forward(request, response);

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
