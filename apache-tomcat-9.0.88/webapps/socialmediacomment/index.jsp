<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S C O P E // Welcome</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&family=Rajdhani:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css">
    <style>
        body { height: 400vh; } /* Required for scroll animation */
    </style>
</head>
<body>
    <div id="particles-js"></div>
    
    <div class="sticky-wrapper">
        <div class="core-animation">
            <img src="assets/core1.png" class="core-frame" id="frame1">
            <img src="assets/core2.png" class="core-frame" id="frame2">
            <img src="assets/core3.png" class="core-frame" id="frame3">
        </div>
        
        <div class="container">
            <h1 class="glitch" data-text="S C O P E">S C O P E</h1>
            <p>Advanced Social Filter & Communications Relay</p>
            <a href="login" class="btn">Initialize Login</a>
        </div>
        
        <div class="scroll-indicator">Scroll to Initiate Sequence ▼</div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
        // Initialize particles
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

        // Scroll animation logic
        const frames = [
            document.getElementById('frame1'),
            document.getElementById('frame2'),
            document.getElementById('frame3')
        ];
        
        frames[0].style.opacity = 1;

        window.addEventListener('scroll', () => {
            const maxScroll = document.body.scrollHeight - window.innerHeight;
            const scrollFraction = window.scrollY / maxScroll;
            const frameIndex = scrollFraction * (frames.length - 1);
            
            frames.forEach((frame, index) => {
                const distance = Math.abs(frameIndex - index);
                let opacity = 1 - distance;
                if (opacity < 0) opacity = 0;
                frame.style.opacity = opacity;
                
                const scale = 1 + (scrollFraction * 0.15);
                frame.style.transform = `scale(${scale})`;
            });
            
            const indicator = document.querySelector('.scroll-indicator');
            if (scrollFraction > 0.05) {
                indicator.style.opacity = 0;
                indicator.style.transition = 'opacity 0.5s';
            } else {
                indicator.style.opacity = 1;
            }
        });
    </script>
</body>
</html>
