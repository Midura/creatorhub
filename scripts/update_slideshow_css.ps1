$css = [System.IO.File]::ReadAllText("f:\Website\style.css", [System.Text.Encoding]::UTF8)

# Replace the heroCrossfade block
$pattern = '(?s)\.hero-slideshow img \{.*?@keyframes heroCrossfade \{.*?100% \{ opacity: 0; \}\s*\}'

$newCss = @"
.hero-slideshow img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0;
  animation: heroCrossfade 32s infinite;
}

.hero-slideshow img:nth-child(1) { animation-delay: 0s; }
.hero-slideshow img:nth-child(2) { animation-delay: 4s; }
.hero-slideshow img:nth-child(3) { animation-delay: 8s; }
.hero-slideshow img:nth-child(4) { animation-delay: 12s; }
.hero-slideshow img:nth-child(5) { animation-delay: 16s; }
.hero-slideshow img:nth-child(6) { animation-delay: 20s; }
.hero-slideshow img:nth-child(7) { animation-delay: 24s; }
.hero-slideshow img:nth-child(8) { animation-delay: 28s; }

@keyframes heroCrossfade {
  0% { opacity: 0; }
  4% { opacity: 1; }
  12.5% { opacity: 1; }
  16.5% { opacity: 0; }
  100% { opacity: 0; }
}
"@

$css = [System.Text.RegularExpressions.Regex]::Replace($css, $pattern, $newCss)
[System.IO.File]::WriteAllText("f:\Website\style.css", $css, (New-Object System.Text.UTF8Encoding $false))

Write-Output "Successfully updated slideshow CSS for 8 images!"
