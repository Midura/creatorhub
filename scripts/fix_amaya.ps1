$html = [System.IO.File]::ReadAllText("f:\Website\directory.html", [System.Text.Encoding]::UTF8)

# Find the exact breaking point.
$part1 = "        <select class=`"input-field`" style=`"width: 200px;`">`n          <option>Sort By: Audience</option>`n          <option>Sort By: Engagement</option>`n        </select>"
$part2 = "            <p style=`"margin: 0; font-weight: 600; font-size: 1.125rem; color: var(--dark);`">340K</p>`n          </div>`n          <a href=`"profile.html`""

$idx1 = $html.IndexOf("        </select>")
$idx2 = $html.IndexOf("            <p style=`"margin: 0; font-weight: 600; font-size: 1.125rem; color: var(--dark);`">340K</p>")

if ($idx1 -ge 0 -and $idx2 -ge 0) {
    # Extract the exact string to replace just in case of whitespace differences
    $before = $html.Substring(0, $idx1 + 17) # includes "        </select>" and newline
    $after = $html.Substring($idx2)

    $insertion = @"
      </div>
    </div>

    <div class="grid grid-cols-3 gap-8">
      <!-- Card -->
      <div class="card card-light flex-col gap-4">
        <div style="display: flex; align-items: center; gap: 20px; border-bottom: 1px solid var(--dark); padding-bottom: 20px; margin-bottom: 20px;">
          <img src="images/creator_amaya.jpg" alt="Travel with Amaya" style="width: 80px; height: 80px; border-radius: 50%; border: 1px solid var(--dark); object-fit: cover; object-position: center;">
          <div>
            <h4 style="font-size: 1.25rem; margin-bottom: 5px;">Travel with Amaya</h4>
            <span style="background-color: var(--primary); color: var(--dark); padding: 2px 8px; border-radius: 4px; font-size: 0.875rem; font-weight: 500;">Travel</span>
          </div>
        </div>
        <div class="flex justify-between items-center">
          <div>
            <p style="margin: 0; font-size: 0.875rem; opacity: 0.8; color: var(--dark);">Audience</p>
"@ + "`n"

    $newContent = $before + $insertion + $after
    [System.IO.File]::WriteAllText("f:\Website\directory.html", $newContent, (New-Object System.Text.UTF8Encoding $false))
    Write-Output "Successfully restored directory.html and added Amaya's DP!"
} else {
    Write-Output "Failed to find the break points. Indices: $idx1, $idx2"
}
