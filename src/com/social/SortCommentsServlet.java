package com.social;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/sortComments")
public class SortCommentsServlet extends HttpServlet {
    
    private CommentManager manager;

    @Override
    public void init() throws ServletException {
        manager = new CommentManager();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("comments", manager.getSortedComments());
        request.getRequestDispatcher("/comments.jsp").forward(request, response);
    }
}
