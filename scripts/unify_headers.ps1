$files = Get-ChildItem -Path "f:\Website" -Filter *.html
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

$newHeader = @"
  <header class="navbar">
    <div class="container flex justify-between items-center">
      <a href="index.html" style="display: flex; align-items: center; gap: 10px; font-size: 1.8rem; font-weight: 700; color: var(--dark); text-decoration: none;">
        <svg width="40" height="40" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M15 0L18.4239 11.5761L30 15L18.4239 18.4239L15 30L11.5761 18.4239L0 15L11.5761 11.5761L15 0Z" fill="var(--primary)"/>
        </svg>
        Creator Hub
      </a>
      <ul class="nav-links">
        <li><a href="directory.html">Creators</a></li>
        <li><a href="pricing.html">Pricing</a></li>
        <li><a href="about.html">About</a></li>
        <li><a href="contact.html">Contact Us</a></li>
      </ul>
      <div style="display: flex; gap: 15px; align-items: center;">
        <button id="themeToggle" class="theme-btn" style="background: none; border: 1px solid var(--dark); border-radius: 50%; width: 40px; height: 40px; cursor: pointer; display: flex; align-items: center; justify-content: center; color: var(--dark); transition: all 0.3s;" title="Toggle Dark/Light Mode">
          <svg class="moon-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path></svg>
          <svg class="sun-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="5"></circle><line x1="12" y1="1" x2="12" y2="3"></line><line x1="12" y1="21" x2="12" y2="23"></line><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line><line x1="1" y1="12" x2="3" y2="12"></line><line x1="21" y1="12" x2="23" y2="12"></line><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line></svg>
        </button>
        <a href="dashboard-brand.html" class="btn btn-outline">For Brands</a>
        <a href="dashboard-creator.html" class="btn btn-dark">For Creators</a>
      </div>
    </div>
  </header>
"@

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    $content = [regex]::Replace($content, '(?s)  <header class="navbar">.*?</header>', $newHeader)
    
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
}
Write-Output "Cleaned and unified all headers with SVGs!"
