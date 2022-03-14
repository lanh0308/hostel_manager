/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.service;

import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.ServiceDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Service;

/**
 *
 * @author lanh0
 */
public class UpdateStateServiceController extends BaseAuthAdminController {
    
    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "SERVICE", "UPDATE");
        return isPer;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] payments = request.getParameterValues("payment[]");
        String state = request.getParameter("state");
        Boolean isState = Boolean.parseBoolean(state);
        for (String payment : payments) {
            ServiceDBContext serviceDB = new ServiceDBContext();
            int id = Integer.parseInt(payment);
            Service service = serviceDB.getService(id);
            service.setState(isState);
            serviceDB.updateServiceState(service);
        }
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
