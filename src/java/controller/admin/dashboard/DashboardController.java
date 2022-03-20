/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.dashboard;

import controller.admin.auth.BaseAuthAdminController;
import controller.auth.BaseAuthController;
import dl.AccountDBContext;
import dl.FloorDBContext;
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
import model.Floor;
import model.Room;
import model.RoomRental;

/**
 *
 * @author lanh0
 */
public class DashboardController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "RENTAL", "READ");
        return isPer;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        FloorDBContext floorDB = new FloorDBContext();
        ArrayList<Floor> floors = floorDB.floors();
        request.setAttribute("floors", floors);
        ArrayList<RoomRental> roomRentals = roomRentalDB.getRoomRentals();
        RoomDBContext roomDB = new RoomDBContext();
        ArrayList<Room> rooms = roomDB.getAllRooms();
        request.setAttribute("rooms", rooms);
        request.setAttribute("roomRentals", roomRentals);
        request.getRequestDispatcher("/view/admin/dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
