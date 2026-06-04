// Add any global JavaScript functionality here
// For example, mobile menu toggling or simple animations.

// --- Dark Theme Logic ---
const initTheme = () => {
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    document.body.classList.add('dark-theme');
  }
};
initTheme(); // Run immediately

document.addEventListener('DOMContentLoaded', () => {
  console.log("Creator Hub loaded successfully!");

  // --- Mobile Hamburger Menu ---
  const hamburgerBtn = document.getElementById('hamburgerBtn');
  const navLinks = document.querySelector('.nav-links');
  if (hamburgerBtn && navLinks) {
    hamburgerBtn.addEventListener('click', () => {
      hamburgerBtn.classList.toggle('open');
      navLinks.classList.toggle('mobile-open');
    });
    // Close menu when a link is clicked
    navLinks.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', () => {
        hamburgerBtn.classList.remove('open');
        navLinks.classList.remove('mobile-open');
      });
    });
  }

  // --- Dark Theme Toggle ---
  const themeToggleBtn = document.getElementById('themeToggle');
  if (themeToggleBtn) {
    themeToggleBtn.addEventListener('click', () => {
      document.body.classList.toggle('dark-theme');
      const isDark = document.body.classList.contains('dark-theme');
      localStorage.setItem('theme', isDark ? 'dark' : 'light');
    });
  }
  
  // Example: Accordion Logic (if added later)
  const headers = document.querySelectorAll('.accordion-header');
  headers.forEach(header => {
    header.addEventListener('click', () => {
      const item = header.parentElement;
      const isActive = item.classList.contains('active');
      
      document.querySelectorAll('.accordion-item').forEach(accItem => {
        accItem.classList.remove('active');
      });
      
      if (!isActive) {
        item.classList.add('active');
      }
    });
  });

  // --- Scroll Animations ---
  const scrollElements = document.querySelectorAll('.animate-on-scroll');
  
  const elementInView = (el, percentageScroll = 100) => {
    const elementTop = el.getBoundingClientRect().top;
    return (elementTop <= ((window.innerHeight || document.documentElement.clientHeight) * (percentageScroll/100)));
  };
  
  const displayScrollElement = (element) => {
    element.classList.add('is-visible');
  };
  
  // Using IntersectionObserver for better performance
  const observerOptions = {
    root: null,
    rootMargin: '0px',
    threshold: 0.15
  };
  
  const scrollObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible');
        observer.unobserve(entry.target); // Only animate once
      }
    });
  }, observerOptions);
  
  scrollElements.forEach(el => scrollObserver.observe(el));

  // --- Animated Number Counters ---
  const counters = document.querySelectorAll('.counter-number');
  
  if (counters.length > 0) {
    const counterObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const target = +entry.target.getAttribute('data-target');
          const suffix = entry.target.getAttribute('data-suffix') || '+';
          const duration = 2000; // 2 seconds
          // Calculate step time or fallback to 10ms for smooth animation
          const stepTime = Math.max(10, Math.floor(duration / target));
          let current = 0;
          
          const timer = setInterval(() => {
            // Adjust step size based on target to ensure it finishes in ~2s
            const increment = Math.max(1, Math.ceil(target / (duration / stepTime)));
            current += increment;
            
            if (current >= target) {
              entry.target.innerText = target.toLocaleString() + suffix;
              clearInterval(timer);
            } else {
              entry.target.innerText = current.toLocaleString() + suffix;
            }
          }, stepTime);
          
          observer.unobserve(entry.target);
        }
      });
    }, { rootMargin: '0px', threshold: 0.2 });
    
    counters.forEach(counter => counterObserver.observe(counter));
  }
});

// Parallax Scrolling for Geometric Shapes
document.addEventListener('scroll', function() {
  const scrolled = window.scrollY;
  const shapes = document.querySelectorAll('.p-shape');
  
  shapes.forEach(shape => {
    const speed = shape.getAttribute('data-speed');
    const yPos = -(scrolled * speed);
    
    // We maintain the CSS transforms (like rotate from animations) by using a wrapper or just translating the base
    // To not overwrite CSS animations, we apply the parallax to a transform property directly via JS,
    // but CSS animations overwrite inline transform.
    // So we translate the shape's margins or top/left instead, or wrap them. 
    // Since they are absolute, we can use margin-top for safe parallax!
    shape.style.marginTop = yPos + 'px';
  });
});



// Booking Modal Logic
function openBookingModal() {
  const overlay = document.getElementById('bookingModalOverlay');
  const modal = document.getElementById('bookingModal');
  if (overlay && modal) {
    overlay.classList.add('active');
    modal.classList.add('active');
    document.body.style.overflow = 'hidden'; // Prevent scrolling
  }
}

function closeBookingModal() {
  const overlay = document.getElementById('bookingModalOverlay');
  const modal = document.getElementById('bookingModal');
  if (overlay && modal) {
    overlay.classList.remove('active');
    modal.classList.remove('active');
    document.body.style.overflow = 'auto';
  }
}

// Newsletter Popup Logic
document.addEventListener('DOMContentLoaded', () => {
  const newsletter = document.getElementById('newsletterPopup');
  if (newsletter) {
    // Check if user already dismissed it
    const hasSeenNewsletter = localStorage.getItem('seenNewsletter');
    
    if (!hasSeenNewsletter) {
      // Show it creatively after 4 seconds
      setTimeout(() => {
        newsletter.classList.add('show');
      }, 4000);
    }
  }
});

function closeNewsletter() {
  const newsletter = document.getElementById('newsletterPopup');
  if (newsletter) {
    newsletter.classList.remove('show');
    // Save to localStorage so it doesn't annoy them again
    localStorage.setItem('seenNewsletter', 'true');
  }
}
