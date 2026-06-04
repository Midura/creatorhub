# Copy the new images
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780233783038.png" -Destination "f:\Website\logos\dialog.png" -Force
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780233783055.png" -Destination "f:\Website\logos\mas.png" -Force

# Update CSS for precise alignment and sizing
$cssContent = [System.IO.File]::ReadAllText("f:\Website\style.css", [System.Text.Encoding]::UTF8)
$cssContent = $cssContent -replace '(?s)\.marquee-logo \{.*?\opacity: 0\.7;', ".marquee-logo {`n  height: 60px;`n  width: 140px; /* Fixed width for uniform sizing */`n  object-fit: contain;`n  display: block;`n  opacity: 0.7;"
[System.IO.File]::WriteAllText("f:\Website\style.css", $cssContent, (New-Object System.Text.UTF8Encoding $false))

# Update index.html
$htmlContent = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

$newTrack = @"
    <div class="marquee-track" style="align-items: center;">
      <!-- Original Set -->
      <img src="logos/munchee.png" class="marquee-logo logo-solid" alt="Munchee">
      <img src="logos/creperunner.png" class="marquee-logo logo-white-bg" alt="Crepe Runner">
      <img src="logos/barista.png" class="marquee-logo logo-white-bg" alt="Barista">
      <img src="logos/carnage.jpg" class="marquee-logo logo-black-bg" alt="Carnage">
      <img src="logos/dialog.png" class="marquee-logo logo-white-bg" alt="Dialog">
      <img src="logos/mas.png" class="marquee-logo logo-white-bg" alt="MAS">
      
      <!-- Duplicate Set for Seamless Loop -->
      <img src="logos/munchee.png" class="marquee-logo logo-solid" alt="Munchee">
      <img src="logos/creperunner.png" class="marquee-logo logo-white-bg" alt="Crepe Runner">
      <img src="logos/barista.png" class="marquee-logo logo-white-bg" alt="Barista">
      <img src="logos/carnage.jpg" class="marquee-logo logo-black-bg" alt="Carnage">
      <img src="logos/dialog.png" class="marquee-logo logo-white-bg" alt="Dialog">
      <img src="logos/mas.png" class="marquee-logo logo-white-bg" alt="MAS">

      <!-- Third Set -->
      <img src="logos/munchee.png" class="marquee-logo logo-solid" alt="Munchee">
      <img src="logos/creperunner.png" class="marquee-logo logo-white-bg" alt="Crepe Runner">
      <img src="logos/barista.png" class="marquee-logo logo-white-bg" alt="Barista">
      <img src="logos/carnage.jpg" class="marquee-logo logo-black-bg" alt="Carnage">
      <img src="logos/dialog.png" class="marquee-logo logo-white-bg" alt="Dialog">
      <img src="logos/mas.png" class="marquee-logo logo-white-bg" alt="MAS">
    </div>
"@

$htmlContent = [regex]::Replace($htmlContent, '(?s)<div class="marquee-track">.*?</div>', $newTrack)
[System.IO.File]::WriteAllText("f:\Website\index.html", $htmlContent, (New-Object System.Text.UTF8Encoding $false))

Write-Output "Logos added, CSS updated, and HTML refreshed!"
