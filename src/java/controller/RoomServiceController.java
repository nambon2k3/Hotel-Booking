package controller;

import dao.RoomServiceDAO;
import dao.ServiceDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.RoomService;
import model.Servicess;

@WebServlet(name = "RoomServiceController", urlPatterns = {"/room-service"})
public class RoomServiceController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String roomId = request.getParameter("id");

        List<Servicess> roomServicesList = new ServiceDAO().getServicesByRoomId(Integer.parseInt(roomId));
        List<Servicess> servicesList = new ServiceDAO().getServices();

        request.setAttribute("serviceList", servicesList);
        request.setAttribute("roomServiceList", roomServicesList);

        if (action != null) {
            switch (action) {
                case "add":
                    addService(request, response);
                    return;
                case "delete":
                    deleteService(request, response);
                    return;
                default:
                    // Handle unknown actions
                    break;
            }
        }

        // Forward the request to the service list JSP page
        request.getRequestDispatcher("room-service.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void addService(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));

        // Create a new RoomServices object
        RoomService newRoomService = new RoomService(roomId, serviceId);

        // Add the room service to the database
        boolean success = new RoomServiceDAO().addRoomService(newRoomService);

        // Redirect to the service list page with success/failure parameter
        if (success) {
            response.sendRedirect("room-service?id=" + roomId + "&success");
        } else {
            response.sendRedirect("room-service?id=" + roomId + "&fail");
        }
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));

        // Delete the service from the room
        boolean success = new RoomServiceDAO().deleteRoomService(roomId, serviceId);

        // Redirect to the service list page with success/failure parameter
        if (success) {
            response.sendRedirect("room-service?id=" + roomId + "&success");
        } else {
            response.sendRedirect("room-service?id=" + roomId + "&fail");
        }
    }
}
