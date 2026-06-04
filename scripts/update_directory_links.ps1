$html = [System.IO.File]::ReadAllText("f:\Website\directory.html", [System.Text.Encoding]::UTF8)
$html = $html -replace 'href="profile.html', 'href="creator-profile.html'
[System.IO.File]::WriteAllText("f:\Website\directory.html", $html, (New-Object System.Text.UTF8Encoding $false))

Write-Output "Successfully updated directory links to point to creator-profile.html!"
