$files = Get-ChildItem -Path "f:\Website" -Filter *.html
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

foreach ($file in $files) {
    $lines = Get-Content $file.FullName
    $newLines = @()
    $headerModified = $false
    
    foreach ($line in $lines) {
        # Check if this is the navbar container
        if ($line -match '<div class="flex gap-4">' -and -not $headerModified) {
            $line = $line -replace '<div class="flex gap-4">', '<div class="flex gap-4 items-center">'
        }
        
        # Check if this is the exact Brand button in the navbar
        if ($line -match '<a href="dashboard-brand.html" class="btn btn-outline" style="padding: 0.5rem 1.5rem;">For Brands</a>' -and -not $headerModified) {
            $newLines += '        <button id="themeToggle" style="background: none; border: 1px solid var(--dark); border-radius: 50%; width: 40px; height: 40px; cursor: pointer; font-size: 1.1rem; display: flex; align-items: center; justify-content: center; color: var(--dark); transition: all 0.3s;" title="Toggle Dark/Light Mode">🌙</button>'
            $headerModified = $true
        }
        $newLines += $line
    }
    
    [System.IO.File]::WriteAllLines($file.FullName, $newLines, $utf8NoBom)
    Write-Host "Processed $($file.Name)"
}
