# SplitSimple

A clean, ad-free expense splitter. No accounts, no limits, no subscriptions. Your data stays in your browser.

## How to Use

1. Open `index.html` in any browser
2. Create a group (trip, dinner, roommates, etc.)
3. Add people
4. Add expenses - pick who paid and how to split
5. Check the Settle Up tab to see who owes whom

## Features

- **Groups** - Organize by trip, event, or household. Each group has its own people and expenses.
- **Three split modes** - Equal (default), custom dollar amounts, or percentage-based.
- **Smart settlements** - Minimizes the number of payments needed to settle up. If Alice owes Bob $20 and Bob owes Carol $20, it just says Alice pays Carol $20.
- **Balance bars** - Visual breakdown showing who's up and who's down.
- **Export** - Download a text summary of settlements and all expenses.
- **Import/Export backup** - Full JSON backup and restore.
- **Dark mode** - Toggle in the header, persisted to localStorage.
- **Responsive** - Works on phone and desktop.
- **Zero infrastructure** - Single HTML file, no build step, no backend. Runs from a file:// URL or any static host.

## Stack

- React 18 via CDN
- Tailwind CSS via CDN
- Babel standalone for JSX
- localStorage for persistence

## Deploy

```bash
# Local
open index.html

# Or serve
python3 -m http.server 8080

# Static host
# Drop index.html on Cloudflare Pages, Netlify, or any static site host.
```
