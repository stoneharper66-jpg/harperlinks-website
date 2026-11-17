# Putting the HarperLinks design into GoHighLevel

Your sub-account id is the long string in your GHL dashboard URL:
`app.gohighlevel.com/v2/location/<YOUR_LOCATION_ID>/dashboard`
Keep it out of public code — it identifies your account.

`PASTE-INTO-GHL.html` is the entire HarperLinks site as **one block you can paste**.
The logo is embedded in the file, so there is nothing to upload to the media library.

---

## Steps

**1. Make a blank page**
GHL left menu → **Sites** → **Funnels** (or **Websites**) → **New Funnel/Website**
→ add a step → choose the **Blank** template. Do not pick a pre-made design, it
will fight ours.

**2. Open the builder and drop in a code element**
Click **Edit Page** → add a **Section** → inside it add a **Row** (1 column)
→ drag in the element called **Custom JS/HTML** (sometimes "Custom Code").

**3. Paste**
Open `PASTE-INTO-GHL.html`, select all, paste the whole thing into that element.
Save. Hit **Preview** — you should see the full dark site, edge to edge.

**4. Point the buttons somewhere**
Near the bottom of the pasted code there's a `CONFIG` block:

```js
var APP_URL      = "#";   // where "Launch app" should go
var CALENDAR_URL = "";    // your GHL booking calendar link
```

Put your GHL calendar link in `CALENDAR_URL` and every "Launch app" button
becomes a booking button. Get that link from **Calendars → your calendar →
Share/Embed**.

**5. Publish**
Page **Settings** → set the title/favicon → then **Domains** to attach
harperlinks.com.au (or whatever you've got).

---

## Things to know before you commit

**The page won't be editable in GHL's visual editor.** It's one custom-code block,
so text changes happen in the code, not by clicking on the page. That's the
trade-off for keeping the exact design. If you'd rather edit visually later, the
alternative is rebuilding the design with GHL's native elements — much slower, and
some effects (the animated glow ring, the live build panel) can't be reproduced.

**Keep editing the real source.** The master is still
`~/harperlinks-automation/public/index.html`. Change it there, then re-generate
this file — don't hand-edit the paste block or the two will drift apart.

**The contact form / socials.** The footer social icons are still inactive until
you add real URLs. If you want enquiries going into the GHL CRM, use a GHL **Form**
or **Chat Widget** element placed *below* the custom code block, rather than
building a form into the HTML — that way GHL captures it natively with no API work.

---

## Where the API token lives (you asked)

You do **not** need this for the steps above. You'd only need it if you later want
the HarperLinks Node app to push data into GHL automatically.

**Settings** (bottom-left gear) → **Private Integrations** → **Create new
Integration** → name it, tick the scopes you need (`contacts.write`,
`calendars.write`, `conversations.write`) → **Create** → copy the token.

It's shown **once only**. If you lose it you make a new one.

With that token the API is:
- Base: `https://services.leadconnectorhq.com`
- Headers: `Authorization: Bearer <token>` and `Version: 2021-07-28`
- Create/update a contact: `POST /contacts/upsert` with `locationId: "<YOUR_LOCATION_ID>"`

Give me the token and I can wire the HarperLinks bot to drop every lead and booking
straight into your GHL CRM.
