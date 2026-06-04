$src = "C:\Users\MIDURA\.gemini\antigravity\brain\49efd5eb-a1ac-4473-a220-bfe42bbc7787"
$dest = "F:\Website\images"

$map = @{
    "food_cover" = "food_cover.png"
    "food_thumb_1" = "food_1.png"
    "food_thumb_2" = "food_2.png"
    "food_thumb_3" = "food_3.png"
    "travel_cover" = "travel_cover.png"
    "travel_thumb_1" = "travel_1.png"
    "travel_thumb_2" = "travel_2.png"
    "travel_thumb_3" = "travel_3.png"
    "gaming_cover" = "gaming_cover.png"
    "gaming_thumb_1" = "gaming_1.png"
    "gaming_thumb_2" = "gaming_2.png"
    "gaming_thumb_3" = "gaming_3.png"
}

foreach ($key in $map.Keys) {
    $files = Get-ChildItem -Path $src -Filter "$key*.png" | Sort-Object LastWriteTime -Descending
    if ($files.Count -gt 0) {
        $latest = $files[0]
        $destPath = Join-Path $dest $map[$key]
        Copy-Item -Path $latest.FullName -Destination $destPath -Force
        Write-Output "Copied $($latest.Name) -> $($map[$key])"
    } else {
        Write-Output "No file found for prefix $key"
    }
}
