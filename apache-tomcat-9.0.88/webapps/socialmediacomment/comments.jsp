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
    <style>
        :root {
            --bg-color: #050505;
            --surface-color: #111111;
            --text-main: #ffffff;
            --text-muted: #888888;
            --accent: #ffffff;
            --border: #333333;
            --glow: rgba(255, 255, 255, 0.15);
        }

        body { 
            font-family: 'Rajdhani', sans-serif; 
            margin: 0; 
            padding: 0;
            background-color: var(--bg-color);
            color: var(--text-main);
            background-image: 
                radial-gradient(circle at 50% 0%, #1a1a1a 0%, transparent 50%),
                linear-gradient(0deg, rgba(0,0,0,0.8) 0%, transparent 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 5vh;
            padding-bottom: 5vh;
        }

        .container { 
            width: 90%; 
            max-width: 600px;
            margin: auto; 
            background: rgba(10, 10, 10, 0.6);
            backdrop-filter: blur(10px);
            border: 1px solid var(--border);
            border-radius: 4px;
            padding: 40px;
            box-shadow: 0 0 40px rgba(0, 0, 0, 0.5), inset 0 0 20px var(--glow);
            position: relative;
            overflow: hidden;
        }

        /* Decorative futuristic lines */
        .container::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; height: 1px;
            background: linear-gradient(90deg, transparent, var(--accent), transparent);
            opacity: 0.5;
        }

        h2 { 
            font-family: 'Orbitron', sans-serif;
            text-align: center;
            font-size: 1.8rem;
            letter-spacing: 4px;
            text-transform: uppercase;
            margin-bottom: 40px;
            color: var(--text-main);
            text-shadow: 0 0 10px rgba(255,255,255,0.3);
        }

        .form-group { 
            margin-bottom: 25px; 
            position: relative;
        }

        label { 
            display: block; 
            margin-bottom: 8px;
            color: var(--text-muted);
            font-size: 0.9rem;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        input[type="text"], input[type="number"] { 
            width: 100%; 
            padding: 12px 15px; 
            background: rgba(0, 0, 0, 0.5);
            border: 1px solid var(--border);
            color: var(--text-main);
            font-family: 'Rajdhani', sans-serif;
            font-size: 1.1rem;
            box-sizing: border-box;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            border-color: var(--accent);
            box-shadow: 0 0 15px var(--glow);
            background: rgba(20, 20, 20, 0.8);
        }

        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn { 
            flex: 1;
            padding: 12px 20px; 
            cursor: pointer; 
            font-family: 'Orbitron', sans-serif;
            font-size: 0.9rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            background: transparent;
            color: var(--text-main);
            border: 1px solid var(--border);
            transition: all 0.3s ease;
            text-align: center;
            text-decoration: none;
            position: relative;
            overflow: hidden;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0; left: -100%; width: 100%; height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
            transition: all 0.4s ease;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            background: var(--text-main);
            color: var(--bg-color);
            box-shadow: 0 0 20px rgba(255,255,255,0.4);
            border-color: var(--text-main);
        }

        .error { 
            background: rgba(255, 0, 0, 0.1);
            border-left: 3px solid #ff3333;
            color: #ff3333; 
            padding: 10px 15px;
            margin-bottom: 25px; 
            font-family: monospace;
            letter-spacing: 1px;
        }

        .comments { 
            margin-top: 50px; 
            border-top: 1px solid var(--border); 
            padding-top: 30px; 
        }

        h3 {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.2rem;
            letter-spacing: 2px;
            color: var(--text-muted);
            margin-bottom: 20px;
        }

        .comment { 
            background: var(--surface-color); 
            padding: 20px; 
            margin-bottom: 15px; 
            border-left: 2px solid var(--border);
            transition: transform 0.2s ease, border-color 0.2s ease;
        }

        .comment:hover {
            transform: translateX(5px);
            border-color: var(--accent);
            background: #151515;
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            border-bottom: 1px dashed var(--border);
            padding-bottom: 5px;
        }

        .comment-user {
            color: var(--accent);
            font-family: 'Orbitron', sans-serif;
            font-size: 0.9rem;
            letter-spacing: 1px;
        }

        .comment-likes {
            font-size: 0.85rem;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .comment-likes::before {
            content: '▲';
            font-size: 0.7rem;
        }

        .comment-body {
            font-size: 1.1rem;
            line-height: 1.5;
            color: #cccccc;
        }

        .empty-state {
            text-align: center;
            padding: 30px;
            color: var(--text-muted);
            border: 1px dashed var(--border);
        }
        
        /* Custom Scrollbar */
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: var(--bg-color); }
        ::-webkit-scrollbar-thumb { background: var(--border); border-radius: 4px; }
        ::-webkit-scrollbar-thumb:hover { background: var(--text-muted); }
    </style>
</head>
<body>

<div class="container">
    <h2>Comments Section</h2>

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
                <a href="comments" class="btn">Hide Comments</a>
            <% } else { %>
                <a href="viewComments" class="btn">View Comments</a>
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

</body>
</html>
