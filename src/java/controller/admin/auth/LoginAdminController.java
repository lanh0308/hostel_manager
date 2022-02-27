/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.auth;

import dl.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import utils.HashPass;

/**
 *
 * @author lanh0
 */
public class LoginAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            if(username==null || username.isEmpty() || password==null || password.isEmpty()){
                throw new Exception("Username and password is required!");
            }

            HashPass hashpass = new HashPass();
            String password_hash = hashpass.hashPassword(password);

            AccountDBContext accountDB = new AccountDBContext();
            Account account = accountDB.getAccount(username, password);
            if(account==null){
                throw new Exception("Username and password is wrong!");
            } else{
                request.getSession().setAttribute("account", account);
                response.sendRedirect("/dashboard");
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/view/admin/auth/login.jsp").forward(request, response);
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
