<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S C O P E // Register</title>
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
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container { 
            width: 90%; 
            max-width: 450px;
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
        input[type="text"], input[type="password"] { 
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
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: var(--accent);
            box-shadow: 0 0 15px var(--glow);
            background: rgba(20, 20, 20, 0.8);
        }
        .btn { 
            width: 100%;
            padding: 12px 20px; 
            cursor: pointer; 
            font-family: 'Orbitron', sans-serif;
            font-size: 1rem;
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
            margin-top: 15px;
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
            text-align: center;
        }
        .links {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
        }
        .links a {
            color: var(--text-muted);
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .links a:hover {
            color: var(--accent);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register Operator</h2>
        
        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
            <div class="error">[ERROR] <%= error %></div>
        <% } %>

        <form action="signup" method="post">
            <div class="form-group">
                <label for="username">New Operator ID</label>
                <input type="text" id="username" name="username" placeholder="Choose ID..." required autofocus>
            </div>
            <div class="form-group">
                <label for="password">Passcode</label>
                <input type="password" id="password" name="password" placeholder="Create passcode..." required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Passcode</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm passcode..." required>
            </div>
            <button type="submit" class="btn">Initialize Registration</button>
        </form>

        <div class="links">
            <a href="login">Already have an ID? Authenticate here.</a>
        </div>
    </div>
</body>
</html>
