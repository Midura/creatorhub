$html = [System.IO.File]::ReadAllText("f:\Website\directory.html", [System.Text.Encoding]::UTF8)

# Map of Creator Name -> Image Path
$replacements = @(
    @{ Name = "Chef Malshan"; Image = "images/creator_chef.png" },
    @{ Name = "Dilshan Tech"; Image = "images/creator_tech.png" },
    @{ Name = "Senuri Sweets"; Image = "images/creator_baker.png" },
    @{ Name = "Yoga with Anya"; Image = "images/creator_yoga.png" },
    @{ Name = "Gamer Girl LK"; Image = "images/creator_gamer.png" }
)

foreach ($r in $replacements) {
    # The regex targets the avatar div specifically in the card that has the matching creator name.
    # We look for the div with border-radius: 50% followed by the creator's name in an h4 tag.
    $pattern = '(?s)<div style="width: 80px; height: 80px; border-radius: 50%; background-color: var\(--[a-z]+\); border: 1px solid var\(--dark\);"></div>(\s*<div>\s*<h4[^>]*>' + [regex]::Escape($r.Name) + '</h4>)'
    
    $replacement = '<img src="' + $r.Image + '" alt="' + $r.Name + '" style="width: 80px; height: 80px; border-radius: 50%; border: 1px solid var(--dark); object-fit: cover; object-position: center;">$1'
    
    $html = [regex]::Replace($html, $pattern, $replacement)
}

[System.IO.File]::WriteAllText("f:\Website\directory.html", $html, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Successfully updated directory.html with 5 new AI generated profile pictures!"
