# Rakesh Kumar Singh — Retirement Celebration Invitation

An elegant, mobile-first digital retirement invitation featuring a realistic 3D keepsake envelope opening, ambient botanical petals, subtle gold light particles, smooth scroll-triggered reveals, interactive calendar download, directions, sound toggle, and a secure RSVP system.

---

## 1. Event Details

- **Honouree:** Rakesh Kumar Singh
- **Designation:** DGM at District Cooperative Bank
- **Celebration Date:** 6 January 2027
- **Time:** 6:30 PM IST
- **Venue:** Muzaffarnagar, Uttar Pradesh
- **Host:** The Singh family

---

## 2. Key Interactive & Motion Features

1. **Cinematic 3D Layered Envelope Experience:**
   - Multi-layered envelope with CSS 3D transforms (`perspective: 1200px`).
   - Realistic pocket folds and top flap rotating in 3D.
   - Refined royal sage & gold wax seal with specular shimmer and subtle breathing glow.
   - Keepsake invitation card rises smoothly from inside the envelope pocket upon opening.
   - Golden sparkle burst on card reveal.
   - "Open Invitation" and "Skip to invitation" options with keyboard and touch support.
   - Guarded against repeated clicks to prevent animation glitches.

2. **Refined Ambient Animations:**
   - Floating botanical petals (champagne gold & soft sage leaves) with gentle 3D sway.
   - Slow-drifting gold dust particles rendered via lightweight HTML5 Canvas.
   - Soft background light gradients moving with GPU-accelerated transforms.
   - Subtle shimmer sweep across hero card borders and buttons.

3. **Performance & Stability:**
   - Scroll-triggered reveals driven by `IntersectionObserver` with single-trigger unobserve.
   - Countdown timer digits use `font-variant-numeric: tabular-nums` and fixed min-widths to prevent horizontal layout shift.
   - Full support for `prefers-reduced-motion: reduce`: instantly displays the complete invitation with all decorative motion disabled.
   - `<noscript>` fallback guarantees content readability without JavaScript.

4. **Gentle Instrumental Background Music:**
   - Sound toggle button located in the header.
   - Off by default (never autoplays).
   - Generates a calming, meditative ambient Indian classical harmonic drone (tanpura chord & delicate acoustic chimes) directly in the browser via the Web Audio API. Requires zero external audio downloads, never fails due to network or copyright issues, and fades in/out gracefully.

5. **Celebration & Direction:**
   - Direct link to Google Maps directions for Muzaffarnagar, Uttar Pradesh.
   - Gold & champagne flutter confetti upon verified RSVP confirmation.

---

## 3. Preview Locally

You can preview the invitation directly in your browser:

### Option A: Double-Click
Double-click `index.html` to open it in Chrome, Safari, Edge, or Firefox.

### Option B: Local HTTP Server (Recommended)
Using Python:
```bash
python -m http.server 8000
```
Then visit `http://localhost:8000` in your browser.

Using Node.js:
```bash
npx serve .
```

---

## 4. Enable Secure RSVP Storage (Supabase)

The invitation is equipped with a secure Supabase integration. When unconfigured, the RSVP form safely operates in **Preview Mode** (explaining that storage is pending without simulating fake database successes).

### Step 1: Create a Supabase Project
1. Log in or create a free account at [https://supabase.com](https://supabase.com).
2. Create a new project (e.g. `rakesh-singh-retirement`).

### Step 2: Run the Database Schema
1. In your Supabase Dashboard, go to **SQL Editor** > **New Query**.
2. Copy and paste the contents of `supabase-schema.sql`.
3. Click **Run**.

This script sets up:
- The `retirement_rsvps` table storing `guest_name`, `attendance`, `party_size`, `wish`, and `created_at`.
- **Row Level Security (RLS)** with an **INSERT-ONLY** policy for unauthenticated guests (`anon`).
- **Privacy Protection:** Public guests cannot perform `SELECT`, `UPDATE`, or `DELETE`. Private RSVP data, guest counts, and personal wishes remain strictly confidential and viewable only by the family in the Supabase Dashboard.

### Step 3: Configure Credentials (Two Simple Options)
1. In your Supabase Dashboard, go to **Project Settings** > **API**.
2. Copy your **Project URL** and the **anon / public** API key.

#### Option A: Using `env.js` (Recommended)
Open `env.js` in your text editor and paste your credentials:
```javascript
window.__ENV__ = {
  SUPABASE_URL: 'https://your-project-id.supabase.co',
  SUPABASE_ANON_KEY: 'your-anon-publishable-key-here'
};
```

#### Option B: Pasting directly in `index.html`
Alternatively, you can open `index.html` and paste the keys directly:
```javascript
const SUPABASE_URL = 'https://your-project-id.supabase.co';
const SUPABASE_ANON_KEY = 'your-anon-publishable-key-here';
```

> **Security Notice:** Only use your public/anon key. **Never put your `service_role` secret key or database password in client-side code**.

---

## 5. Deployment Guide

### Deploy via Netlify Drop (Fastest — No Git Required)
1. Visit [https://app.netlify.com/drop](https://app.netlify.com/drop).
2. Drag and drop this project directory.
3. Your website will be deployed to a live HTTPS URL within seconds.

### Deploy via GitHub + Vercel / Netlify
1. Create a GitHub repository and push these project files.
2. Link the repository to [Vercel](https://vercel.com) or [Netlify](https://netlify.com).
3. The build command can remain empty, and the output directory is the root.

---

## 6. Pre-Share Verification Checklist

Before sharing the link on WhatsApp with family and friends:
- [ ] Open the live HTTPS URL on mobile devices (iOS and Android).
- [ ] Tap **Open Invitation** to verify the 3D envelope fold, wax seal fade, and keepsake card rise.
- [ ] Test the **Kindly RSVP** form with a test entry:
  - If Supabase is connected, verify that the submission saves in the Supabase table and triggers the gold confetti and personalised thank-you message.
  - If Supabase is not connected, verify that the preview message appears cleanly.
- [ ] Tap **Get Directions** to confirm it opens Google Maps for Muzaffarnagar.
- [ ] Tap the **Music** button to test the soothing ambient drone.
- [ ] Check accessibility with keyboard navigation (Tab, Enter, Space) and screen readers.
