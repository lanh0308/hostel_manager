/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.report;

import controller.admin.auth.BaseAuthAdminController;
import dl.ReportDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pagination;
import model.Report;

/**
 *
 * @author lanh0
 */
public class ReportAdminController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        return true;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pageSize = 12;
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        String status = request.getParameter("status");
        if (search == null) {
            search = "";
        } else {
            search = new String(search.getBytes("iso-8859-1"), "utf-8");
        }
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
        ReportDBContext reportDB = new ReportDBContext();
        ArrayList<Report> reports = reportDB.getReports(search, status, pageIndex, pageSize);
        Pagination pagination = new Pagination(pageIndex, pageSize, reportDB.getSize(search, status));
        request.setAttribute("reports", reports);
        request.setAttribute("pagination", pagination);
        request.getRequestDispatcher("/view/admin/report/list.jsp").forward(request, response);
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
