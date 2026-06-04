$cssAppend = @"

/* Assignment Required Breakpoints */

/* Tablet browser @ 1280 x 800 pixels resolution */
@media (max-width: 1280px) {
  .container {
    max-width: 95%;
  }
  .hero h1 {
    font-size: 3rem;
  }
}

/* Mobile browser @ 640 x 800 pixels resolution */
@media (max-width: 640px) {
  .hero h1 {
    font-size: 2rem;
  }
  .grid-cols-2, .grid-cols-3, .footer-grid {
    grid-template-columns: 1fr;
  }
  .hero .flex {
    flex-direction: column;
    text-align: center;
  }
  .navbar .nav-links {
    display: none;
  }
  .card {
    padding: 1.5rem;
  }
}
"@

Add-Content -Path "f:\Website\style.css" -Value $cssAppend -Encoding UTF8
Write-Output "Successfully added required media queries to style.css"
