package com.social;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/comments")
public class CommentServlet extends HttpServlet {
    
    private CommentManager manager;

    @Override
    public void init() throws ServletException {
        // Initialize the CommentManager which will also create the DB table if it doesn't exist
        manager = new CommentManager();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to JSP without loading comments initially
        request.getRequestDispatcher("/comments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String commentText = request.getParameter("commentText");
        String likesStr = request.getParameter("likes");
        String viewing = request.getParameter("viewing");

        try {
            int likes = Integer.parseInt(likesStr);
            Comment c = new Comment(username, commentText, likes);
            manager.addComment(c);
        } catch (InvalidCommentException e) {
            request.setAttribute("error", e.getMessage());
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Likes must be a number!");
        } catch (Exception e) {
            request.setAttribute("error", "Unexpected error: " + e.getMessage());
        }

        // If there's an error, forward to the JSP so the error message is displayed
        if (request.getAttribute("error") != null) {
            request.getRequestDispatcher("/comments.jsp").forward(request, response);
        } else {
            // Redirect based on previous viewing state
            if ("true".equals(viewing)) {
                response.sendRedirect("viewComments");
            } else {
                response.sendRedirect("comments");
            }
        }
    }
}
