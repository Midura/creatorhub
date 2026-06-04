$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

# 1. Replace the old Parallax HTML
# Note: I'll use regex to match the old block and replace it.
$patternHtml = '(?s)<!-- Parallax Decorative Shapes -->.*?</div>'
$newShapesHtml = @"
<!-- Interactive Mouse Parallax Shapes -->
  <div id="interactive-shapes" style="position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; pointer-events: none; z-index: 0; overflow: hidden;">
    
    <!-- Sparkle Star 1 -->
    <svg class="i-shape shape-spin-slow" data-speed="30" style="position: absolute; top: 10%; left: 8%; width: 80px; fill: var(--primary);" viewBox="0 0 100 100">
      <path d="M50 0 C50 40, 60 50, 100 50 C60 50, 50 60, 50 100 C50 60, 40 50, 0 50 C40 50, 50 40, 50 0 Z"></path>
    </svg>

    <!-- Sparkle Star 2 (Dark) -->
    <svg class="i-shape shape-spin-reverse" data-speed="-25" style="position: absolute; top: 65%; right: 10%; width: 90px; fill: var(--dark); opacity: 0.9;" viewBox="0 0 100 100">
      <path d="M50 0 C50 40, 60 50, 100 50 C60 50, 50 60, 50 100 C50 60, 40 50, 0 50 C40 50, 50 40, 50 0 Z"></path>
    </svg>

    <!-- Dot Grid -->
    <svg class="i-shape shape-float" data-speed="15" style="position: absolute; top: 25%; right: 5%; width: 120px; fill: var(--dark); opacity: 0.4;" viewBox="0 0 100 100">
      <circle cx="10" cy="10" r="5"/><circle cx="35" cy="10" r="5"/><circle cx="60" cy="10" r="5"/><circle cx="85" cy="10" r="5"/>
      <circle cx="10" cy="35" r="5"/><circle cx="35" cy="35" r="5"/><circle cx="60" cy="35" r="5"/><circle cx="85" cy="35" r="5"/>
      <circle cx="10" cy="60" r="5"/><circle cx="35" cy="60" r="5"/><circle cx="60" cy="60" r="5"/><circle cx="85" cy="60" r="5"/>
      <circle cx="10" cy="85" r="5"/><circle cx="35" cy="85" r="5"/><circle cx="60" cy="85" r="5"/><circle cx="85" cy="85" r="5"/>
    </svg>

    <!-- Outlined Arch -->
    <svg class="i-shape shape-float-delay" data-speed="-40" style="position: absolute; bottom: 5%; left: 15%; width: 140px; stroke: var(--primary); stroke-width: 4; fill: none; opacity: 0.9;" viewBox="0 0 100 120">
      <path d="M 10 110 L 10 50 A 40 40 0 0 1 90 50 L 90 110"></path>
    </svg>

    <!-- Wavy Badge (Solid) -->
    <svg class="i-shape shape-spin-slow" data-speed="20" style="position: absolute; top: 40%; left: 2%; width: 100px; fill: var(--primary); opacity: 0.8;" viewBox="0 0 100 100">
      <path d="M50 5 L60 20 L77 15 L80 32 L96 35 L90 50 L96 65 L80 68 L77 85 L60 80 L50 95 L40 80 L23 85 L20 68 L4 65 L10 50 L4 35 L20 32 L23 15 L40 20 Z"></path>
    </svg>

    <!-- Small Circle -->
    <svg class="i-shape" data-speed="-15" style="position: absolute; top: 85%; left: 45%; width: 60px; stroke: var(--dark); stroke-width: 8; fill: none; opacity: 0.6;" viewBox="0 0 100 100">
      <circle cx="50" cy="50" r="40"></circle>
    </svg>

    <!-- Zig Zag -->
    <svg class="i-shape shape-float" data-speed="35" style="position: absolute; top: 15%; left: 50%; width: 100px; stroke: var(--dark); stroke-width: 6; fill: none; stroke-linecap: round; stroke-linejoin: round; opacity: 0.5;" viewBox="0 0 100 50">
      <polyline points="10,40 30,10 50,40 70,10 90,40"></polyline>
    </svg>
  </div>
"@
$html = [System.Text.RegularExpressions.Regex]::Replace($html, $patternHtml, $newShapesHtml)
[System.IO.File]::WriteAllText("f:\Website\index.html", $html, (New-Object System.Text.UTF8Encoding $false))


# 2. Add Mouse Parallax to main.js
$jsAppend = @"

// Interactive Mouse Parallax Engine
document.addEventListener('mousemove', function(e) {
  const shapes = document.querySelectorAll('.i-shape');
  const x = (e.clientX * -1) / 100;
  const y = (e.clientY * -1) / 100;

  shapes.forEach(shape => {
    const speed = shape.getAttribute('data-speed');
    // Using translate for smooth performance. 
    // We append this translate to the element's existing styles/animations if possible.
    // CSS animations overwrite the transform property, so we translate the margin instead for a completely clean separation.
    shape.style.marginLeft = (x * speed) + 'px';
    shape.style.marginTop = (y * speed) + 'px';
  });
});
"@
Add-Content -Path "f:\Website\main.js" -Value $jsAppend -Encoding UTF8

Write-Output "Successfully updated shapes to mouse parallax and z-index 0!"
