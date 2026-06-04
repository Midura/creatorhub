$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

# 1. Revert HTML back to simple slideshow
$oldSlideshow = '(?s)<div class="hero-slideshow-container".*?</div>\s*</div>'
$newSlideshow = @"
<div class="hero-slideshow" style="position: relative; width: 100%; max-width: 400px; aspect-ratio: 9/16; margin: 0 auto; overflow: hidden; border-radius: var(--radius-lg); box-shadow: 0 15px 30px rgba(0,0,0,0.15); animation: float 6s ease-in-out infinite;">
        <img src="slide1.png" alt="Creator Hub Slide 1">
        <img src="slide2.png" alt="Creator Hub Slide 2">
        <img src="slide3.png" alt="Creator Hub Slide 3">
        <img src="slide4.png" alt="Creator Hub Slide 4">
        <img src="slide5.png" alt="Creator Hub Slide 5">
        <img src="slide6.png" alt="Creator Hub Slide 6">
        <img src="slide7.png" alt="Creator Hub Slide 7">
        <img src="slide8.png" alt="Creator Hub Slide 8">
      </div>
"@
$html = [System.Text.RegularExpressions.Regex]::Replace($html, $oldSlideshow, $newSlideshow)
[System.IO.File]::WriteAllText("f:\Website\index.html", $html, (New-Object System.Text.UTF8Encoding $false))


# 2. Revert JS (Remove Swipe Engine)
$js = [System.IO.File]::ReadAllText("f:\Website\main.js", [System.Text.Encoding]::UTF8)
$patternJs = '(?s)// Vertical Swipe Carousel Engine.*'
$js = [System.Text.RegularExpressions.Regex]::Replace($js, $patternJs, "")
[System.IO.File]::WriteAllText("f:\Website\main.js", $js, (New-Object System.Text.UTF8Encoding $false))


# 3. Add Scrambled Slideshow CSS
$cssAppend = @"

/* Hero Slideshow Mixed Crossfade */
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

/* Mixed Order Delays */
.hero-slideshow img:nth-child(1) { animation-delay: 0s; }
.hero-slideshow img:nth-child(6) { animation-delay: 4s; }
.hero-slideshow img:nth-child(3) { animation-delay: 8s; }
.hero-slideshow img:nth-child(8) { animation-delay: 12s; }
.hero-slideshow img:nth-child(2) { animation-delay: 16s; }
.hero-slideshow img:nth-child(5) { animation-delay: 20s; }
.hero-slideshow img:nth-child(4) { animation-delay: 24s; }
.hero-slideshow img:nth-child(7) { animation-delay: 28s; }

@keyframes heroCrossfade {
  0% { opacity: 0; }
  4% { opacity: 1; }
  12.5% { opacity: 1; }
  16.5% { opacity: 0; }
  100% { opacity: 0; }
}
"@
Add-Content -Path "f:\Website\style.css" -Value $cssAppend -Encoding UTF8

Write-Output "Successfully restored crossfade slideshow with scrambled order!"
