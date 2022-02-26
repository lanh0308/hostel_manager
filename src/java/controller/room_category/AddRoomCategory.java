/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.room_category;

import dl.BedCategoryDBContext;
import dl.RoomCategoryDBContext;
import java.io.IOException;
import java.sql.Date;
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
public class AddRoomCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BedCategoryDBContext bedCategoryDBContext = new BedCategoryDBContext();
        ArrayList<BedCategory> bedCategorys = bedCategoryDBContext.getBedCategorys();
        RoomCategoryDBContext roomCategoryDBContext = new RoomCategoryDBContext();
        ArrayList<RoomCategory> roomCategorys = roomCategoryDBContext.getRoomCategorys();

        request.setAttribute("bedCategorys", bedCategorys);
        request.setAttribute("roomCategorys", roomCategorys);
        request.getRequestDispatcher("/view/room/category/add.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String x_name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        String x_unit_price = request.getParameter("unit_price");
        String x_area = request.getParameter("area");
        String x_floor_number = request.getParameter("floor_number");
        String x_is_window = request.getParameter("is_window");
        String x_is_balcony = request.getParameter("is_balcony");
        String x_is_kitchen = request.getParameter("is_kitchen");
        String x_desk_number = request.getParameter("desk_number");
        String x_id_bed_category = request.getParameter("id_bed_category");
        
        
        String name = x_name;
        int unit_price = Integer.parseInt(x_unit_price);
        int area = Integer.parseInt(x_area);
        int floor_number = Integer.parseInt(x_floor_number);
        Boolean is_window = (x_is_window.equals("no"));
        Boolean is_balcony = (x_is_balcony.equals("no"));
        Boolean is_kitchen = (x_is_kitchen.equals("no"));
        int desk_number = Integer.parseInt(x_desk_number);
        int id_bed_category = Integer.parseInt(x_id_bed_category);
        
        BedCategoryDBContext bedCategoryDBContext = new BedCategoryDBContext();
        BedCategory bedCategory  = bedCategoryDBContext.getBedCategory(id_bed_category);
        RoomCategory roomCategory = new RoomCategory();
        roomCategory.setName(name);
        roomCategory.setUnit_price(unit_price);
        roomCategory.setAreage(area);
        roomCategory.setFloor_number(floor_number);
        roomCategory.setIs_window(is_window);
        roomCategory.setIs_balcony(is_balcony);
        roomCategory.setIs_kitchen(is_kitchen);
       roomCategory.setDesk_number(desk_number);
       roomCategory.setBed_category(bedCategory);
       
       RoomCategoryDBContext roomCategoryDBContext = new RoomCategoryDBContext();
       roomCategoryDBContext.addRoomCategory(roomCategory);
        response.sendRedirect("/room/category");
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
