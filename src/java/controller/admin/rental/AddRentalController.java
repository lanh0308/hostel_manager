/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.rental;

import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.CustomerDBContext;
import dl.RoomDBContext;
import dl.RoomRentalDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Customer;
import model.Room;
import model.RoomRental;

/**
 *
 * @author lanh0
 */
public class AddRentalController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "RENTAL", "ADD");
        return isPer;
    }
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoomDBContext roomDB = new RoomDBContext();
        ArrayList<Room> rooms = roomDB.getRoomsEmpty();
        request.setAttribute("rooms", rooms);
        request.getRequestDispatcher("/view/admin/rental/add.jsp").forward(request, response);
    }

    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomId = request.getParameter("room");
        String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        String phone_number = request.getParameter("phone_number");
        String address = new String(request.getParameter("address").getBytes("iso-8859-1"), "utf-8");
        String email = request.getParameter("email");
        String cmnd = request.getParameter("cmnd");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String deposit_money = request.getParameter("deposit_money");
        
        int idRoom = Integer.parseInt(roomId);
        RoomDBContext roomDB = new RoomDBContext();
        Room room = roomDB.getRoom(idRoom);
        
        Customer customer = new Customer();
        customer.setName(name);
        customer.setPhone_number(phone_number);
        customer.setAddress(address);
        customer.setEmail(email);
        customer.setCmnd(cmnd);
        
        CustomerDBContext customerDB = new CustomerDBContext();
        Customer new_customer = customerDB.insertCustomer(customer);
        
        RoomRental roomRental = new RoomRental();
        roomRental.setCustomer(new_customer);
        roomRental.setRoom(room);
        roomRental.setStart_date(Date.valueOf(start_date));
        roomRental.setEnd_date(Date.valueOf(end_date));
        roomRental.setState(true);
        roomRental.setDeposit_money(Integer.parseInt(deposit_money));
        
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        roomRentalDB.insertRoomRental(roomRental);
        response.sendRedirect("/admin/rental");
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
