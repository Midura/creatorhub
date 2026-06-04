$html = [System.IO.File]::ReadAllText("f:\Website\profile.html", [System.Text.Encoding]::UTF8)

$missingPart = @"
        <li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">&#9993;&#65039; hello@creatorhub.lk</li>
      </ul>
    </div>
    
    <div class="flex gap-8" style="padding: 0 40px;">
      <div style="width: 250px;">
        <img src="images/creator_hasini.jpg" alt="Hasini Beauty" style="width: 150px; height: 150px; border-radius: 50%; border: 4px solid var(--white); z-index: 10; position: relative; object-fit: cover; object-position: center;">
        <h2 style="margin-top: 20px; font-size: 1.5rem; background-color: transparent;">Hasini Beauty</h2>
        <p style="color: #666; margin-bottom: 10px;">Beauty & Makeup Creator from Colombo</p>
        
        <!-- Social Icons -->
        <div style="display: flex; gap: 15px; margin-bottom: 20px;">
          <a href="#" style="color: var(--dark); display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; border-radius: 50%; background-color: var(--light); transition: 0.3s;" onmouseover="this.style.backgroundColor='var(--primary)'" onmouseout="this.style.backgroundColor='var(--light)'">
            <!-- Instagram SVG -->
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
          </a>
"@

$html = $html -replace '(?s)<li style="color: var\(--white\); opacity: 0\.8; font-size: 0\.875rem;">Ã°Å¸â€œÂ  Colombo Trade City, Colombo 03</li>.*?</a>', '<li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">&#128205; Colombo Trade City, Colombo 03</li>' + "`n" + $missingPart

[System.IO.File]::WriteAllText("f:\Website\profile.html", $html, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Restored profile.html structure!"
