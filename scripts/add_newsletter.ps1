$htmlAppend = @"
  <!-- Newsletter Popup -->
  <div id="newsletterPopup" class="newsletter-popup card card-primary">
    <button onclick="closeNewsletter()" class="close-newsletter">&times;</button>
    <div style="display: flex; gap: 15px; align-items: flex-start;">
      <div style="background: var(--dark); padding: 12px; border-radius: 50%; color: var(--primary);">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
      </div>
      <div>
        <h4 style="font-size: 1.2rem; margin-bottom: 5px; color: var(--dark);">Stay in the Loop!</h4>
        <p style="font-size: 0.9rem; color: var(--dark); opacity: 0.9; margin-bottom: 15px;">Get the latest creator trends and top sponsorships delivered weekly.</p>
        <form onsubmit="event.preventDefault(); alert('Subscribed successfully!'); closeNewsletter();" style="display: flex; gap: 10px;">
          <input type="email" placeholder="Enter your email" required style="width: 100%; padding: 10px; border-radius: 6px; border: 1px solid rgba(0,0,0,0.2); background: rgba(255,255,255,0.5); color: var(--dark); outline: none;">
          <button type="submit" class="btn btn-dark" style="padding: 10px 15px; font-size: 0.9rem;">Join</button>
        </form>
      </div>
    </div>
  </div>
"@

$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)
$html = $html -replace '</body>', "$htmlAppend`n</body>"
[System.IO.File]::WriteAllText("f:\Website\index.html", $html, (New-Object System.Text.UTF8Encoding $false))

$cssAppend = @"

/* Newsletter Popup Animation */
.newsletter-popup {
  position: fixed;
  bottom: -200px; /* Start hidden below */
  right: 30px;
  width: 90%;
  max-width: 400px;
  z-index: 1000;
  opacity: 0;
  box-shadow: 0 20px 40px rgba(185, 255, 102, 0.4);
  transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55); /* Bouncy spring effect */
}

.newsletter-popup.show {
  bottom: 30px;
  opacity: 1;
}

.close-newsletter {
  position: absolute;
  top: 10px;
  right: 15px;
  background: none;
  border: none;
  color: var(--dark);
  font-size: 1.5rem;
  cursor: pointer;
  opacity: 0.5;
  transition: opacity 0.3s;
}

.close-newsletter:hover {
  opacity: 1;
}

@media (max-width: 768px) {
  .newsletter-popup {
    right: 5%;
    left: 5%;
    width: 90%;
  }
}
"@
Add-Content -Path "f:\Website\style.css" -Value $cssAppend -Encoding UTF8

$jsAppend = @"

// Newsletter Popup Logic
document.addEventListener('DOMContentLoaded', () => {
  const newsletter = document.getElementById('newsletterPopup');
  if (newsletter) {
    // Check if user already dismissed it
    const hasSeenNewsletter = localStorage.getItem('seenNewsletter');
    
    if (!hasSeenNewsletter) {
      // Show it creatively after 4 seconds
      setTimeout(() => {
        newsletter.classList.add('show');
      }, 4000);
    }
  }
});

function closeNewsletter() {
  const newsletter = document.getElementById('newsletterPopup');
  if (newsletter) {
    newsletter.classList.remove('show');
    // Save to localStorage so it doesn't annoy them again
    localStorage.setItem('seenNewsletter', 'true');
  }
}
"@
Add-Content -Path "f:\Website\main.js" -Value $jsAppend -Encoding UTF8

Write-Output "Successfully injected Creative Newsletter Popup!"
