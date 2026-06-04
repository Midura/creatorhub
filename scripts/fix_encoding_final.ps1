# Fix directory.html arrows
$html = [System.IO.File]::ReadAllText("f:\Website\directory.html", [System.Text.Encoding]::UTF8)
$html = [regex]::Replace($html, 'font-weight: bold;">[^<]*</a>', 'font-weight: bold;">&#8594;</a>')
[System.IO.File]::WriteAllText("f:\Website\directory.html", $html, (New-Object System.Text.UTF8Encoding $false))

# Fix dashboard-brand.html emojis
$html = [System.IO.File]::ReadAllText("f:\Website\dashboard-brand.html", [System.Text.Encoding]::UTF8)
$html = [regex]::Replace($html, '<li style="color: var\(--white\); opacity: 0\.8; font-size: 0\.875rem;">[^<]*Colombo', '<li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">&#128205; Colombo')
$html = [regex]::Replace($html, '<li style="color: var\(--white\); opacity: 0\.8; font-size: 0\.875rem;">[^<]*hello@creatorhub', '<li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">&#9993;&#65039; hello@creatorhub')
[System.IO.File]::WriteAllText("f:\Website\dashboard-brand.html", $html, (New-Object System.Text.UTF8Encoding $false))

# Fix index.html popup emoji
$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)
$html = [regex]::Replace($html, '<h2 style="margin-bottom: 10px;">Welcome to Creator Hub! [^<]*</h2>', '<h2 style="margin-bottom: 10px;">Welcome to Creator Hub! &#127881;</h2>')
[System.IO.File]::WriteAllText("f:\Website\index.html", $html, (New-Object System.Text.UTF8Encoding $false))

# Fix profile.html header emojis just in case
$html = [System.IO.File]::ReadAllText("f:\Website\profile.html", [System.Text.Encoding]::UTF8)
$html = [regex]::Replace($html, '<li id="headerLocation"[^>]*>[^<]*</li>', '<li id="headerLocation" style="color: var(--white); font-weight: 600; font-size: 0.875rem; text-shadow: 1px 1px 3px rgba(0,0,0,0.8);">&#128205; Colombo, LK</li>')
$html = [regex]::Replace($html, '<li id="headerEmail"[^>]*>[^<]*</li>', '<li id="headerEmail" style="color: var(--white); font-weight: 600; font-size: 0.875rem; text-shadow: 1px 1px 3px rgba(0,0,0,0.8);">&#9993;&#65039; contact@creatorhub.lk</li>')
[System.IO.File]::WriteAllText("f:\Website\profile.html", $html, (New-Object System.Text.UTF8Encoding $false))

Write-Output "Successfully cleaned up all Mojibake/corrupted characters!"
