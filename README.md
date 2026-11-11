# CSKAFTY socials website

A static landing page for CSKAFTY with a GitHub Pages deployment workflow and an optional Supabase-backed link editor.

## GitHub Pages
1. Open **Settings → Pages** in this repository.
2. Under **Build and deployment**, choose **GitHub Actions**.
3. The workflow in `.github/workflows/deploy.yml` deploys automatically whenever you push to `main`.
4. Your free site address will be `https://cskafty-cloud.github.io/cskafty-socials-website/`.

## Optional shared link editing (Supabase free tier)
The page displays default platform links until Supabase is configured. To enable cross-device editing:

1. Create a free Supabase project.
2. In Supabase SQL Editor, run the SQL in `supabase/schema.sql`.
3. Create an Auth user for yourself in Supabase Authentication → Users.
4. Copy the project URL and anon/public key from Project Settings → API.
5. Edit `index.html`: replace `YOUR_SUPABASE_URL` and `YOUR_SUPABASE_ANON_KEY`.
6. In the SQL editor, add your Auth user's UUID to the `site_admins` table using the example SQL at the bottom of `supabase/schema.sql`.
7. Commit the updated file. Sign in using **EDIT LINKS** on the website.

The anon key is designed to be public in a browser. Never put a Supabase service-role key in this website.

## Windows launcher
Run `windows/Launch-CSKAFTY.bat` to open the live website in Microsoft Edge app mode. It always opens the latest deployed version, so the launcher does not need rebuilding when the website changes.

## Important
- Social links currently point to the official platform homepages. Replace them in the editor with your real profile URLs.
- The website is not considered cloud-synced until Supabase setup is completed and tested.
- A custom .com domain is separate and usually requires paid registration.
