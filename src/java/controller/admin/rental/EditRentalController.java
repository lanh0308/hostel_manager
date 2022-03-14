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
public class EditRentalController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "RENTAL", "UPDATE");
        return isPer;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RoomDBContext roomDB = new RoomDBContext();
        ArrayList<Room> rooms = roomDB.getRoomsEmpty();
        request.setAttribute("rooms", rooms);
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        RoomRental roomRental = roomRentalDB.getRoomRental(id);
        request.setAttribute("roomRental", roomRental);
        request.getRequestDispatcher("/view/admin/rental/edit.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomId = request.getParameter("room");
        String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        String phone_number = request.getParameter("phone_number");
        String address = new String(request.getParameter("address").getBytes("iso-8859-1"), "utf-8");
        String email = request.getParameter("email");
        String cmnd = request.getParameter("cmnd");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String deposit_money = request.getParameter("deposit_money");
        String state = request.getParameter("state");
        int idCustomer = Integer.parseInt(request.getParameter("idCustomer"));
        int idRoomRental = Integer.parseInt(request.getParameter("idRoomRental"));
        
        boolean is_state = state !=null && state.equalsIgnoreCase("true");
        
        int idRoom = Integer.parseInt(roomId);
        RoomDBContext roomDB = new RoomDBContext();
        Room room = roomDB.getRoom(idRoom);
        
        CustomerDBContext customerDB = new CustomerDBContext();
        Customer customer = customerDB.getCustomer(idCustomer);
        customer.setName(name);
        customer.setPhone_number(phone_number);
        customer.setAddress(address);
        customer.setEmail(email);
        customer.setCmnd(cmnd);
        
        customerDB.updateCustomer(customer);
        
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        RoomRental roomRental = roomRentalDB.getRoomRental(idRoomRental);
        roomRental.setCustomer(customer);
        roomRental.setRoom(room);
        roomRental.setStart_date(Date.valueOf(start_date));
        roomRental.setEnd_date(Date.valueOf(end_date));
        roomRental.setState(is_state);
        roomRental.setDeposit_money(Integer.parseInt(deposit_money));
        roomRentalDB.updateRoomRental(roomRental);
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
