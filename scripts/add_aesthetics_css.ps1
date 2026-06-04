$cssAppend = @"

/* --- AESTHETIC UPGRADES (Glassmorphism & Animations) --- */

.glass-panel {
  background: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
  border: 1px solid rgba(255, 255, 255, 0.4);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
  border-radius: var(--radius-lg);
  position: relative;
  z-index: 2;
}

body.dark-theme .glass-panel {
  background: rgba(25, 26, 35, 0.6);
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

.text-gradient {
  background: linear-gradient(135deg, #191A23 0%, #4a7c1b 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

body.dark-theme .text-gradient {
  background: linear-gradient(135deg, var(--primary) 0%, #00d2ff 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.hero-wrapper {
  position: relative;
  overflow: hidden;
  background: linear-gradient(to bottom right, var(--white), #f0fdf4);
}

body.dark-theme .hero-wrapper {
  background: linear-gradient(to bottom right, var(--dark), #111827);
}

.blob {
  position: absolute;
  border-radius: 50%;
  filter: blur(80px);
  z-index: 0;
  opacity: 0.5;
  animation: floatBlob 10s infinite alternate ease-in-out;
}

.blob-1 {
  width: 400px; height: 400px;
  background: var(--primary);
  top: -100px; left: -100px;
}

.blob-2 {
  width: 300px; height: 300px;
  background: #00d2ff;
  bottom: -50px; right: -50px;
  animation-delay: 2s;
}

@keyframes floatBlob {
  0% { transform: translate(0, 0) scale(1); }
  100% { transform: translate(50px, 50px) scale(1.1); }
}

.card {
  transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275), box-shadow 0.4s ease, background-color 0.3s ease;
}

.card:hover {
  transform: translateY(-8px);
  box-shadow: 0 15px 30px rgba(0,0,0,0.1);
}

body.dark-theme .card:hover {
  box-shadow: 0 15px 30px rgba(185, 255, 102, 0.15);
}

.counter-number {
  font-size: clamp(2.5rem, 4vw, 3.5rem);
  font-weight: 700;
  color: var(--dark);
  margin-bottom: 0.5rem;
  line-height: 1.1;
}

body.dark-theme .counter-number {
  color: var(--white);
}

.counter-label {
  font-size: 1.125rem;
  opacity: 0.8;
  font-weight: 500;
}
"@

Add-Content -Path "f:\Website\style.css" -Value $cssAppend -Encoding UTF8
Write-Output "Successfully appended aesthetic CSS rules to style.css!"
