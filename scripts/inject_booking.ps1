$html = [System.IO.File]::ReadAllText("f:\Website\profile.html", [System.Text.Encoding]::UTF8)

# 1. Inject Modal HTML before </main>
$modalHtml = @"

  <!-- Booking Modal -->
  <div id="bookingModal" style="display: none; position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; background: rgba(0,0,0,0.5); z-index: 1000; justify-content: center; align-items: center; backdrop-filter: blur(5px);">
    <div class="glass-panel" style="width: 100%; max-width: 500px; padding: 40px; position: relative;">
      <button onclick="document.getElementById('bookingModal').style.display='none'" style="position: absolute; top: 20px; right: 20px; background: none; border: none; font-size: 1.5rem; cursor: pointer; color: var(--dark);">&times;</button>
      <h3 style="margin-bottom: 20px;">Book <span id="modalCreatorName">this Creator</span></h3>
      <form id="bookingForm">
        <div class="input-group">
          <label class="input-label">Campaign Name</label>
          <input type="text" class="input-field" required placeholder="e.g. Summer Launch">
        </div>
        <div class="input-group">
          <label class="input-label">Proposed Budget (LKR)</label>
          <input type="number" class="input-field" required placeholder="e.g. 50000">
        </div>
        <div class="input-group">
          <label class="input-label">Campaign Dates</label>
          <input type="date" class="input-field" required>
        </div>
        <div class="input-group">
          <label class="input-label">Message</label>
          <textarea class="input-field" rows="3" required placeholder="Briefly describe your campaign..."></textarea>
        </div>
        <button type="submit" class="btn btn-primary w-full" id="submitBookingBtn">Send Booking Request</button>
      </form>
    </div>
  </div>
</main>
"@

$html = $html.Replace("</main>", $modalHtml)

# 2. Inject JS Logic into the DOMContentLoaded block
$jsTarget = @"
      document.getElementById('headerEmail').innerHTML = "&#9993;&#65039; contact@" + name.replace(/\s+/g, '').toLowerCase() + ".lk";
"@

$jsReplace = @"
      document.getElementById('headerEmail').innerHTML = "&#9993;&#65039; contact@" + name.replace(/\s+/g, '').toLowerCase() + ".lk";

      // Booking Modal Logic
      const bName = document.getElementById('modalCreatorName');
      if(bName) bName.textContent = name;

      const bForm = document.getElementById('bookingForm');
      if(bForm) {
        bForm.addEventListener('submit', function(e) {
          e.preventDefault();
          const btn = document.getElementById('submitBookingBtn');
          const originalText = btn.textContent;
          btn.textContent = "Sending...";
          btn.style.opacity = "0.7";
          
          setTimeout(() => {
            alert("Booking request sent successfully to " + name + "!\n\nThey will review it and get back to you shortly.");
            document.getElementById('bookingModal').style.display = 'none';
            btn.textContent = originalText;
            btn.style.opacity = "1";
            bForm.reset();
          }, 1500);
        });
      }
"@

$html = $html.Replace($jsTarget, $jsReplace)

[System.IO.File]::WriteAllText("f:\Website\profile.html", $html, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Successfully injected Booking Modal HTML and JavaScript into profile.html!"
