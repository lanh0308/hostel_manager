/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.room;

import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Room;

/**
 *
 * @author lanh0
 */
public class ChangePassRoomController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "ROOM", "UPDATE");
        return isPer;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RoomDBContext roomDB = new RoomDBContext();
        Room room = roomDB.getRoom(id);
        request.setAttribute("room", room);
        request.getRequestDispatcher("/view/admin/room/changepass.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RoomDBContext roomDB = new RoomDBContext();
        Room room = roomDB.getRoom(id);
        request.setAttribute("room", room);
        String password = request.getParameter("password");
        AccountDBContext accountDB = new AccountDBContext();
        Account account = accountDB.getAccount("MAP"+room.getName());
        if(account==null){
            Account account_new = new Account();
            account_new.setUsername("MAP"+room.getName());
            account_new.setPassword(password);
            accountDB.insert(account_new);
        }else{
            account.setPassword(password);
            accountDB.update(account);
        }
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
