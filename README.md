# Boring Tools

A portfolio of free, private, zero-signup productivity tools that run entirely in the browser.

## Tools Included

| Tool | Category | Description | PWA |
|------|----------|-------------|-----|
| SubTrack Lite | Finance | Subscription and recurring payment tracker | No |
| MediTrack Simple | Health | Medication tracker with adherence reports | Yes |
| HabitFlow | Productivity | Daily habit tracker with streaks and heatmaps | Yes |
| NagReminder | Productivity | Persistent reminder app with auto-escalation | No |
| SplitSimple | Finance | Expense splitter with min-payment solver | Yes |

## Architecture

Every tool is a single HTML file using React 18 + Tailwind CSS via CDN. Data persists in localStorage. No backend, no database, no accounts.

## Run Locally

```bash
cd boring-tools-portfolio
python3 -m http.server 8080
# Visit http://localhost:8080
```

## Sync Tools

Tools live in their own directories under `~/projects/overnight-builds/`. The portfolio keeps copies. To sync the latest versions before deploying:

```bash
./sync-tools.sh
```

This compares mtimes and only copies tools that have changed.

## Deploy

Drop the entire directory on any static hosting provider:

- **Coolify:** Create a static site, point to this directory
- **Cloudflare Pages:** Connect the repo, publish root
- **Netlify/Vercel:** Drag and drop the folder
- **Any web server:** Serve the directory as static files

## Directory Structure

```
index.html              # Portfolio landing page
sync-tools.sh           # Sync script to pull latest tool versions
tools/
  subtrack-lite/        # Subscription tracker
    index.html
  meditrack-simple/     # Medication tracker (PWA)
    index.html
    manifest.json
    sw.js
  habitflow/            # Habit tracker (PWA)
    index.html
    manifest.json
    sw.js
  nagreminder/          # Persistent reminders
    index.html
  splitsimple/          # Expense splitter (PWA)
    index.html
    manifest.json
    sw.js
```

## Adding New Tools

1. Build the tool in its own directory under `~/projects/overnight-builds/`
2. Add the tool name to the `TOOLS` array in `sync-tools.sh`
3. Run `./sync-tools.sh` to copy it into the portfolio
4. Add a card to the Tools section in the root `index.html`
5. Deploy
