-- Line Check AI: contact form leads table
-- Paste into Supabase > SQL Editor > New query, then click Run.

create table if not exists public.leads (
  id          bigint generated always as identity primary key,
  created_at  timestamptz not null default now(),
  name        text not null,
  restaurant  text,
  email       text not null,
  locations   text,
  message     text,
  status      text not null default 'new'
);

-- Lock the table down: the public website can ADD leads but never read them.
alter table public.leads enable row level security;

create policy "Website can submit leads"
  on public.leads
  for insert
  to anon
  with check (true);

-- No select/update/delete policies for anon = visitors can't see anyone's data.
-- You can still view every lead in Supabase > Table Editor > leads.
