/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import model.Feedback;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name="RatingController", urlPatterns={"/rating"})
public class RatingController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RatingController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RatingController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String roomId_raw = request.getParameter("id");
        String starRating_raw = request.getParameter("star");
        String content = request.getParameter("content");
        User user = (User) request.getSession().getAttribute("User");
        
        FeedbackDAO fdao = new FeedbackDAO();
        Feedback f = new Feedback();
        
        try {
            int roomId = Integer.parseInt(roomId_raw);
            int starRating = Integer.parseInt(starRating_raw);
            
            f.setRoomId(roomId);
            f.setUserId(user.getUserId());
            f.setRating(starRating);
            f.setContent(content);
            f.setCreatedDate(new Date());
            
        } catch (Exception e) {
            System.out.println("RatingController: " + e.getMessage());
        }
        
        
        fdao.createFeedback(f);
        request.setAttribute("msg", "success");
        request.getRequestDispatcher("listbooked").forward(request, response);
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
