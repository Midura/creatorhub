$files = Get-ChildItem -Path "f:\Website\*.html"
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    # Fix the popup emoji
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, 'Welcome to Creator Hub! [^<]+<', 'Welcome to Creator Hub! 🎉<')
    
    # Fix the location pin
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, '<li[^>]*>[^C]*?Colombo Trade City', '<li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">📍 Colombo Trade City')
    
    # Fix the email icon
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, '<li[^>]*>[^h]*?hello@creatorhub\.lk', '<li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">✉️ hello@creatorhub.lk')
    
    # Fix the arrows in cards
    $content = [System.Text.RegularExpressions.Regex]::Replace($content, "font-weight: bold;'>[^<]+</a>", "font-weight: bold;'>→</a>")

    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
}
