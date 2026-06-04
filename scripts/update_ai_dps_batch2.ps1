# Copy all images
$sourceDir = "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787"
$destDir = "f:\Website\images"

$names = @("gamersl", "explorer", "nuwan", "colomboeats", "nadeesh", "sam", "mithun", "finance", "dev", "streets", "movie", "fashion")

foreach ($name in $names) {
    Copy-Item "$sourceDir\creator_${name}_*.png" -Destination "$destDir\creator_${name}.png" -Force -ErrorAction SilentlyContinue
}

$html = [System.IO.File]::ReadAllText("f:\Website\directory.html", [System.Text.Encoding]::UTF8)

# Map of Creator Name -> Image Path
$replacements = @(
    @{ Name = "GamerSL"; Image = "images/creator_gamersl.png" },
    @{ Name = "Lanka Explorer"; Image = "images/creator_explorer.png" },
    @{ Name = "Fitness with Nuwan"; Image = "images/creator_nuwan.png" },
    @{ Name = "Colombo Eats"; Image = "images/creator_colomboeats.png" },
    @{ Name = "Nadeesh Moto"; Image = "images/creator_nadeesh.png" },
    @{ Name = "Vlog with Sam"; Image = "images/creator_sam.png" },
    @{ Name = "Mithun Photography"; Image = "images/creator_mithun.png" },
    @{ Name = "Finance Guru LK"; Image = "images/creator_finance.png" },
    @{ Name = "Dev Mentor LK"; Image = "images/creator_dev.png" },
    @{ Name = "Colombo Streets"; Image = "images/creator_streets.png" },
    @{ Name = "Movie Buff LK"; Image = "images/creator_movie.png" },
    @{ Name = "Fashion Hub"; Image = "images/creator_fashion.png" }
)

foreach ($r in $replacements) {
    $pattern = '(?s)<div style="width: 80px; height: 80px; border-radius: 50%; background-color: var\(--[a-z]+\); border: 1px solid var\(--dark\);"></div>(\s*<div>\s*<h4[^>]*>' + [regex]::Escape($r.Name) + '</h4>)'
    
    $replacement = '<img src="' + $r.Image + '" alt="' + $r.Name + '" style="width: 80px; height: 80px; border-radius: 50%; border: 1px solid var(--dark); object-fit: cover; object-position: center;">$1'
    
    $html = [regex]::Replace($html, $pattern, $replacement)
}

[System.IO.File]::WriteAllText("f:\Website\directory.html", $html, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Successfully updated directory.html with 12 new AI generated profile pictures!"
