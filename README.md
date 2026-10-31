# Line Check AI — Landing Page

Static one-page site. Contact form saves leads to Supabase.

```
index.html            the whole site
images/               headshot, FOX31 and service photos
supabase-leads.sql    creates the leads table (run once in Supabase)
```

## 1. Supabase (5 min)

1. Open your Supabase project (your existing one is fine, or create a new one).
2. **SQL Editor → New query** → paste everything from `supabase-leads.sql` → **Run**.
3. **Project Settings → API**. Copy:
   - **Project URL** (looks like `https://abcd1234.supabase.co`)
   - **anon public** key (the long one labeled `anon` / `public`, NOT `service_role`)
4. Open `index.html`, scroll to the bottom, and paste them into:
   ```js
   const SUPABASE_URL = "https://YOUR-PROJECT-ID.supabase.co";
   const SUPABASE_ANON_KEY = "YOUR-ANON-PUBLIC-KEY";
   ```
   The anon key is safe in a public page because the table only allows inserts.
   Never put the `service_role` key in this file.

## 2. GitHub (3 min)

1. github.com → **New repository** → name it `line-check-ai` → Create.
2. **Add file → Upload files** → drag in `index.html`, the `images` folder,
   and this README → **Commit changes**.

## 3. Hosting (5 min)

**If you pay for Vercel Pro (for The Line):**
Vercel → **Add New → Project** → import `line-check-ai` → Framework preset:
**Other** → **Deploy**.

**If you're on Vercel's free Hobby plan** (business sites aren't allowed there),
use Cloudflare Pages instead:
dash.cloudflare.com → **Workers & Pages → Create → Pages → Connect to Git** →
pick `line-check-ai` → leave build command blank, output directory `/` →
**Save and Deploy**.

Either way, every future change you push to GitHub goes live automatically.

## 4. Domain

In your host's project → **Domains / Custom domains** → add either:
- `ai.oldfashionedhospitality.com` (free — add the CNAME record it shows you
  wherever oldfashionedhospitality.com's DNS lives), or
- a new domain like `linecheckai.com` (~$10–15/yr; buy it right inside
  Cloudflare or Vercel and it connects automatically).

## 5. Test

Open the live site, submit the form with your own info, then check
**Supabase → Table Editor → leads**. You should see the row.

Optional: get emailed on each new lead with a Supabase Database Webhook
(Database → Webhooks) or a simple Zapier/Make zap watching the table.
