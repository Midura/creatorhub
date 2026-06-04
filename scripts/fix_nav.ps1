$files = Get-ChildItem -Path "f:\Website" -Filter *.html
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

$contactBad = '<a href="contact.html" style="text-decoration: none; color: var(--dark); font-weight: 500;">Contact Us</a>'
$contactGood = '        <li><a href="contact.html">Contact Us</a></li>'

$divBad = '<div style="display: flex; gap: 15px;">'
$divGood = '      <div style="display: flex; gap: 15px; align-items: center;">
        <button id="themeToggle" style="background: none; border: 1px solid var(--dark); border-radius: 50%; width: 40px; height: 40px; cursor: pointer; font-size: 1.1rem; display: flex; align-items: center; justify-content: center; color: var(--dark); transition: all 0.3s;" title="Toggle Dark/Light Mode">🌙</button>'

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    $content = $content.Replace($contactBad, $contactGood)
    
    # Only replace the first occurrence of divBad (the navbar one)
    $idx = $content.IndexOf($divBad)
    if ($idx -ge 0) {
        $content = $content.Substring(0, $idx) + $divGood + $content.Substring($idx + $divBad.Length)
    }
    
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
    Write-Host "Fixed $($file.Name)"
}
