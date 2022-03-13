/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin.report;

import com.google.gson.Gson;
import controller.admin.auth.BaseAuthAdminController;
import dl.ReportDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Report;

/**
 *
 * @author lanh0
 */
public class ReportEditController extends BaseAuthAdminController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        return true;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");
        String process_note = request.getParameter("process_note");
        ReportDBContext reportDB = new ReportDBContext();
        Report report = reportDB.getReport(id);
        report.setStatus(status);
        report.setProcess_note(process_note);
        Timestamp updated_at = new Timestamp(System.currentTimeMillis());
        report.setUpdated(updated_at);
        reportDB.update(report);
        String json = new Gson().toJson(report);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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
