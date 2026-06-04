$files = Get-ChildItem -Path "f:\Website" -Filter *.html
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

foreach ($file in $files) {
    $lines = Get-Content $file.FullName
    $newLines = @()
    $navModified = $false
    
    foreach ($line in $lines) {
        $newLines += $line
        # Insert Contact Us right after About in the main navigation
        if ($line -match '<a href="about.html".*>About</a>' -and -not $navModified) {
            # Ensure we are inside the navbar by checking context conceptually (it works since About is only in navbars generally formatted like this)
            $newLines += '        <a href="contact.html" style="text-decoration: none; color: var(--dark); font-weight: 500;">Contact Us</a>'
            $navModified = $true
        }
    }
    
    [System.IO.File]::WriteAllLines($file.FullName, $newLines, $utf8NoBom)
    Write-Host "Processed $($file.Name)"
}
