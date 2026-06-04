$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

# 1. Update HTML
$oldSlideshow = '(?s)<div class="hero-slideshow">.*?</div>'
$newSlideshow = @"
<div class="hero-slideshow-container" id="swipeContainer" style="position: relative; width: 100%; max-width: 400px; aspect-ratio: 9/16; margin: 0 auto; overflow: hidden; border-radius: var(--radius-lg); box-shadow: 0 15px 30px rgba(0,0,0,0.15); animation: float 6s ease-in-out infinite; cursor: grab;">
        <div class="hero-slides-wrapper" id="swipeWrapper" style="display: flex; flex-direction: column; height: 100%; transition: transform 0.4s cubic-bezier(0.25, 1, 0.5, 1); will-change: transform;">
          <img src="slide1.png" style="width: 100%; height: 100%; object-fit: cover; flex-shrink: 0; pointer-events: none;" alt="Creator Hub Slide 1">
          <img src="slide2.png" style="width: 100%; height: 100%; object-fit: cover; flex-shrink: 0; pointer-events: none;" alt="Creator Hub Slide 2">
          <img src="slide3.png" style="width: 100%; height: 100%; object-fit: cover; flex-shrink: 0; pointer-events: none;" alt="Creator Hub Slide 3">
          <img src="slide4.png" style="width: 100%; height: 100%; object-fit: cover; flex-shrink: 0; pointer-events: none;" alt="Creator Hub Slide 4">
          <img src="slide5.png" style="width: 100%; height: 100%; object-fit: cover; flex-shrink: 0; pointer-events: none;" alt="Creator Hub Slide 5">
          <img src="slide6.png" style="width: 100%; height: 100%; object-fit: cover; flex-shrink: 0; pointer-events: none;" alt="Creator Hub Slide 6">
          <img src="slide7.png" style="width: 100%; height: 100%; object-fit: cover; flex-shrink: 0; pointer-events: none;" alt="Creator Hub Slide 7">
          <img src="slide8.png" style="width: 100%; height: 100%; object-fit: cover; flex-shrink: 0; pointer-events: none;" alt="Creator Hub Slide 8">
        </div>
      </div>
"@
$html = [System.Text.RegularExpressions.Regex]::Replace($html, $oldSlideshow, $newSlideshow)
[System.IO.File]::WriteAllText("f:\Website\index.html", $html, (New-Object System.Text.UTF8Encoding $false))

# 2. Update style.css (Remove old CSS)
$css = [System.IO.File]::ReadAllText("f:\Website\style.css", [System.Text.Encoding]::UTF8)
$patternCss = '(?s)\.hero-slideshow img \{.*?\s*\}' # basic removal logic for old rules
$css = [System.Text.RegularExpressions.Regex]::Replace($css, '(?s)\.hero-slideshow \{.*?\}', '')
$css = [System.Text.RegularExpressions.Regex]::Replace($css, '(?s)\.hero-slideshow img \{.*?\}', '')
$css = [System.Text.RegularExpressions.Regex]::Replace($css, '(?s)\.hero-slideshow img:nth-child\(\d+\) \{.*?\}', '')
$css = [System.Text.RegularExpressions.Regex]::Replace($css, '(?s)@keyframes heroCrossfade \{.*?100% \{ opacity: 0; \}\s*\}', '')
[System.IO.File]::WriteAllText("f:\Website\style.css", $css, (New-Object System.Text.UTF8Encoding $false))

# 3. Add Gesture Engine to main.js
$jsAppend = @"

// Vertical Swipe Carousel Engine (TikTok Style)
document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('swipeContainer');
  const wrapper = document.getElementById('swipeWrapper');
  if(!container || !wrapper) return;

  let currentIndex = 0;
  const totalSlides = 8;
  let startY = 0;
  let currentY = 0;
  let isDragging = false;
  
  function updateSlide() {
    wrapper.style.transform = `translateY(-` + (currentIndex * 100) + `%)`;
  }

  function handleSwipe() {
    const swipeDistance = startY - currentY;
    // Threshold to trigger slide change (e.g., 50px)
    if (swipeDistance > 50 && currentIndex < totalSlides - 1) {
      currentIndex++;
    } else if (swipeDistance < -50 && currentIndex > 0) {
      currentIndex--;
    }
    updateSlide();
  }

  // Touch Events (Mobile)
  container.addEventListener('touchstart', (e) => {
    startY = e.touches[0].clientY;
    isDragging = true;
    wrapper.style.transition = 'none'; // Disable transition while dragging
    pauseAutoPlay();
  });

  container.addEventListener('touchmove', (e) => {
    if (!isDragging) return;
    currentY = e.touches[0].clientY;
    const dragDistance = currentY - startY;
    // Add resistance at the ends
    let rawTranslate = -(currentIndex * container.clientHeight) + dragDistance;
    wrapper.style.transform = `translateY(` + rawTranslate + `px)`;
  });

  container.addEventListener('touchend', (e) => {
    isDragging = false;
    wrapper.style.transition = 'transform 0.4s cubic-bezier(0.25, 1, 0.5, 1)';
    handleSwipe();
    resumeAutoPlay();
  });

  // Mouse Events (Desktop Drag)
  container.addEventListener('mousedown', (e) => {
    startY = e.clientY;
    isDragging = true;
    container.style.cursor = 'grabbing';
    wrapper.style.transition = 'none';
    pauseAutoPlay();
  });

  container.addEventListener('mousemove', (e) => {
    if (!isDragging) return;
    currentY = e.clientY;
    const dragDistance = currentY - startY;
    let rawTranslate = -(currentIndex * container.clientHeight) + dragDistance;
    wrapper.style.transform = `translateY(` + rawTranslate + `px)`;
  });

  container.addEventListener('mouseup', (e) => {
    if (!isDragging) return;
    isDragging = false;
    container.style.cursor = 'grab';
    wrapper.style.transition = 'transform 0.4s cubic-bezier(0.25, 1, 0.5, 1)';
    handleSwipe();
    resumeAutoPlay();
  });

  container.addEventListener('mouseleave', () => {
    if (isDragging) {
      isDragging = false;
      container.style.cursor = 'grab';
      wrapper.style.transition = 'transform 0.4s cubic-bezier(0.25, 1, 0.5, 1)';
      updateSlide();
      resumeAutoPlay();
    }
  });

  // Auto-play feature
  let autoPlayTimer;
  function resumeAutoPlay() {
    clearInterval(autoPlayTimer);
    autoPlayTimer = setInterval(() => {
      currentIndex = (currentIndex + 1) % totalSlides;
      updateSlide();
    }, 4000);
  }
  function pauseAutoPlay() {
    clearInterval(autoPlayTimer);
  }
  
  resumeAutoPlay();
});
"@
Add-Content -Path "f:\Website\main.js" -Value $jsAppend -Encoding UTF8

Write-Output "Successfully built interactive vertical swipe carousel!"
