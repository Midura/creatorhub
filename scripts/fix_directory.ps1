$html = [System.IO.File]::ReadAllText("f:\Website\directory.html", [System.Text.Encoding]::UTF8)

$card4 = @"
      <!-- Card 4 -->
      <div class="card card-light flex-col gap-4">
        <div style="display: flex; align-items: center; gap: 20px; border-bottom: 1px solid var(--dark); padding-bottom: 20px; margin-bottom: 20px;">
          <img src="images/creator_hasini.jpg" alt="Hasini Beauty" style="width: 80px; height: 80px; border-radius: 50%; border: 1px solid var(--dark); object-fit: cover; object-position: center;">
          <div>
            <h4 style="font-size: 1.25rem; margin-bottom: 5px;">Hasini Beauty</h4>
            <span style="background-color: var(--primary); color: var(--dark); padding: 2px 8px; border-radius: 4px; font-size: 0.875rem; font-weight: 500;">Beauty & Makeup</span>
          </div>
        </div>
        <div class="flex justify-between items-center">
          <div>
            <p style="margin: 0; font-size: 0.875rem; opacity: 0.8;">Audience</p>
            <p style="margin: 0; font-weight: 600; font-size: 1.125rem;">150K</p>
          </div>
          <a href="profile.html" style="width: 40px; height: 40px; border-radius: 50%; background-color: var(--dark); color: var(--primary); display: flex; align-items: center; justify-content: center; text-decoration: none; font-weight: bold;">&#8594;</a>
        </div>
      </div>

"@

# Insert right before "<!-- Card 5 -->"
$html = $html -replace '(?s)      <!-- Card 5 -->', ($card4 + '      <!-- Card 5 -->')

[System.IO.File]::WriteAllText("f:\Website\directory.html", $html, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Restored Hasini Beauty and added DP!"
