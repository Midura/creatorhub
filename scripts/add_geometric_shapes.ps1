$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

# 1. HTML Injection
$shapeHtml = @"
<body>
  <!-- Parallax Decorative Shapes -->
  <div id="parallax-shapes" style="position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; pointer-events: none; z-index: -1; overflow: hidden;">
    
    <!-- Sparkle Star 1 -->
    <svg class="p-shape shape-spin-slow" data-speed="0.2" style="position: absolute; top: 15%; left: 10%; width: 50px; fill: var(--primary);" viewBox="0 0 100 100">
      <path d="M50 0 C50 40, 60 50, 100 50 C60 50, 50 60, 50 100 C50 60, 40 50, 0 50 C40 50, 50 40, 50 0 Z"></path>
    </svg>

    <!-- Sparkle Star 2 (Dark) -->
    <svg class="p-shape shape-spin-reverse" data-speed="-0.3" style="position: absolute; top: 70%; right: 15%; width: 40px; fill: var(--dark); opacity: 0.8;" viewBox="0 0 100 100">
      <path d="M50 0 C50 40, 60 50, 100 50 C60 50, 50 60, 50 100 C50 60, 40 50, 0 50 C40 50, 50 40, 50 0 Z"></path>
    </svg>

    <!-- Dot Grid -->
    <svg class="p-shape shape-float" data-speed="0.1" style="position: absolute; top: 30%; right: 10%; width: 80px; fill: var(--dark); opacity: 0.3;" viewBox="0 0 100 100">
      <circle cx="10" cy="10" r="5"/><circle cx="35" cy="10" r="5"/><circle cx="60" cy="10" r="5"/><circle cx="85" cy="10" r="5"/>
      <circle cx="10" cy="35" r="5"/><circle cx="35" cy="35" r="5"/><circle cx="60" cy="35" r="5"/><circle cx="85" cy="35" r="5"/>
      <circle cx="10" cy="60" r="5"/><circle cx="35" cy="60" r="5"/><circle cx="60" cy="60" r="5"/><circle cx="85" cy="60" r="5"/>
      <circle cx="10" cy="85" r="5"/><circle cx="35" cy="85" r="5"/><circle cx="60" cy="85" r="5"/><circle cx="85" cy="85" r="5"/>
    </svg>

    <!-- Outlined Arch -->
    <svg class="p-shape shape-float-delay" data-speed="-0.15" style="position: absolute; bottom: 10%; left: 20%; width: 100px; stroke: var(--primary); stroke-width: 4; fill: none; opacity: 0.8;" viewBox="0 0 100 120">
      <path d="M 10 110 L 10 50 A 40 40 0 0 1 90 50 L 90 110"></path>
    </svg>

    <!-- Wavy Badge (Solid) -->
    <svg class="p-shape shape-spin-slow" data-speed="0.4" style="position: absolute; top: 50%; left: 5%; width: 70px; fill: var(--primary); opacity: 0.7;" viewBox="0 0 100 100">
      <path d="M50 5 L60 20 L77 15 L80 32 L96 35 L90 50 L96 65 L80 68 L77 85 L60 80 L50 95 L40 80 L23 85 L20 68 L4 65 L10 50 L4 35 L20 32 L23 15 L40 20 Z"></path>
    </svg>

    <!-- Small Circle -->
    <svg class="p-shape" data-speed="-0.5" style="position: absolute; top: 80%; left: 50%; width: 30px; stroke: var(--dark); stroke-width: 8; fill: none; opacity: 0.5;" viewBox="0 0 100 100">
      <circle cx="50" cy="50" r="40"></circle>
    </svg>

    <!-- Zig Zag -->
    <svg class="p-shape shape-float" data-speed="0.25" style="position: absolute; top: 10%; left: 60%; width: 60px; stroke: var(--dark); stroke-width: 6; fill: none; stroke-linecap: round; stroke-linejoin: round; opacity: 0.4;" viewBox="0 0 100 50">
      <polyline points="10,40 30,10 50,40 70,10 90,40"></polyline>
    </svg>

  </div>
"@

$html = $html.Replace("<body>", $shapeHtml)
[System.IO.File]::WriteAllText("f:\Website\index.html", $html, (New-Object System.Text.UTF8Encoding $false))


# 2. CSS Injection
$cssAppend = @"

/* Geometric Shape Animations */
@keyframes shapeSpinSlow { 100% { transform: rotate(360deg); } }
@keyframes shapeSpinReverse { 100% { transform: rotate(-360deg); } }
@keyframes shapeFloat { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-30px); } }

.shape-spin-slow { animation: shapeSpinSlow 20s linear infinite; }
.shape-spin-reverse { animation: shapeSpinReverse 25s linear infinite; }
.shape-float { animation: shapeFloat 8s ease-in-out infinite; }
.shape-float-delay { animation: shapeFloat 10s ease-in-out infinite 2s; }

body.dark-theme .p-shape[style*="fill: var(--dark)"] { fill: var(--white) !important; }
body.dark-theme .p-shape[style*="stroke: var(--dark)"] { stroke: var(--white) !important; }
"@
Add-Content -Path "f:\Website\style.css" -Value $cssAppend -Encoding UTF8


# 3. JS Injection (Parallax Logic)
$jsAppend = @"

// Parallax Scrolling for Geometric Shapes
document.addEventListener('scroll', function() {
  const scrolled = window.scrollY;
  const shapes = document.querySelectorAll('.p-shape');
  
  shapes.forEach(shape => {
    const speed = shape.getAttribute('data-speed');
    const yPos = -(scrolled * speed);
    
    // We maintain the CSS transforms (like rotate from animations) by using a wrapper or just translating the base
    // To not overwrite CSS animations, we apply the parallax to a transform property directly via JS,
    // but CSS animations overwrite inline transform.
    // So we translate the shape's margins or top/left instead, or wrap them. 
    // Since they are absolute, we can use margin-top for safe parallax!
    shape.style.marginTop = yPos + 'px';
  });
});
"@
Add-Content -Path "f:\Website\main.js" -Value $jsAppend -Encoding UTF8

Write-Output "Successfully injected Geometric Parallax Shapes!"
