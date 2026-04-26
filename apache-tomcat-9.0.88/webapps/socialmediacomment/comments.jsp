<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.social.Comment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S C O P E // Social Filter</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&family=Rajdhani:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <div id="particles-js"></div>
    
    <div class="layout-wrapper">
        <div class="container">
            <h2 class="glitch" data-text="Comments Section">Comments Section</h2>

            <% String error = (String) request.getAttribute("error");
               if (error != null) { %>
                <div class="error">[ERROR] <%= error %></div>
            <% } %>

            <form action="comments" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter username..." autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="commentText">Comment</label>
                    <input type="text" id="commentText" name="commentText" placeholder="Write a comment..." autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="likes">Likes</label>
                    <input type="number" id="likes" name="likes" value="0" min="0">
                </div>
                
                <% boolean isViewing = (request.getAttribute("comments") != null); %>
                <input type="hidden" name="viewing" value="<%= isViewing %>">
                <div class="btn-group">
                    <button type="submit" class="btn">Add Comment</button>
                    <% if (isViewing) { %>
                        <a href="comments" class="btn btn-secondary">Hide Comments</a>
                    <% } else { %>
                        <a href="viewComments" class="btn btn-secondary">View Comments</a>
                    <% } %>
                    <a href="sortComments" class="btn">Sort Comments</a>
                </div>
            </form>

            <div class="comments">
                <h3>Comments</h3>
                <% 
                   ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
                   if (comments != null && !comments.isEmpty()) {
                       for (Comment c : comments) {
                %>
                    <div class="comment">
                        <div class="comment-header">
                            <span class="comment-user"><%= c.getUserName() %></span>
                            <span class="comment-likes"><%= c.getLikes() %></span>
                        </div>
                        <div class="comment-body">
                            <%= c.getFormattedComment() %>
                        </div>
                    </div>
                <% 
                       }
                   } else {
                %>
                    <div class="empty-state">
                        Click View Comments to see comments.
                    </div>
                <% } %>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
        particlesJS('particles-js', {
            "particles": {
                "number": { "value": 80, "density": { "enable": true, "value_area": 800 } },
                "color": { "value": ["#05D9E8", "#FF2A6D", "#ffffff"] },
                "shape": { "type": "circle" },
                "opacity": { "value": 0.5, "random": true, "anim": { "enable": true, "speed": 1, "opacity_min": 0.1, "sync": false } },
                "size": { "value": 3, "random": true, "anim": { "enable": true, "speed": 2, "size_min": 0.1, "sync": false } },
                "line_linked": { "enable": true, "distance": 150, "color": "#05D9E8", "opacity": 0.2, "width": 1 },
                "move": { "enable": true, "speed": 1, "direction": "none", "random": true, "straight": false, "out_mode": "out", "bounce": false }
            },
            "interactivity": {
                "detect_on": "canvas",
                "events": { "onhover": { "enable": true, "mode": "grab" }, "onclick": { "enable": true, "mode": "push" }, "resize": true },
                "modes": { "grab": { "distance": 140, "line_linked": { "opacity": 0.5 } }, "push": { "particles_nb": 4 } }
            },
            "retina_detect": true
        });
    </script>
</body>
</html>
