/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.PasswordUtil;
import util.Validation;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChangePassController", urlPatterns = {"/changepass"})
public class ChangePassController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //get form data
        String oldPass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        //create user DAO
        UserDAO userDAO = new UserDAO();
        //get user object from session
        User user = (User) request.getSession().getAttribute("User");
        request.setAttribute("user", user);
        //check timeout of generatedPass
        new Validation().checkExistedGeneratedPass(request, response);

        //check if old pass data match with old pass user object
        if (user.getPassword().equals(new PasswordUtil().hashPasswordMD5(oldPass))) {
            //update password on database
            userDAO.changePassword(String.valueOf(user.getUserId()), new PasswordUtil().hashPasswordMD5(newpass));
            //update password of user object
            user.setPassword(newpass);
            //send status message
            request.setAttribute("message", "Change password successfully");
            //request to userprofile.jsp
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);

        }//old password not match with the one in database
        else {
            request.setAttribute("message", "Old password is wrong!");
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);
        }

    }

    private boolean validatePassword(String password) {
        // Check if the username has at least 6 characters
        return password.trim().length() >= 6;
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
