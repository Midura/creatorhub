$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

# 1. Remove the old shapes HTML from index.html
$patternHtml = '(?s)<!-- Interactive Mouse Parallax Shapes -->.*?</div>'
$html = [System.Text.RegularExpressions.Regex]::Replace($html, $patternHtml, "")
[System.IO.File]::WriteAllText("f:\Website\index.html", $html, (New-Object System.Text.UTF8Encoding $false))

# 2. Clean up style.css (Remove old animations, add new drift animation)
$css = [System.IO.File]::ReadAllText("f:\Website\style.css", [System.Text.Encoding]::UTF8)
$patternCss = '(?s)/\w* Geometric Shape Animations \w*/.*'
$css = [System.Text.RegularExpressions.Regex]::Replace($css, $patternCss, "")

$cssAppend = @"
/* Dynamic Drifting Shapes */
.drifting-shape {
  position: fixed;
  pointer-events: none;
  z-index: -1;
  opacity: 0;
  animation: popupFloat 8s ease-in-out forwards;
}

@keyframes popupFloat {
  0% { opacity: 0; transform: translateY(50px) scale(0.5); }
  20% { opacity: 0.6; transform: translateY(0px) scale(1.1); }
  30% { transform: translateY(-10px) scale(1); }
  80% { opacity: 0.6; transform: translateY(-100px) scale(1); }
  100% { opacity: 0; transform: translateY(-150px) scale(0.8); }
}

body.dark-theme .drifting-shape[style*="fill: var(--dark)"] { fill: var(--white) !important; }
body.dark-theme .drifting-shape[style*="stroke: var(--dark)"] { stroke: var(--white) !important; }
"@
[System.IO.File]::WriteAllText("f:\Website\style.css", $css + $cssAppend, (New-Object System.Text.UTF8Encoding $false))

# 3. Update main.js (Remove mouse parallax, add particle spawner)
$js = [System.IO.File]::ReadAllText("f:\Website\main.js", [System.Text.Encoding]::UTF8)
$patternJs = '(?s)// Interactive Mouse Parallax Engine.*'
$js = [System.Text.RegularExpressions.Regex]::Replace($js, $patternJs, "")

$jsAppend = @"
// Dynamic Floating Shapes Engine (Popup, Drift, and Fade)
const svgShapes = [
  // Sparkle
  `<svg viewBox="0 0 100 100"><path d="M50 0 C50 40, 60 50, 100 50 C60 50, 50 60, 50 100 C50 60, 40 50, 0 50 C40 50, 50 40, 50 0 Z"></path></svg>`,
  // Arch
  `<svg viewBox="0 0 100 120" style="fill: none; stroke-width: 4;"><path d="M 10 110 L 10 50 A 40 40 0 0 1 90 50 L 90 110"></path></svg>`,
  // Wavy Badge
  `<svg viewBox="0 0 100 100"><path d="M50 5 L60 20 L77 15 L80 32 L96 35 L90 50 L96 65 L80 68 L77 85 L60 80 L50 95 L40 80 L23 85 L20 68 L4 65 L10 50 L4 35 L20 32 L23 15 L40 20 Z"></path></svg>`,
  // Zig Zag
  `<svg viewBox="0 0 100 50" style="fill: none; stroke-width: 6; stroke-linecap: round;"><polyline points="10,40 30,10 50,40 70,10 90,40"></polyline></svg>`
];

function spawnShape() {
  const shapeDiv = document.createElement('div');
  shapeDiv.className = 'drifting-shape';
  
  // Randomize shape
  const randomShape = svgShapes[Math.floor(Math.random() * svgShapes.length)];
  shapeDiv.innerHTML = randomShape;
  
  // Randomize styling
  const svgEl = shapeDiv.firstChild;
  const isDark = Math.random() > 0.5;
  const color = isDark ? 'var(--dark)' : 'var(--primary)';
  
  if(randomShape.includes('fill: none')) {
    svgEl.style.stroke = color;
  } else {
    svgEl.style.fill = color;
  }
  
  // Randomize size and position
  const size = Math.floor(Math.random() * 40) + 40; // 40px to 80px
  svgEl.style.width = size + 'px';
  
  // Random horizontal position (5% to 95%)
  shapeDiv.style.left = (Math.floor(Math.random() * 90) + 5) + 'vw';
  
  // Random vertical spawn (20% to 80%)
  shapeDiv.style.top = (Math.floor(Math.random() * 60) + 20) + 'vh';
  
  // Random animation duration between 6s and 12s
  shapeDiv.style.animationDuration = (Math.floor(Math.random() * 6) + 6) + 's';

  document.body.appendChild(shapeDiv);

  // Remove the shape from DOM after animation completes (12000ms max)
  setTimeout(() => {
    shapeDiv.remove();
  }, 12000);
}

// Spawn a new shape every 1.5 seconds
setInterval(spawnShape, 1500);

// Spawn a few instantly on load
for(let i=0; i<4; i++) {
  setTimeout(spawnShape, i * 300);
}
"@
[System.IO.File]::WriteAllText("f:\Website\main.js", $js + $jsAppend, (New-Object System.Text.UTF8Encoding $false))

Write-Output "Successfully built Dynamic Spawner!"
