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
import java.util.List;
import model.Rooms;

/**
 *
 * @author lvhn1
 */
@WebServlet(name = "RoomController", urlPatterns = {"/room"})
public class RoomController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Instantiate DAO for accessing rooms
        RoomDAO roomsDAO = new RoomDAO();

        // Retrieve all rooms
        List<Rooms> roomList = roomsDAO.getAllRooms();

        // Set rooms attribute to be accessed in JSP
        request.setAttribute("roomList", roomList);

        // Check if an action parameter is present in the request
        String action = request.getParameter("action");

        if (action != null) {
            // Perform actions based on the provided action parameter
            switch (action) {
                case "add":
                    addRoom(request, response, roomsDAO);
                    break;
                case "update":
                    updateRoom(request, response, roomsDAO);
                    break;
                default:
                    // Handle unknown actions
                    break;
            }
        }

        // Forward the request to the room list JSP page
        else request.getRequestDispatcher("room-list.jsp").forward(request, response);
    }

    private void addRoom(HttpServletRequest request, HttpServletResponse response, RoomDAO roomsDAO) throws IOException {
        // Retrieve room details from the request
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int size = Integer.parseInt(request.getParameter("size"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String img = request.getParameter("img");
        int status = Integer.parseInt(request.getParameter("status"));
        int bid = Integer.parseInt(request.getParameter("bid"));

        // Create a new room object
        Rooms newRoom = new Rooms();
        newRoom.setName(name);
        newRoom.setPrice(price);
        newRoom.setSize(size);
        newRoom.setCapacity(capacity);
        newRoom.setImg(img);
        newRoom.setStatus(status);
        newRoom.setBID(bid);

        // Perform the room addition
        boolean success = roomsDAO.addRoom(newRoom);

        // Redirect to the room list with a success or failure parameter
        if (success) {
            response.sendRedirect("room?success");
        } else {
            response.sendRedirect("room?fail");
        }
    }

    private void updateRoom(HttpServletRequest request, HttpServletResponse response, RoomDAO roomsDAO) throws IOException {
        // Retrieve room details from the request
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int size = Integer.parseInt(request.getParameter("size"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String img = request.getParameter("img");
        int status = Integer.parseInt(request.getParameter("status"));
        int bid = Integer.parseInt(request.getParameter("bid"));

        // Create a new room object
        Rooms updatedRoom = new Rooms();
        updatedRoom.setRID(roomId);
        updatedRoom.setName(name);
        updatedRoom.setPrice(price);
        updatedRoom.setSize(size);
        updatedRoom.setCapacity(capacity);
        updatedRoom.setImg(img);
        updatedRoom.setStatus(status);
        updatedRoom.setBID(bid);

        // Perform the room update
        boolean success = roomsDAO.updateRoom(updatedRoom);

        // Redirect to the room list with a success or failure parameter
        if (success) {
            response.sendRedirect("room?success");
        } else {
            response.sendRedirect("room?fail");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
