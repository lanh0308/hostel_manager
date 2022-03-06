/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.service;

import com.google.gson.Gson;
import controller.admin.auth.BaseAuthAdminController;
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
import model.Service;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class EditServiceController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        return true;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ServiceDBContext serviceDB = new ServiceDBContext();
        Service service = serviceDB.getService(id);
        ServiceCategoryDBContext serviceCategoryDB = new ServiceCategoryDBContext();
        ArrayList<ServiceCategory> serviceCategorys = serviceCategoryDB.getServiceCategorys();
        request.setAttribute("serviceCategorys", serviceCategorys);
        request.setAttribute("service", service);
        request.getRequestDispatcher("/view/admin/service/edit.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String start_date_string = request.getParameter("start_date");
            String end_date_string = request.getParameter("end_date");
            String old_indicator_string = request.getParameter("old_indicator");
            String new_indicator_string = request.getParameter("new_indicator");
            int old_indicator = Integer.parseInt(old_indicator_string);
            int new_indicator = Integer.parseInt(new_indicator_string);

            Date start_date = Date.valueOf(start_date_string);
            Date end_date = Date.valueOf(end_date_string);

            ServiceDBContext serviceDB = new ServiceDBContext();
            Service service = serviceDB.getService(id);
            service.setStart_date(start_date);
            service.setEnd_date(end_date);
            service.setNew_indicator(new_indicator);
            service.setOld_indicator(old_indicator);

            serviceDB.updateService(service);
            String json = new Gson().toJson(service);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            String json = new Gson().toJson(new Error(e.getMessage()));
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }

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
