-- ==============================================================================
-- Rakesh Kumar Singh's Retirement Celebration — Supabase Database Schema
-- Run this in your Supabase Dashboard > SQL Editor.
-- ==============================================================================

-- 1. Create the primary RSVP table
create table if not exists public.retirement_rsvps (
  id bigint generated always as identity primary key,
  guest_name text not null check (char_length(trim(guest_name)) between 1 and 100),
  attendance text not null check (attendance in ('yes', 'no', 'maybe')),
  party_size integer not null default 1 check (party_size between 0 and 10),
  wish text null check (wish is null or char_length(wish) <= 600),
  created_at timestamptz not null default now()
);

-- 2. Enable Row Level Security (RLS)
alter table public.retirement_rsvps enable row level security;

-- 3. Clean up existing policies if re-running
drop policy if exists "Anyone can submit an RSVP" on public.retirement_rsvps;
drop policy if exists "Anyone can read wishes only through selected columns" on public.retirement_rsvps;
drop policy if exists "Public read disabled for RSVPs" on public.retirement_rsvps;

-- 4. INSERT-ONLY policy for public guests (unauthenticated / anon).
-- Guests can submit their RSVP, but CANNOT read, update, or delete rows.
create policy "Anyone can submit an RSVP"
on public.retirement_rsvps
for insert
to anon, authenticated
with check (
  char_length(trim(guest_name)) between 1 and 100
  and attendance in ('yes', 'no', 'maybe')
  and party_size between 0 and 10
  and (wish is null or char_length(wish) <= 600)
);

-- Note: We intentionally do NOT create a SELECT policy on retirement_rsvps for anon.
-- This guarantees that guest names, attendance choices, guest counts, and personal wishes
-- remain strictly confidential and viewable only by the family via the Supabase Dashboard.
