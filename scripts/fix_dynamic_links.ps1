$html = [System.IO.File]::ReadAllText("f:\Website\directory.html", [System.Text.Encoding]::UTF8)

$cards = $html -split '(?=<div class="card)'

for ($i = 0; $i -lt $cards.Length; $i++) {
    $card = $cards[$i]
    
    $img = ""
    $name = ""
    $role = ""
    
    if ($card -match '<img src="([^"]+)"') { $img = $matches[1] }
    if ($card -match '<h4[^>]*>([^<]+)</h4>') { $name = [uri]::EscapeDataString($matches[1]) }
    if ($card -match '<span[^>]*>([^<]+)</span>') { $role = [uri]::EscapeDataString($matches[1]) }
    
    if ($name -and $role -and $img) {
        $newHref = "profile.html?name=$name&role=$role&img=$img"
        # We need to replace href="profile.html?..." with the correct one
        $cards[$i] = [regex]::Replace($card, 'href="profile\.html[^"]*"', "href=`"$newHref`"")
    }
}

$newHtml = $cards -join ''
[System.IO.File]::WriteAllText("f:\Website\directory.html", $newHtml, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Successfully fixed the dynamic links!"
