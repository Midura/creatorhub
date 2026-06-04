$cssAppend = @"

/* Mobile Overrides */
@media (max-width: 768px) {
  .grid-cols-2, .grid-cols-3 { 
    grid-template-columns: 1fr !important; 
    gap: 1.5rem !important; 
  }
  .card { 
    padding: 20px !important; 
  }
  h1 { font-size: 2.2rem !important; }
  h2 { font-size: 1.8rem !important; }
  h3 { font-size: 1.5rem !important; }
  
  /* Ensure container doesn't overflow */
  .container { padding: 0 15px; }
}
"@
Add-Content -Path "f:\Website\style.css" -Value $cssAppend -Encoding UTF8

Write-Output "Successfully updated mobile responsiveness CSS!"
