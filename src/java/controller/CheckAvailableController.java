/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Rooms;

/**
 *
 * @author Admin
 */
@WebServlet(name="CheckAvailableController", urlPatterns={"/checkavailable"})
public class CheckAvailableController extends HttpServlet {
   
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
            out.println("<title>Servlet CheckAvailableController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckAvailableController at " + request.getContextPath () + "</h1>");
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
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String numPeople = request.getParameter("numPeople");
        String numRoom_raw = request.getParameter("numRoom");
        String id_raw = request.getParameter("id");
        String status = "";
        RoomDAO rdao = new RoomDAO();
        //System.out.println(checkIn + " " + checkOut + " " + numPeople + " " + numRoom_raw + " " + id_raw);
        try {
            int id = Integer.parseInt(id_raw);
            Rooms room = rdao.getRoomById(id);
            request.setAttribute("room", room);
            int numRoom = Integer.parseInt(numRoom_raw);
            int total =rdao.checkAvailable(id, numRoom);
            if( total > numRoom ) {
                status = "available";
            }
            else {
                status = "unavailable";
            }
            request.setAttribute("total", total);
        } catch (Exception e) {
            status = "unavailable";
            System.out.println("CheckAvailableController: " + e.getMessage());
        }
        
        request.setAttribute("checkIn", checkIn);
        request.setAttribute("checkOut", checkOut);
        request.setAttribute("numPeople", numPeople);
        request.setAttribute("numRoom", numRoom_raw);
        request.setAttribute("status", status);
        request.getRequestDispatcher("roomdetail.jsp").forward(request, response);
        
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
        doGet(request, response);
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