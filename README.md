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
4. The current site is already configured with this project's Supabase URL and browser publishable key. The publishable key is safe to expose in a browser; never use a service-role key.
5. Create the admin Auth user with email `cskafty@gmail.com` in Authentication → Users. Set or reset its password in Supabase; passwords are verified by Supabase Auth and are never stored in this repository.
6. In the SQL editor, run the admin-membership SQL below after the Auth user exists:

```sql
do $
declare admin_id uuid;
begin
  select id into admin_id from auth.users where lower(email) = lower('cskafty@gmail.com');
  if admin_id is null then raise exception 'Create the Supabase Auth user first.'; end if;
  insert into public.site_admins (user_id) values (admin_id) on conflict (user_id) do nothing;
end $;
```

7. The first screen offers admin sign-in or **CONTINUE AS VISITOR**. Admin sign-in is restricted to `cskafty@gmail.com`; visitors do not need an account.

The anon key is designed to be public in a browser. Never put a Supabase service-role key in this website.

## Windows launcher
Run `windows/Launch-CSKAFTY.bat` to open the live website in Microsoft Edge app mode. It always opens the latest deployed version, so the launcher does not need rebuilding when the website changes.

## Important
- Social links currently point to the official platform homepages. Replace them in the editor with your real profile URLs.
- The website is not considered cloud-synced until Supabase setup is completed and tested.
- A custom .com domain is separate and usually requires paid registration.
