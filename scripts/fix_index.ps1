$html = [System.IO.File]::ReadAllText("f:\Website\index.html", [System.Text.Encoding]::UTF8)

$search = @"
  <!-- Featured Creators -->
  <section class="container section animate-on-scroll">
    <div class="flex items-center gap-8 mb-8">
  </section>
"@

$replace = @"
  <!-- Featured Creators -->
  <section class="container section animate-on-scroll">
    <div class="flex items-center gap-8 mb-8">
      <h2>Featured Creators</h2>
      <p style="margin: 0;">Discover top-performing talent ready for your next big campaign.</p>
    </div>
    <div class="grid grid-cols-2 gap-8">
      <!-- Creator Card 1 -->
      <div class="card card-light flex-col gap-4">
        <div style="display: flex; align-items: center; gap: 20px; border-bottom: 1px solid var(--dark); padding-bottom: 20px; margin-bottom: 20px;">
          <img src="images/creator_tech.png" alt="Kavindu Perera" style="width: 80px; height: 80px; border-radius: 50%; border: 1px solid var(--dark); object-fit: cover; object-position: center;">
          <div>
            <h4 style="font-size: 1.25rem; margin-bottom: 5px;">Kavindu Perera</h4>
            <span style="background-color: var(--primary); color: var(--dark); padding: 2px 8px; border-radius: 4px; font-size: 0.875rem; font-weight: 500;">Tech & Gadgets</span>
          </div>
        </div>
        <div class="flex justify-between items-center">
          <div>
            <p style="margin: 0; font-size: 0.875rem; opacity: 0.8;">Audience</p>
            <p style="margin: 0; font-weight: 600; font-size: 1.125rem;">125K</p>
          </div>
          <a href="profile.html?name=Kavindu%20Perera&role=Tech%20%26%20Gadgets&img=images/creator_tech.png" style="width: 40px; height: 40px; border-radius: 50%; background-color: var(--dark); color: var(--primary); display: flex; align-items: center; justify-content: center; text-decoration: none; font-weight: bold;">&#8594;</a>
        </div>
      </div>
      
      <!-- Creator Card 2 -->
      <div class="card card-dark flex-col gap-4">
        <div style="display: flex; align-items: center; gap: 20px; border-bottom: 1px solid var(--white); padding-bottom: 20px; margin-bottom: 20px;">
          <img src="images/creator_fashion.png" alt="Sithmi Silva" style="width: 80px; height: 80px; border-radius: 50%; border: 1px solid var(--dark); object-fit: cover; object-position: center;">
          <div>
            <h4 style="font-size: 1.25rem; margin-bottom: 5px;">Sithmi Silva</h4>
            <span style="background-color: var(--white); color: var(--dark); padding: 2px 8px; border-radius: 4px; font-size: 0.875rem; font-weight: 500;">Fashion & Lifestyle</span>
          </div>
        </div>
        <div class="flex justify-between items-center">
          <div>
            <p style="margin: 0; font-size: 0.875rem; opacity: 0.8;">Audience</p>
            <p style="margin: 0; font-weight: 600; font-size: 1.125rem;">89K</p>
          </div>
          <a href="profile.html?name=Sithmi%20Silva&role=Fashion%20%26%20Lifestyle&img=images/creator_fashion.png" style="width: 40px; height: 40px; border-radius: 50%; background-color: var(--white); color: var(--dark); display: flex; align-items: center; justify-content: center; text-decoration: none; font-weight: bold;">&#8594;</a>
        </div>
      </div>
    </div>
    <div class="text-center mt-8">
      <a href="directory.html" class="btn btn-outline">View Full Directory</a>
    </div>
  </section>
"@

$html = $html.Replace($search, $replace)
[System.IO.File]::WriteAllText("f:\Website\index.html", $html, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Restored index.html!"
