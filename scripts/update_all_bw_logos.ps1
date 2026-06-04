# Copy new images
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780235488777.png" -Destination "f:\Website\logos\bw_logo_1.png" -Force
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780235491944.png" -Destination "f:\Website\logos\bw_logo_5.png" -Force
Copy-Item "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787\media__1780235495258.png" -Destination "f:\Website\logos\bw_logo_6.png" -Force

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
      <img src="logos/bw_logo_6.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      
      <!-- Duplicate Set for Seamless Loop -->
      <img src="logos/bw_logo_1.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_2.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_3.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_4.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_5.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_6.png" class="marquee-logo logo-white-bg" alt="Brand Logo">

      <!-- Third Set -->
      <img src="logos/bw_logo_1.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_2.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_3.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_4.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_5.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_6.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      
      <!-- Fourth Set -->
      <img src="logos/bw_logo_1.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_2.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_3.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_4.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_5.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
      <img src="logos/bw_logo_6.png" class="marquee-logo logo-white-bg" alt="Brand Logo">
    </div>
"@

$htmlContent = [regex]::Replace($htmlContent, '(?s)<div class="marquee-track" style="align-items: center;">.*?</div>', $newTrack)

[System.IO.File]::WriteAllText("f:\Website\index.html", $htmlContent, (New-Object System.Text.UTF8Encoding $false))

Write-Output "Perfect 6-logo marquee created successfully!"
