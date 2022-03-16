/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.service;

import com.google.gson.Gson;
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
import model.RoomRental;
import model.Service;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class AddServiceController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "SERVICE", "ADD");
        return isPer;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        RoomRentalDBContext romRentalDBContext = new RoomRentalDBContext();
        RoomRental roomRental = romRentalDBContext.getRoomRental(id);
        
        request.setAttribute("roomRental", roomRental);
        ServiceCategoryDBContext serviceCategoryDB = new ServiceCategoryDBContext();
        ArrayList<ServiceCategory> serviceCategorys = serviceCategoryDB.getServiceCategorys();
        request.setAttribute("serviceCategorys", serviceCategorys);
        request.getRequestDispatcher("/view/admin/service/add.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String start_date_string = request.getParameter("start_date");
        String end_date_string = request.getParameter("end_date");
        String old_indicator_dien_string = request.getParameter("old_indicator_dien");
        String new_indicator_dien_string = request.getParameter("new_indicator_dien");
        String service_category_dien_string = request.getParameter("service_category_dien");
        int old_indicator_dien = Integer.parseInt(old_indicator_dien_string);
        int new_indicator_dien = Integer.parseInt(new_indicator_dien_string);
        int service_category_dien = Integer.parseInt(service_category_dien_string);
        String old_indicator_nuoc_string = request.getParameter("old_indicator_nuoc");
        String new_indicator_nuoc_string = request.getParameter("new_indicator_nuoc");
        String service_category_nuoc_string = request.getParameter("service_category_nuoc");
        int old_indicator_nuoc = Integer.parseInt(old_indicator_nuoc_string);
        int new_indicator_nuoc = Integer.parseInt(new_indicator_nuoc_string);
        int service_category_nuoc = Integer.parseInt(service_category_nuoc_string);

        Date start_date = Date.valueOf(start_date_string);
        Date end_date = Date.valueOf(end_date_string);

        RoomRentalDBContext roomRentalDB = new RoomRentalDBContext();
        RoomRental roomRental = roomRentalDB.getRoomRental(id);

        ServiceCategoryDBContext serviceCategoryDB = new ServiceCategoryDBContext();
        ArrayList<ServiceCategory> serviceCategorys = serviceCategoryDB.getServiceCategorys();
        ServiceCategory serviceCategoryDien = serviceCategoryDB.getServiceCategory(service_category_dien);
        ServiceCategory serviceCategoryNuoc = serviceCategoryDB.getServiceCategory(service_category_nuoc);

        ServiceDBContext serviceDB = new ServiceDBContext();
        Service service = new Service();
        service.setRoom_retal(roomRental);
        service.setService_category(serviceCategoryDien);
        service.setStart_date(start_date);
        service.setEnd_date(end_date);
        service.setState(false);
        service.setNew_indicator(new_indicator_dien);
        service.setOld_indicator(old_indicator_dien);
        serviceDB.insertService(service);

        serviceDB = new ServiceDBContext();
        service = new Service();
        service.setRoom_retal(roomRental);
        service.setService_category(serviceCategoryNuoc);
        service.setStart_date(start_date);
        service.setEnd_date(end_date);
        service.setState(false);
        service.setNew_indicator(new_indicator_nuoc);
        service.setOld_indicator(old_indicator_nuoc);
        serviceDB.insertService(service);

        for (ServiceCategory serviceCategory : serviceCategorys) {
            if (serviceCategory.getId()!= service_category_dien && serviceCategory.getId() != service_category_nuoc) {
                serviceDB = new ServiceDBContext();
                service = new Service();
                service.setRoom_retal(roomRental);
                service.setService_category(serviceCategory);
                service.setStart_date(start_date);
                service.setEnd_date(end_date);
                service.setState(false);
                service.setNew_indicator(0);
                service.setOld_indicator(0);
                serviceDB.insertService(service);
            }
        }

        String json = new Gson().toJson(service);
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
