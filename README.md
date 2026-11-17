# HarperLinks — website

The public marketing site. **Your business. Your AI workforce. One platform.**
A father & son build from Perth, WA.

Pure static — no build step, no dependencies. All CSS and JS are inline in
`index.html`.

The dashboard application lives in a separate repo:
[harperlinks-dashboard](https://github.com/stoneharper66-jpg/harperlinks-dashboard).
This site deliberately **does not link to it**.

---

## Preview locally

```bash
python3 -m http.server 4870
```

Then open <http://localhost:4870>. Use a server rather than opening `index.html`
directly — `file://` breaks the root-relative links.

## Deploy

**Netlify (drag & drop):** drag this folder onto <https://app.netlify.com/drop>.

**CLI:**
```bash
netlify deploy --prod --dir .
```

Works the same on Vercel, Cloudflare Pages or GitHub Pages — publish the folder as-is.
`netlify.toml` and `_headers` set security headers and asset caching.

---

## Where the buttons go

Every call-to-action ("Get started", "Start with Business"…) is driven by one constant
near the top of the `<script>` in `index.html`:

```js
var CTA_URL = "";
```

- **Left empty** — buttons scroll to the sign-up section at the bottom of the page.
- **Set to a link** — e.g. your GoHighLevel booking calendar — every button opens it in
  a new tab.

---

## What's here

```
index.html      the entire site (CSS + JS inline)
assets/         logo-alpha.png (transparent), logo-glow.png (social share), favicon
404.html        branded not-found page
_headers        security + cache headers
netlify.toml    publish config, no build command
robots.txt
brand/          logo pack — square, banner, transparent + usage notes
ghl/            paste-ready block for hosting this design inside GoHighLevel
tools/          build-ghl-block.py — regenerates ghl/PASTE-INTO-GHL.html
```

### Generated — don't hand-edit

`ghl/PASTE-INTO-GHL.html` is built from `index.html`. Edit the source, then regenerate:

```bash
python3 tools/build-ghl-block.py
```

Hand-editing the copy makes it silently drift from the real site.

---

## Before going live

- **Socials** — the footer icons are inactive until you add real URLs. Find the `SOCIALS`
  array near the top of the `<script>` in `index.html` and fill in each `url`. Empty ones
  stay greyed out rather than linking somewhere that doesn't exist.
- **Pricing** — A$249 / A$499 / A$999 are shown as "free while we build". Keep that
  honest until Stripe is actually connected.
- **Logo hosting** — `ghl/PASTE-INTO-GHL.html` embeds the logo directly, so it has no
  external dependencies. If you instead hotlink images from GitHub, be aware raw.github
  is not a CDN and can rate-limit.
