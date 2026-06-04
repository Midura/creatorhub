# Remove dynamic shapes from style.css
$css = [System.IO.File]::ReadAllText("f:\Website\style.css", [System.Text.Encoding]::UTF8)
$patternCss = '(?s)/\* Dynamic Drifting Shapes \*/.*'
$css = [System.Text.RegularExpressions.Regex]::Replace($css, $patternCss, "")
[System.IO.File]::WriteAllText("f:\Website\style.css", $css, (New-Object System.Text.UTF8Encoding $false))

# Remove dynamic shapes from main.js
$js = [System.IO.File]::ReadAllText("f:\Website\main.js", [System.Text.Encoding]::UTF8)
$patternJs = '(?s)// Dynamic Floating Shapes Engine.*'
$js = [System.Text.RegularExpressions.Regex]::Replace($js, $patternJs, "")
[System.IO.File]::WriteAllText("f:\Website\main.js", $js, (New-Object System.Text.UTF8Encoding $false))

Write-Output "Successfully removed all shapes!"
