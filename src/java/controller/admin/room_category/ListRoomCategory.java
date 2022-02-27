/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.room_category;

import dl.BedCategoryDBContext;
import dl.RoomCategoryDBContext;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BedCategory;
import model.RoomCategory;

/**
 *
 * @author lanh0
 */
public class ListRoomCategory extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BedCategoryDBContext bedCategoryDBContext = new BedCategoryDBContext();
        ArrayList<BedCategory> bedCategorys = bedCategoryDBContext.getBedCategorys();
        RoomCategoryDBContext roomCategoryDBContext = new RoomCategoryDBContext();
        ArrayList<RoomCategory> roomCategorys = roomCategoryDBContext.getRoomCategorys();
        
        request.setAttribute("bedCategorys", bedCategorys);
        request.setAttribute("roomCategorys", roomCategorys);
        request.getRequestDispatcher("/view/room/category/list.jsp").forward(request, response);
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
