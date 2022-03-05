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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RoomRental;

/**
 *
 * @author lanh0
 */
public class RentalController extends BaseAuthAdminController {

     @Override
    protected boolean isPermission(HttpServletRequest request) {
        return true;
    }
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        ArrayList<RoomRental> roomRentals = roomRentalDB.getRoomRentals();
        request.setAttribute("roomRentals", roomRentals);
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
