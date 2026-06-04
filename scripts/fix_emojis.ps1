$files = Get-ChildItem -Path . -Filter *.html

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)

    # Fix popup emoji
    $content = [regex]::Replace($content, 'Welcome to Creator Hub![^<]*</h2>', 'Welcome to Creator Hub! 🎉</h2>')

    # Fix the arrow in cards
    $content = [regex]::Replace($content, '(<a href="profile\.html" style="width: 40px; height: 40px; border-radius: 50%; background-color: var\(--[^)]+\); color: var\(--[^)]+\); display: flex; align-items: center; justify-content: center; text-decoration: none; font-weight: bold;">)[^<]+(</a>)', '$1→$2')

    # Fix footer location emoji
    $content = [regex]::Replace($content, '<li style="color: var\(--white\); opacity: 0.8; font-size: 0.875rem;">[^<]*Colombo Trade City, Colombo 03</li>', '<li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">📍 Colombo Trade City, Colombo 03</li>')

    # Fix footer email emoji
    $content = [regex]::Replace($content, '<li style="color: var\(--white\); opacity: 0.8; font-size: 0.875rem;">[^<]*hello@creatorhub\.lk</li>', '<li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">✉️ hello@creatorhub.lk</li>')

    # Ensure UTF-8 Without BOM
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
}

Write-Output "Fixed all files"
