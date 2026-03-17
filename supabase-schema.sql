-- ── USERS PROFILE
-- Auto-created saat user register, linked ke auth.users
create table public.profiles (
  id uuid references auth.users(id) on delete cascade primary key,
  first_name text,
  last_name text,
  email text,
  plan text default 'free', -- 'free' | 'premium'
  plan_expires_at timestamptz default (now() + interval '1 month'),
  created_at timestamptz default now()
);

-- Auto-create profile saat user register
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, email, first_name)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'first_name', '')
  );
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- ── INVITATIONS
create table public.invitations (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references public.profiles(id) on delete cascade not null,
  slug text unique not null,
  status text default 'draft', -- 'draft' | 'active' | 'expired'
  template text default 'modern',
  data jsonb default '{}', -- semua data undangan
  view_count integer default 0,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Auto-update updated_at
create or replace function update_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger invitations_updated_at
  before update on public.invitations
  for each row execute procedure update_updated_at();

-- ── RSVP
create table public.rsvp (
  id uuid default gen_random_uuid() primary key,
  invitation_id uuid references public.invitations(id) on delete cascade not null,
  name text not null,
  attendance text not null, -- 'hadir' | 'tidak'
  guest_count integer default 1,
  created_at timestamptz default now()
);

-- ── GUESTBOOK
create table public.guestbook (
  id uuid default gen_random_uuid() primary key,
  invitation_id uuid references public.invitations(id) on delete cascade not null,
  name text not null,
  message text not null,
  created_at timestamptz default now()
);

-- ── RLS (Row Level Security)
alter table public.profiles enable row level security;
alter table public.invitations enable row level security;
alter table public.rsvp enable row level security;
alter table public.guestbook enable row level security;

-- Profiles: user hanya bisa lihat & edit profil sendiri
create policy "Users can view own profile"
  on public.profiles for select using (auth.uid() = id);
create policy "Users can update own profile"
  on public.profiles for update using (auth.uid() = id);

-- Invitations: user hanya bisa CRUD undangan sendiri
create policy "Users can view own invitations"
  on public.invitations for select using (auth.uid() = user_id);
create policy "Users can insert own invitations"
  on public.invitations for insert with check (auth.uid() = user_id);
create policy "Users can update own invitations"
  on public.invitations for update using (auth.uid() = user_id);
create policy "Users can delete own invitations"
  on public.invitations for delete using (auth.uid() = user_id);

-- Public bisa lihat undangan yang active (untuk halaman undangan)
create policy "Public can view active invitations"
  on public.invitations for select using (status = 'active');

-- RSVP: siapa saja bisa insert, owner bisa lihat semua
create policy "Anyone can submit rsvp"
  on public.rsvp for insert with check (true);
create policy "Invitation owner can view rsvp"
  on public.rsvp for select using (
    exists (
      select 1 from public.invitations
      where id = invitation_id and user_id = auth.uid()
    )
  );

-- Guestbook: siapa saja bisa insert & lihat
create policy "Anyone can submit guestbook"
  on public.guestbook for insert with check (true);
create policy "Anyone can view guestbook"
  on public.guestbook for select using (true);
