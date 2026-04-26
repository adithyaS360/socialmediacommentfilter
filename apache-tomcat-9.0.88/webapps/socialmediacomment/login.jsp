<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S C O P E // Authenticate</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&family=Rajdhani:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <div id="particles-js"></div>
    
    <div class="layout-wrapper">
        <div class="container">
            <h2 class="glitch" data-text="Authentication">Authentication</h2>
            
            <% String error = (String) request.getAttribute("error");
               if (error != null) { %>
                <div class="error">[ERROR] <%= error %></div>
            <% } %>
            
            <% String success = (String) request.getAttribute("success");
               if (success != null) { %>
                <div class="success">[SYS] <%= success %></div>
            <% } %>

            <form action="login" method="post">
                <div class="form-group">
                    <label for="username">Operator ID</label>
                    <input type="text" id="username" name="username" placeholder="Enter ID..." required autofocus>
                </div>
                <div class="form-group">
                    <label for="password">Passcode</label>
                    <input type="password" id="password" name="password" placeholder="Enter passcode..." required>
                </div>
                <button type="submit" class="btn">Verify</button>
            </form>

            <div class="links">
                <a href="signup">New Operator? Initialize Registration.</a>
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
