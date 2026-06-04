# Copy the new images
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780234955916.png" -Destination "f:\Website\logos\bw_logo_1.png" -Force
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780234955922.png" -Destination "f:\Website\logos\bw_logo_2.png" -Force
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780234955930.png" -Destination "f:\Website\logos\bw_logo_3.png" -Force
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780234955935.png" -Destination "f:\Website\logos\bw_logo_4.png" -Force
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780234955940.png" -Destination "f:\Website\logos\bw_logo_5.png" -Force

# Update index.html
$htmlContent = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

$newTrack = @"
    <div class="marquee-track" style="align-items: center;">
      <!-- Original Set -->
      <img src="logos/bw_logo_1.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_2.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_3.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_4.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_5.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      
      <!-- Duplicate Set for Seamless Loop -->
      <img src="logos/bw_logo_1.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_2.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_3.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_4.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_5.png" class="marquee-logo logo-white-bg" alt="Brand Logo">

      <!-- Third Set -->
      <img src="logos/bw_logo_1.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_2.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_3.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_4.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_5.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      
      <!-- Fourth Set -->
      <img src="logos/bw_logo_1.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_2.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_3.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_4.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_5.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
    </div>
"@

$htmlContent = [regex]::Replace($htmlContent, '(?s)<div class="marquee-track" style="align-items: center;">.*?</div>', $newTrack)

# In case the regex above misses because of whitespace, try without the style attr
if ($htmlContent -notmatch '<img src="logos/bw_logo_1.png"') {
    $htmlContent = [regex]::Replace($htmlContent, '(?s)<div class="marquee-track">.*?</div>', $newTrack)
}

[System.IO.File]::WriteAllText("f:\Website\index.html", $htmlContent, (New-Object System.Text.UTF8Encoding $false))

Write-Output "Monochrome logos updated successfully!"
