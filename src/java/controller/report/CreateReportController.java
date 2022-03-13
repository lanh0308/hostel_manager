/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.report;

import controller.auth.BaseAuthController;
import dl.CustomerDBContext;
import dl.ReportDBContext;
import dl.RoomDBContext;
import dl.RoomRentalDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Customer;
import model.Report;
import model.Room;
import model.RoomRental;

/**
 *
 * @author lanh0
 */
public class CreateReportController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("room");
        RoomDBContext roomDB = new RoomDBContext();
        Room room =  roomDB.getRoomByName(account.getUsername().replaceAll("[^0-9]", "").trim());
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        RoomRental roomRental = roomRentalDB.getRoomRentalByRoom(room.getId());
        request.setAttribute("roomRental", roomRental);
        request.getRequestDispatcher("/view/report/create.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("room");
        RoomDBContext roomDB = new RoomDBContext();
        Room room =  roomDB.getRoomByName(account.getUsername().replaceAll("[^0-9]", "").trim());
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        RoomRental roomRental = roomRentalDB.getRoomRentalByRoom(room.getId());
        String title = new String(request.getParameter("title").getBytes("iso-8859-1"), "utf-8");
        String content = new String(request.getParameter("content").getBytes("iso-8859-1"), "utf-8");
        Report report = new Report();
        report.setStatus("pending");
        report.setRoom(roomRental.getRoom());
        report.setCustomer(roomRental.getCustomer());
        report.setTitle(title);
        report.setContent(content);
        Timestamp created_at = new Timestamp(System.currentTimeMillis());
        Timestamp updated_at = new Timestamp(System.currentTimeMillis());
        report.setCreated(created_at);
        report.setUpdated(updated_at);
        ReportDBContext reportDB = new ReportDBContext();
        reportDB.insert(report);
        response.sendRedirect("/report");
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
