$files = Get-ChildItem -Path . -Filter *.html

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)

    # 1. Update the grid class
    $content = $content -replace '<div class="grid grid-cols-3 gap-8 mb-8" style="border-bottom: 1px solid rgba\(255,255,255,0\.2\); padding-bottom: 30px;">', '<div class="footer-grid mb-8" style="border-bottom: 1px solid rgba(255,255,255,0.2); padding-bottom: 40px;">'

    # 2. Update the logo size (width="30" height="30" -> width="40" height="40") inside the footer
    # Only replace in footer block, but we can do a more specific regex
    $content = $content -replace '<svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www\.w3\.org/2000/svg">', '<svg width="40" height="40" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">'

    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
}

Write-Output "Footer grid and logo updated."
