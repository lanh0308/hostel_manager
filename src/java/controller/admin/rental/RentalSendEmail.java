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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RoomRental;
import utils.EmailUtility;

/**
 *
 * @author lanh0
 */
public class RentalSendEmail extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        return true;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        ArrayList<RoomRental> roomRentals = roomRentalDB.getRoomRentals();
        for (RoomRental roomRental : roomRentals) {
            Runnable task = new Runnable() {
                @Override
                public void run() {
                    try {
                        EmailUtility.sendEmail("anhntlhe150434@fpt.edu.vn", "ĐÓNG TIỀN TRỌ THÁNG " 
                                + new Date().getMonth(), roomRental.getToltalPriceByMonth(new Date().getMonth()) + "");
                    } catch (MessagingException ex) {
                        Logger.getLogger(RentalSendEmail.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            };
            Thread thread = new Thread(task);
            thread.start();
        }
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
