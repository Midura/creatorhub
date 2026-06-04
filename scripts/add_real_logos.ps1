$css = @"

/* Real Brand Logos Styling */
.marquee-logo {
  height: 60px;
  width: auto;
  object-fit: contain;
  opacity: 0.7;
  transition: opacity 0.3s, transform 0.3s;
}
.marquee-logo:hover {
  opacity: 1;
  transform: scale(1.05);
}

/* Light Theme (Default) */
body:not(.dark-theme) .logo-white-bg {
  mix-blend-mode: multiply;
}
body:not(.dark-theme) .logo-black-bg {
  filter: invert(1);
  mix-blend-mode: multiply;
}

/* Dark Theme */
body.dark-theme .logo-white-bg {
  filter: grayscale(1) invert(1) brightness(2);
  mix-blend-mode: screen;
}
body.dark-theme .logo-black-bg {
  mix-blend-mode: screen;
}

.logo-solid {
  border-radius: 12px;
}
"@
Add-Content -Path "f:\Website\style.css" -Value $css

$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

$newTrack = @"
    <div class="marquee-track">
      <!-- Original Set -->
      <img src="logos/munchee.png" class="marquee-logo logo-solid" alt="Munchee">
      <img src="logos/creperunner.png" class="marquee-logo logo-white-bg" alt="Crepe Runner">
      <img src="logos/barista.png" class="marquee-logo logo-white-bg" alt="Barista">
      <img src="logos/carnage.jpg" class="marquee-logo logo-black-bg" alt="Carnage">
      <img src="logos/munchee.png" class="marquee-logo logo-solid" alt="Munchee">
      <img src="logos/creperunner.png" class="marquee-logo logo-white-bg" alt="Crepe Runner">
      <img src="logos/barista.png" class="marquee-logo logo-white-bg" alt="Barista">
      <img src="logos/carnage.jpg" class="marquee-logo logo-black-bg" alt="Carnage">
      
      <!-- Duplicate Set for Seamless Loop -->
      <img src="logos/munchee.png" class="marquee-logo logo-solid" alt="Munchee">
      <img src="logos/creperunner.png" class="marquee-logo logo-white-bg" alt="Crepe Runner">
      <img src="logos/barista.png" class="marquee-logo logo-white-bg" alt="Barista">
      <img src="logos/carnage.jpg" class="marquee-logo logo-black-bg" alt="Carnage">
      <img src="logos/munchee.png" class="marquee-logo logo-solid" alt="Munchee">
      <img src="logos/creperunner.png" class="marquee-logo logo-white-bg" alt="Crepe Runner">
      <img src="logos/barista.png" class="marquee-logo logo-white-bg" alt="Barista">
      <img src="logos/carnage.jpg" class="marquee-logo logo-black-bg" alt="Carnage">
    </div>
"@

$html = [regex]::Replace($html, '(?s)<div class="marquee-track">.*?</div>', $newTrack)
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText("f:\Website\index.html", $html, $utf8NoBom)
Write-Output "Injected real logos and CSS blend modes successfully!"
