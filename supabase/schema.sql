create table if not exists public.site_settings (
  id integer primary key check (id = 1),
  links jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);
create table if not exists public.site_admins (
  user_id uuid primary key references auth.users(id) on delete cascade
);
alter table public.site_settings enable row level security;
alter table public.site_admins enable row level security;
create policy "Public can read site links" on public.site_settings
  for select using (true);
create policy "Admins can insert site links" on public.site_settings
  for insert to authenticated with check (
    exists (select 1 from public.site_admins where user_id = auth.uid())
  );
create policy "Admins can update site links" on public.site_settings
  for update to authenticated using (
    exists (select 1 from public.site_admins where user_id = auth.uid())
  ) with check (
    exists (select 1 from public.site_admins where user_id = auth.uid())
  );
insert into public.site_settings (id, links) values (1, '[
 {"name":"Twitch","url":"https://www.twitch.tv/","note":"LIVE STREAMS"},
 {"name":"Kick","url":"https://kick.com/","note":"LIVE STREAMS"},
 {"name":"YouTube","url":"https://www.youtube.com/","note":"VIDEOS"},
 {"name":"Spotify","url":"https://open.spotify.com/","note":"LISTEN"},
 {"name":"SoundCloud","url":"https://soundcloud.com/","note":"MUSIC"},
 {"name":"TikTok","url":"https://www.tiktok.com/","note":"SHORTS"},
 {"name":"Instagram","url":"https://www.instagram.com/","note":"PHOTOS"},
 {"name":"Discord","url":"https://discord.com/","note":"COMMUNITY"},
 {"name":"Facebook","url":"https://www.facebook.com/","note":"COMMUNITY"},
 {"name":"X","url":"https://x.com/","note":"UPDATES"}
]'::jsonb) on conflict (id) do nothing;

-- After creating your Supabase Auth user, replace USER_UUID with that user's UUID:
-- insert into public.site_admins (user_id) values ('USER_UUID');
