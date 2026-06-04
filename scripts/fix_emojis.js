const fs = require('fs');

const files = fs.readdirSync(__dirname).filter(f => f.endsWith('.html'));

files.forEach(file => {
  let content = fs.readFileSync(file, 'utf8');

  // Fix the popup emoji
  content = content.replace(/Welcome to Creator Hub![^<]*<\/h2>/g, 'Welcome to Creator Hub! 🎉</h2>');

  // Fix the arrow in cards
  content = content.replace(/(<a href="profile\.html" style="width: 40px; height: 40px; border-radius: 50%; background-color: var\(--[^)]+\); color: var\(--[^)]+\); display: flex; align-items: center; justify-content: center; text-decoration: none; font-weight: bold;">)[^<]+(<\/a>)/g, '$1→$2');

  // Fix footer location emoji
  content = content.replace(/<li style="color: var\(--white\); opacity: 0.8; font-size: 0.875rem;">[^<]*Colombo Trade City, Colombo 03<\/li>/g, '<li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">📍 Colombo Trade City, Colombo 03</li>');

  // Fix footer email emoji
  content = content.replace(/<li style="color: var\(--white\); opacity: 0.8; font-size: 0.875rem;">[^<]*hello@creatorhub\.lk<\/li>/g, '<li style="color: var(--white); opacity: 0.8; font-size: 0.875rem;">✉️ hello@creatorhub.lk</li>');

  // Clean up any stray <li> injected by the bad script earlier
  content = content.replace(/<h3>Active Campaigns<\/h3>[\s\S]*?<li style="color: var\(--white\); opacity: 0.8; font-size: 0.875rem;">📍 Colombo Trade City, Colombo 03<\/li>[\s\S]*?<li style="color: var\(--white\); opacity: 0.8; font-size: 0.875rem;">✉️ hello@creatorhub\.lk<\/li>/g, '<h3>Active Campaigns</h3>');

  fs.writeFileSync(file, content, 'utf8');
});
console.log('Fixed all files');
