$cssPath = "f:\Website\style.css"
$css = [System.IO.File]::ReadAllText($cssPath, [System.Text.Encoding]::UTF8)

# 1. Update Body Background
$oldBody = @"
body {
  font-family: var(--font-main);
  background-color: var(--white);
  color: var(--dark);
  line-height: 1.6;
}
"@

$newBody = @"
body {
  font-family: var(--font-main);
  background: linear-gradient(135deg, #f0fdf4 0%, #e0f2fe 100%) fixed;
  color: var(--dark);
  line-height: 1.6;
}
body.dark-theme {
  background: linear-gradient(135deg, #111827 0%, #1f2937 100%) fixed;
}
"@
$css = $css.Replace($oldBody, $newBody)


# 2. Update Cards
$oldCards = @"
/* Cards */
.card {
  padding: 40px;
  border-radius: var(--radius-lg);
  border: 1px solid var(--dark);
  box-shadow: 0 5px 0 var(--dark);
  background-color: var(--white);
  transition: transform 0.2s;
}

.card:hover {
  transform: translateY(-5px);
}

.card-light { background-color: var(--light); }
.card-primary { background-color: var(--primary); color: #191A23; }
.card-dark { background-color: var(--dark); color: var(--white); }
"@

$newCards = @"
/* Cards - Global Glassmorphism */
.card {
  padding: 40px;
  border-radius: var(--radius-lg);
  border: 1px solid rgba(255, 255, 255, 0.6);
  box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.05);
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
  transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275), box-shadow 0.4s ease, border-color 0.3s ease;
}

body.dark-theme .card {
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
}

.card:hover {
  transform: translateY(-8px);
  box-shadow: 0 15px 30px rgba(0,0,0,0.1);
  border-color: rgba(255, 255, 255, 0.9);
}
body.dark-theme .card:hover {
  box-shadow: 0 15px 30px rgba(185, 255, 102, 0.15);
  border-color: rgba(185, 255, 102, 0.3);
}

.card-light { background-color: rgba(255, 255, 255, 0.65); }
body.dark-theme .card-light { background-color: rgba(42, 43, 56, 0.65); }

.card-primary { background-color: rgba(185, 255, 102, 0.85); color: #191A23; }
body.dark-theme .card-primary { background-color: rgba(185, 255, 102, 0.75); }

.card-dark { background-color: rgba(25, 26, 35, 0.85); color: var(--white); }
body.dark-theme .card-dark { background-color: rgba(255, 255, 255, 0.1); }
"@
$css = $css.Replace($oldCards, $newCards)


# 3. Update Navbar
$oldNav = @"
/* Navigation */
.navbar {
  padding: 20px 0;
  position: sticky;
  top: 0;
  background-color: var(--white);
  z-index: 100;
  border-bottom: 1px solid var(--light);
}
"@

$newNav = @"
/* Navigation - Glassmorphism */
.navbar {
  padding: 20px 0;
  position: sticky;
  top: 0;
  background-color: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  z-index: 100;
  border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}
body.dark-theme .navbar {
  background-color: rgba(25, 26, 35, 0.7);
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}
"@
$css = $css.Replace($oldNav, $newNav)


[System.IO.File]::WriteAllText($cssPath, $css, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Successfully applied global glassmorphism to style.css!"
