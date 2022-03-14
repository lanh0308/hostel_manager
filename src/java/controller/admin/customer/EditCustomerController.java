/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.customer;

import controller.admin.auth.BaseAuthAdminController;
import dl.AccountDBContext;
import dl.CustomerDBContext;
import dl.ServiceCategoryDBContext;
import dl.ServiceDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Customer;
import model.Service;
import model.ServiceCategory;

/**
 *
 * @author lanh0
 */
public class EditCustomerController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        AccountDBContext accountDB = new AccountDBContext();
        Account account = (Account) request.getSession().getAttribute("admin");
        boolean isPer = accountDB.getPermision(account, "CUSTOMER", "UPDATE");
        return isPer;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CustomerDBContext customerDB = new CustomerDBContext();
        Customer customer = customerDB.getCustomer(id);
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("/view/admin/customer/edit.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CustomerDBContext customerDB = new CustomerDBContext();
        Customer customer = customerDB.getCustomer(id);
        String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        String phone_number = request.getParameter("phone_number");
        String address = new String(request.getParameter("address").getBytes("iso-8859-1"), "utf-8");
        String email = request.getParameter("email");
        String cmnd = request.getParameter("cmnd");
        customer.setName(name);
        customer.setPhone_number(phone_number);
        customer.setAddress(address);
        customer.setEmail(email);
        customer.setCmnd(cmnd);
        customerDB.updateCustomer(customer);
        request.setAttribute("customer", customer);
        request.setAttribute("success", "Update success");
        request.getRequestDispatcher("/view/admin/customer/edit.jsp").forward(request, response);
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
