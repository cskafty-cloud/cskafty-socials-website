# CSKAFTY socials website

A static landing page for CSKAFTY with GitHub Pages deployment and an optional Supabase-backed link editor.

## GitHub Pages
1. The repository deploys automatically from `main` using **GitHub Actions**.
2. Live site: https://cskafty-cloud.github.io/cskafty-socials-website/
3. Deployment status: https://github.com/cskafty-cloud/cskafty-socials-website/actions

## Supabase admin and shared link editing
The website is configured for this Supabase project:
- Project URL: `https://tedzxxvufktzspkxxfpv.supabase.co`
- REST API: `https://tedzxxvufktzspkxxfpv.supabase.co/rest/v1/`
- Admin email: `cskafty@gmail.com`
- Admin Auth user ID: `5b0a297c-247d-4211-873f-77b8a5ea2be1`

The Supabase Auth user has already been created. To configure the database and grant this user admin rights:

1. Open the [Supabase SQL Editor](https://supabase.com/dashboard/project/tedzxxvufktzspkxxfpv/sql/new).
2. Run the complete contents of `supabase/schema.sql`. It creates the link table, enables Row Level Security, installs the public-read/admin-write policies, seeds default links, and adds the existing Auth user above to `site_admins`.
3. Open the [Supabase Auth users page](https://supabase.com/dashboard/project/tedzxxvufktzspkxxfpv/auth/users) and confirm that the user ID matches the ID above and the email is `cskafty@gmail.com`.
4. Visit the live site. Sign in using the email and the password set in Supabase Auth. Visitors can select **CONTINUE AS VISITOR** without an account.

The browser uses only the Supabase publishable key. Never put a service-role key or a password in this repository. Password verification is handled by Supabase Auth.

## Windows launcher
Run `windows/Launch-CSKAFTY.bat` to open the live website in Microsoft Edge app mode.

## Important
- Replace the default platform homepages with your actual profile URLs in the admin editor.
- Shared cross-device saving is enabled only after the SQL has been run successfully and tested.
- A custom .com domain is separate and usually requires paid registration.
