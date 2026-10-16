# LINKHUB Premium — Final Version

Premium, responsive Telegram link hub with a **real shared public visitor counter**. Includes all five original Telegram links, glowing URL cards, copy buttons, and direct Telegram buttons.

## Visitor counter behavior

- **Unique visitors**: each browser with a persistent localStorage UUID counts once (not necessarily a unique human). UUIDs are SHA-256 hashed before storage.
- **Total visits**: increments on each page load, including reloads.
- **Everyone sees the same counts**, stored in a Cloudflare D1 database. No admin panel.
- Bot traffic, cleared browser storage, private browsing, and different devices may affect counts. This is not a verified count of unique people.
- Counts show `—` when opening `index.html` directly or before the backend is deployed; no fake statistics are displayed.

## Run locally (Node.js required)

1. In this folder run `npm install`.
2. In a terminal run `npx wrangler d1 create linkhub-visitors` and copy the returned `database_id` into `wrangler.toml` replacing `REPLACE_WITH_YOUR_D1_DATABASE_ID`.
3. Run `npm run db:local` to create the local tables.
4. Run `npm run dev` and open the localhost URL shown by Wrangler (normally http://localhost:8787). The visitor counter works locally.

## Publish online (Cloudflare account required)

1. Run `npx wrangler login` and authenticate in the browser.
2. Ensure the D1 database was created and its ID is in `wrangler.toml`.
3. Run `npm run db:remote` to initialize the production database.
4. Run `npm run deploy`. Wrangler displays your public workers.dev URL. Visit it to test the live, shared counter.

**Important:** Uploading only `public/index.html` to a static host such as GitHub Pages or Netlify does **not** enable the shared counter. The Worker and D1 database must be deployed together. This project needs no API keys embedded in frontend code. Never commit authentication tokens.

## Edit links

Open `public/index.html`, search for `const links=[`, and edit each object's title, description, URL, or tag. The cards are generated automatically. Do not change URL characters accidentally.

## Files

- `public/index.html`: complete responsive frontend
- `src/worker.js`: visit tracking API and static asset routing
- `schema.sql`: D1 tables
- `wrangler.toml`: Cloudflare deployment settings
- `package.json`: development/deployment commands
