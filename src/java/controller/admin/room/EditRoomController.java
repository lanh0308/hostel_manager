/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.room;

import controller.admin.auth.BaseAuthAdminController;
import dl.RoomCategoryDBContext;
import dl.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;
import model.RoomCategory;

/**
 *
 * @author lanh0
 */
public class EditRoomController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        return true;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rid = request.getParameter("id");
        int id = Integer.parseInt(rid);
        RoomDBContext roomDB = new RoomDBContext();
        Room room = roomDB.getRoom(id);
        request.setAttribute("room", room);
        RoomCategoryDBContext roomCategoryDBContext = new RoomCategoryDBContext();
        ArrayList<RoomCategory> roomCategorys = roomCategoryDBContext.getRoomCategorys();
        request.setAttribute("roomCategorys", roomCategorys);
        request.getRequestDispatcher("/view/admin/room/edit.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idString = request.getParameter("id");
        String idCategoryString = request.getParameter("roomCategory");
        String name = request.getParameter("name");
        int idCategory = Integer.parseInt(idCategoryString);
        int id = Integer.parseInt(idString);
        RoomDBContext roomDB = new RoomDBContext();
        Room room = roomDB.getRoom(id);
        room.setName(name);
        RoomCategoryDBContext roomCategoryDB = new RoomCategoryDBContext();
        RoomCategory roomCategory= roomCategoryDB.getRoomCategory(idCategory);
        room.setRoomCategory(roomCategory);
        roomDB.updateRoom(room);
        response.sendRedirect("/admin/room");
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
