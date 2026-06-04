$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

# Replace the Hero Section opening tag
$html = $html.Replace("  <!-- Hero Section -->", "  <!-- Hero Section -->`n  <main class=`"hero-wrapper`">`n    <div class=`"blob blob-1`"></div>`n    <div class=`"blob blob-2`"></div>")

# Replace the h1 tag with the gradient version
$html = $html.Replace("<h1>Connect with Sri Lanka's Top Creators</h1>", "<h1 class=`"text-gradient`">Connect with Sri Lanka's Top Creators</h1>")

# We want to close the <main> wrapper after the Search Bar. 
# Search bar ends at:
#     </div>
#   </section>
# 
#   <!-- Featured Creators -->
# We will inject the Stats Counter right after the Search Bar, then close </main>

$searchBlock = @"
      <a href="directory.html" class="btn btn-primary" style="flex: 1;">Find Creators</a>
    </div>
  </section>

  <!-- Featured Creators -->
"@

$replaceBlock = @"
      <a href="directory.html" class="btn btn-primary" style="flex: 1;">Find Creators</a>
    </div>
  </section>

  <!-- Animated Stats Counter -->
  <section class="container mb-8 animate-on-scroll" style="position: relative; z-index: 2; margin-top: -20px; padding-bottom: 60px;">
    <div class="glass-panel" style="display: grid; grid-template-columns: repeat(3, 1fr); text-align: center; padding: 40px;">
      <div>
        <div class="counter-number" data-target="1250">0</div>
        <div class="counter-label">Verified Creators</div>
      </div>
      <div style="border-left: 1px solid rgba(0,0,0,0.1); border-right: 1px solid rgba(0,0,0,0.1);">
        <div class="counter-number" data-target="500">0</div>
        <div class="counter-label">Successful Campaigns</div>
      </div>
      <div>
        <div class="counter-number" data-target="50" data-suffix="M+">0</div>
        <div class="counter-label">Combined Audience</div>
      </div>
    </div>
  </section>
  </main>

  <!-- Featured Creators -->
"@

$html = $html.Replace($searchBlock, $replaceBlock)

# Make the Search Bar a glass-panel
$oldSearchBarStart = @"
  <!-- Search Bar -->
  <section class="container mb-8 animate-on-scroll">
    <div style="background-color: var(--dark); border-radius: var(--radius-lg); padding: 40px; display: flex; gap: 20px;">
"@

$newSearchBarStart = @"
  <!-- Search Bar -->
  <section class="container mb-8 animate-on-scroll">
    <div class="glass-panel" style="padding: 40px; display: flex; gap: 20px;">
"@

$html = $html.Replace($oldSearchBarStart, $newSearchBarStart)

[System.IO.File]::WriteAllText("f:\Website\index.html", $html, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Applied Glassmorphism, Gradients, and Stats HTML to index.html"
