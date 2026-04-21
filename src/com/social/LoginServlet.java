package com.social;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Use UserManager to verify credentials against SQLite DB
        if (userManager.authenticate(username, password)) {
            // Success! Set a simple session attribute
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", username);
            
            // Redirect to comments feed
            response.sendRedirect("comments");
        } else {
            // Failure! Forward back to login with error
            request.setAttribute("error", "Invalid Operator ID or Passcode.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
