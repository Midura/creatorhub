$htmlAppend = @"
  <!-- Booking Modal -->
  <div id="bookingModalOverlay" class="modal-overlay" onclick="closeBookingModal()"></div>
  <div id="bookingModal" class="booking-modal card card-dark">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
      <h3 style="font-size: 1.8rem; color: var(--primary);">Book Creator</h3>
      <button onclick="closeBookingModal()" style="background: none; border: none; color: var(--white); cursor: pointer; font-size: 1.5rem;">&times;</button>
    </div>
    <form onsubmit="event.preventDefault(); alert('Booking Request Sent Successfully!'); closeBookingModal();">
      <div style="margin-bottom: 20px;">
        <label style="display: block; margin-bottom: 8px; opacity: 0.8;">Campaign Name</label>
        <input type="text" required placeholder="e.g. Summer Launch Video" style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.2); background: rgba(0,0,0,0.2); color: white;">
      </div>
      <div style="margin-bottom: 20px;">
        <label style="display: block; margin-bottom: 8px; opacity: 0.8;">Campaign Budget: <span id="budgetValue" style="color: var(--primary); font-weight: bold;">LKR 50,000</span></label>
        <input type="range" id="budgetSlider" min="10000" max="500000" step="5000" value="50000" style="width: 100%; accent-color: var(--primary);" oninput="document.getElementById('budgetValue').innerText = 'LKR ' + Number(this.value).toLocaleString()">
      </div>
      <div style="margin-bottom: 30px;">
        <label style="display: block; margin-bottom: 8px; opacity: 0.8;">Campaign Details</label>
        <textarea required rows="4" placeholder="Describe what you want the creator to do..." style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.2); background: rgba(0,0,0,0.2); color: white; resize: vertical;"></textarea>
      </div>
      <button type="submit" class="btn btn-primary" style="width: 100%; padding: 15px;">Send Booking Request</button>
    </form>
  </div>
"@

$html = [System.IO.File]::ReadAllText("f:\Website\creator-profile.html", [System.Text.Encoding]::UTF8)
$html = $html -replace '</body>', "$htmlAppend`n</body>"
[System.IO.File]::WriteAllText("f:\Website\creator-profile.html", $html, (New-Object System.Text.UTF8Encoding $false))


$cssAppend = @"

/* Modal Styles */
.modal-overlay {
  position: fixed;
  top: 0; left: 0; right: 0; bottom: 0;
  background: rgba(0,0,0,0.6);
  backdrop-filter: blur(10px);
  z-index: 1000;
  display: none;
  opacity: 0;
  transition: opacity 0.3s ease;
}
.booking-modal {
  position: fixed;
  top: 50%; left: 50%;
  transform: translate(-50%, -40%);
  width: 90%;
  max-width: 500px;
  z-index: 1001;
  display: none;
  opacity: 0;
  transition: all 0.3s ease;
  box-shadow: 0 25px 50px -12px rgba(0,0,0,0.5);
}
.modal-overlay.active { display: block; opacity: 1; }
.booking-modal.active { display: block; opacity: 1; transform: translate(-50%, -50%); }
"@
Add-Content -Path "f:\Website\style.css" -Value $cssAppend -Encoding UTF8


$jsAppend = @"

// Booking Modal Logic
function openBookingModal() {
  const overlay = document.getElementById('bookingModalOverlay');
  const modal = document.getElementById('bookingModal');
  if (overlay && modal) {
    overlay.classList.add('active');
    modal.classList.add('active');
    document.body.style.overflow = 'hidden'; // Prevent scrolling
  }
}

function closeBookingModal() {
  const overlay = document.getElementById('bookingModalOverlay');
  const modal = document.getElementById('bookingModal');
  if (overlay && modal) {
    overlay.classList.remove('active');
    modal.classList.remove('active');
    document.body.style.overflow = 'auto';
  }
}
"@
Add-Content -Path "f:\Website\main.js" -Value $jsAppend -Encoding UTF8

Write-Output "Successfully injected booking modal HTML, CSS, and JS!"
