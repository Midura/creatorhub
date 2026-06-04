$cssAppend = @"

/* Hero Slideshow CSS */
.hero-slideshow {
  position: relative;
  width: 100%;
  max-width: 400px; /* Keep it constrained like the original image */
  aspect-ratio: 9/16;
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: 0 15px 30px rgba(0,0,0,0.15);
  animation: float 6s ease-in-out infinite;
  margin: 0 auto;
}

.hero-slideshow img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0;
  animation: heroCrossfade 16s infinite;
}

.hero-slideshow img:nth-child(1) { animation-delay: 0s; }
.hero-slideshow img:nth-child(2) { animation-delay: 4s; }
.hero-slideshow img:nth-child(3) { animation-delay: 8s; }
.hero-slideshow img:nth-child(4) { animation-delay: 12s; }

@keyframes heroCrossfade {
  0% { opacity: 0; }
  10% { opacity: 1; }
  25% { opacity: 1; }
  35% { opacity: 0; }
  100% { opacity: 0; }
}
"@

Add-Content -Path "f:\Website\style.css" -Value $cssAppend -Encoding UTF8
Write-Output "Successfully appended slideshow CSS!"
