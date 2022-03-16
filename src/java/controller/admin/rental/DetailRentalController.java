/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.rental;

import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.RoomRentalDBContext;
import dl.ServiceCategoryDBContext;
import dl.ServiceDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Pagination;
import model.RoomRental;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class DetailRentalController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "RENTAL", "READ");
        return isPer;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        int pageSize = 3;
        String page = request.getParameter("page");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        if (page == null || page.trim().length() == 0) {
            page = "1";
        }
        int pageIndex = 0;
        try {
            pageIndex = Integer.parseInt(page);
            if (pageIndex <= 0) {
                pageIndex = 1;
            }
        } catch (Exception e) {
            pageIndex = 1;
        }
        int id = Integer.parseInt(idString);
        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        ServiceDBContext serviceDB = new ServiceDBContext();
        ArrayList<Date> start_dates = serviceDB.getAllStartDate(id);
        ArrayList<Date> end_dates = serviceDB.getAllEndDate(id);
        Pagination pagination = new Pagination(pageIndex, pageSize, serviceDB.getSize(id, start_date, end_date));
        RoomRental roomRental = roomRentalDB.getRoomRentalBySearch(id, start_date, end_date, pageIndex, pageSize);
        
        request.setAttribute("roomRental", roomRental);
        request.setAttribute("pagination", pagination);
        request.setAttribute("start_dates", start_dates);
        request.setAttribute("end_dates", end_dates);
        ServiceCategoryDBContext serviceCategoryDB = new ServiceCategoryDBContext();
        ArrayList<ServiceCategory> serviceCategorys = serviceCategoryDB.getServiceCategorys();
        
        ServiceDBContext serviceDBContext = new ServiceDBContext();
        Date newDateServices = serviceDBContext.getNewDateServices(id);
        ArrayList<Integer> oldNumberServices = serviceDBContext.getOldNumberServices(id);
        request.setAttribute("newDateServices", newDateServices);
        request.setAttribute("oldNumberServices", oldNumberServices);
        request.setAttribute("serviceCategorys", serviceCategorys);
        request.getRequestDispatcher("/view/admin/rental/detail.jsp").forward(request, response);
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
