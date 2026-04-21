package com.social;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    private UserManager userManager;

    @Override
    public void init() throws ServletException {
        userManager = new UserManager();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (password == null || !password.equals(confirmPassword)) {
            request.setAttribute("error", "Passcodes do not match.");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
            return;
        }

        boolean success = userManager.register(username, password);

        if (success) {
            // Registration successful, redirect to login page with a success message
            request.setAttribute("success", "Operator ID created successfully. Please authenticate.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            // Failure, likely username already exists
            request.setAttribute("error", "Operator ID already exists or is invalid.");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        }
    }
}
