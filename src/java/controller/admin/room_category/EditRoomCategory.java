/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.room_category;

import com.google.gson.Gson;
import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.BedCategoryDBContext;
import dl.RoomCategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.BedCategory;
import model.RoomCategory;

/**
 *
 * @author lanh0
 */
public class EditRoomCategory extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "CATEGORY", "UPDATE");
        return isPer;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int rid = Integer.parseInt(request.getParameter("id"));

        RoomCategoryDBContext roomCategoryDBContext = new RoomCategoryDBContext();
        RoomCategory roomCategory = roomCategoryDBContext.getRoomCategory(rid);

        BedCategoryDBContext bedCategoryDBContext = new BedCategoryDBContext();
        ArrayList<BedCategory> bedCategorys = bedCategoryDBContext.getBedCategorys();
        System.out.println(roomCategory);

        request.setAttribute("roomCategory", roomCategory);
        request.setAttribute("bedCategorys", bedCategorys);

        request.getRequestDispatcher("/view/admin/category/edit.jsp").forward(request, response);

    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String x_id = request.getParameter("id");
        String x_name = request.getParameter("name");
        String x_unit_price = request.getParameter("unit_price");
        String x_area = request.getParameter("areage");
        String x_floor_number = request.getParameter("floor_number");
        String x_is_window = request.getParameter("is_window");
        String x_is_balcony = request.getParameter("is_balcony");
        String x_is_kitchen = request.getParameter("is_kitchen");
        String x_desk_number = request.getParameter("desk_number");
        String x_id_bed_category = request.getParameter("bedCategory");

        int id = Integer.parseInt(x_id);
        String name = x_name;
        int unit_price = Integer.parseInt(x_unit_price);
        int area = Integer.parseInt(x_area);
        int floor_number = Integer.parseInt(x_floor_number);
        Boolean is_window = Boolean.parseBoolean(x_is_window);
        Boolean is_balcony = Boolean.parseBoolean(x_is_balcony);
        Boolean is_kitchen = Boolean.parseBoolean(x_is_kitchen);
        int desk_number = Integer.parseInt(x_desk_number);
        int id_bed_category = Integer.parseInt(x_id_bed_category);

        BedCategoryDBContext bedCategoryDBContext = new BedCategoryDBContext();
        BedCategory bedCategory = bedCategoryDBContext.getBedCategory(id_bed_category);
        RoomCategory roomCategory = new RoomCategory();
        roomCategory.setID(id);
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
        roomCategoryDBContext.editRoomCategory(roomCategory);
        String json = new Gson().toJson(roomCategory);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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
