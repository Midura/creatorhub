$html = [System.IO.File]::ReadAllText("f:\Website\directory.html", [System.Text.Encoding]::UTF8)

# Use regex to find each card block and inject URL parameters into the profile.html link
# We need to capture:
# 1. The image src: <img src="(.*?)"
# 2. The name: <h4[^>]*>(.*?)</h4>
# 3. The role: <span[^>]*>(.*?)</span>
# And then update the subsequent <a href="profile.html"

# This requires a slightly complex regex or just a simple split and replace loop per card.
$cards = $html -split '(?=<div class="card)'

for ($i = 0; $i -lt $cards.Length; $i++) {
    $card = $cards[$i]
    if ($card -match '<img src="([^"]+)"' -and $card -match '<h4[^>]*>([^<]+)</h4>' -and $card -match '<span[^>]*>([^<]+)</span>') {
        $img = $matches[1]
        $name = [uri]::EscapeDataString($matches[2])
        $role = [uri]::EscapeDataString($matches[3])
        
        $newHref = "profile.html?name=$name&role=$role&img=$img"
        
        # Replace the first occurrence of profile.html in this card
        $cards[$i] = $card -replace 'href="profile.html"', "href=`"$newHref`""
    }
}

$newHtml = $cards -join ''
[System.IO.File]::WriteAllText("f:\Website\directory.html", $newHtml, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Successfully made directory.html links dynamic!"
