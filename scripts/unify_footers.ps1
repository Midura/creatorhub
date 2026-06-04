$files = Get-ChildItem -Path "f:\Website" -Filter *.html
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

$newFooter = @"
  <footer class="footer container">
    <div class="footer-grid mb-8" style="border-bottom: 1px solid rgba(255,255,255,0.2); padding-bottom: 40px;">
      <div style="display: flex; flex-direction: column; align-items: flex-start; padding-left: 40px;">
        <img src="https://api.qrserver.com/v1/create-qr-code/?size=160x160&data=https://creatorhub.lk&color=191A23&bgcolor=FFFFFF&qzone=1" alt="Creator Hub QR Code" style="border-radius: 8px; border: 4px solid var(--white);">
        <div style="display: flex; gap: 15px; margin-top: 20px; width: 160px; justify-content: space-between;">
          <!-- Facebook -->
          <a href="#" style="color: var(--white); transition: color 0.3s;" onmouseover="this.style.color='var(--primary)'" onmouseout="this.style.color='var(--white)'">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
          </a>
          <!-- Instagram -->
          <a href="#" style="color: var(--white); transition: color 0.3s;" onmouseover="this.style.color='var(--primary)'" onmouseout="this.style.color='var(--white)'">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
          </a>
          <!-- Twitter/X -->
          <a href="#" style="color: var(--white); transition: color 0.3s;" onmouseover="this.style.color='var(--primary)'" onmouseout="this.style.color='var(--white)'">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>
          </a>
          <!-- LinkedIn -->
          <a href="#" style="color: var(--white); transition: color 0.3s;" onmouseover="this.style.color='var(--primary)'" onmouseout="this.style.color='var(--white)'">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path><rect x="2" y="9" width="4" height="12"></rect><circle cx="4" cy="4" r="2"></circle></svg>
          </a>
        </div>
      </div>
      <div style="display: flex; flex-direction: column; align-items: flex-start; justify-content: center;">
        <a href="index.html" style="display: flex; align-items: center; gap: 10px; font-size: 1.8rem; font-weight: 700; color: var(--white); text-decoration: none;">
          <svg width="40" height="40" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M15 0L18.4239 11.5761L30 15L18.4239 18.4239L15 30L11.5761 18.4239L0 15L11.5761 11.5761L15 0Z" fill="var(--primary)"/>
          </svg>
          Creator Hub
        </a>
        <p style="color: var(--white); opacity: 0.7; margin-top: 15px; font-size: 0.9rem;">Empowering Sri Lanka's<br>Creator Economy</p>
      </div>
      <div>
        <h4 style="margin-bottom: 20px; color: var(--primary);">Quick Links</h4>
        <ul style="list-style: none; padding: 0; display: flex; flex-direction: column; gap: 10px;">
          <li><a href="directory.html" style="color: var(--white); text-decoration: none; opacity: 0.8;">Directory</a></li>
          <li><a href="pricing.html" style="color: var(--white); text-decoration: none; opacity: 0.8;">Pricing</a></li>
          <li><a href="about.html" style="color: var(--white); text-decoration: none; opacity: 0.8;">About Us</a></li>
        </ul>
      </div>
      <div>
        <h4 style="margin-bottom: 20px; color: var(--primary);">Contact Us</h4>
        <ul style="list-style: none; padding: 0; display: flex; flex-direction: column; gap: 10px;">
          <li style="color: var(--white); opacity: 0.8; font-size: 0.875rem; display: flex; align-items: center; gap: 8px;">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
            Colombo Trade City, Colombo 03
          </li>
          <li style="color: var(--white); opacity: 0.8; font-size: 0.875rem; display: flex; align-items: center; gap: 8px;">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
            hello@creatorhub.lk
          </li>
          <li><a href="privacy.html" style="color: var(--white); text-decoration: underline; opacity: 0.8; font-size: 0.875rem;">Privacy Policy</a></li>
          <li><a href="terms.html" style="color: var(--white); text-decoration: underline; opacity: 0.8; font-size: 0.875rem;">Terms & Conditions</a></li>
        </ul>
      </div>
    </div>
    <div style="display: flex; justify-content: center; text-align: center;">
      <p style="opacity: 0.6; font-size: 0.875rem;">&copy; 2026 Creator Hub Sri Lanka. All Rights Reserved.</p>
    </div>
  </footer>
"@

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $content = [regex]::Replace($content, '(?s)<footer class="footer container">.*?</footer>', $newFooter)
    $content = [regex]::Replace($content, '(?s)<footer class="footer">.*?</footer>', $newFooter)
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
}
Write-Output "Cleaned and unified all footers with updated QR Code and Social Media Icons!"
