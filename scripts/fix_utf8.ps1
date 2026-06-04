$files = Get-ChildItem -Path . -Filter *.html

$party = [char]::ConvertFromUtf32(0x1F389)
$pin = [char]::ConvertFromUtf32(0x1F4CD)
$envelope = [char]::ConvertFromUtf32(0x2709) + [char]::ConvertFromUtf32(0xFE0F)
$arrow = [char]0x2192

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)

    # Fix popup
    $content = [regex]::Replace($content, 'Welcome to Creator Hub![^<]*</h2>', "Welcome to Creator Hub! $party</h2>")

    # Fix arrows
    $content = [regex]::Replace($content, '(<a href="profile\.html" style="width: 40px; height: 40px; border-radius: 50%; background-color: var\(--[^)]+\); color: var\(--[^)]+\); display: flex; align-items: center; justify-content: center; text-decoration: none; font-weight: bold;">)[^<]+(</a>)', "`$1${arrow}`$2")

    # Fix footer location
    $content = [regex]::Replace($content, '<li style="color: var\(--white\); opacity: 0.8; font-size: 0.875rem;">[^<]*Colombo Trade City, Colombo 03</li>', "<li style=`"color: var(--white); opacity: 0.8; font-size: 0.875rem;`">$pin Colombo Trade City, Colombo 03</li>")

    # Fix footer email
    $content = [regex]::Replace($content, '<li style="color: var\(--white\); opacity: 0.8; font-size: 0.875rem;">[^<]*hello@creatorhub\.lk</li>', "<li style=`"color: var(--white); opacity: 0.8; font-size: 0.875rem;`">$envelope hello@creatorhub.lk</li>")

    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
}

Write-Output "All emojis fixed with strict UTF8"
