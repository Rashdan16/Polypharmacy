-- ============================================================
-- PharmAware / PolyRisk — Supabase Database Schema
-- Run this in your Supabase SQL Editor to set up all tables.
-- ============================================================

-- Table: patients
create table patients (
  id uuid default gen_random_uuid() primary key,
  patient_id text unique not null,
  name text,
  sex text check (sex in ('M','F')),
  date_of_birth date,
  postcode_prefix text,
  ethnicity text,
  long_term_conditions text,
  primary_diagnosis_code text,
  secondary_diagnosis_codes text,
  current_repeat_medications text,
  acute_medications text,
  allergies text,
  smoking_status text,
  bmi numeric,
  latest_egfr numeric,
  latest_hba1c numeric,
  weight_kg numeric default 70,
  last_review_date date,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  created_by uuid references auth.users(id)
);

-- Table: assessments
create table assessments (
  id uuid default gen_random_uuid() primary key,
  patient_id text not null references patients(patient_id),
  clinician_id uuid references auth.users(id),
  clinician_email text,
  assessed_at timestamptz default now(),
  age int,
  sex text,
  egfr numeric,
  weight_kg numeric,
  diagnoses text[],
  medications jsonb,
  overall_score numeric,
  risk_band text,
  domain_scores jsonb,
  drug_details jsonb,
  top_offenders jsonb
);

-- Table: audit_log
create table audit_log (
  id bigint generated always as identity primary key,
  user_id uuid references auth.users(id),
  user_email text,
  action text not null,
  detail jsonb,
  created_at timestamptz default now()
);

-- Row Level Security
alter table patients enable row level security;
alter table assessments enable row level security;
alter table audit_log enable row level security;

-- All authenticated users can read all patients and assessments
create policy "auth read patients" on patients for select to authenticated using (true);
create policy "auth read assessments" on assessments for select to authenticated using (true);
create policy "auth read audit" on audit_log for select to authenticated using (true);

-- Authenticated users can insert/update patients
create policy "auth write patients" on patients for insert to authenticated with check (true);
create policy "auth update patients" on patients for update to authenticated using (true);

-- Authenticated users can insert assessments and audit entries
create policy "auth write assessments" on assessments for insert to authenticated with check (true);
create policy "auth write audit" on audit_log for insert to authenticated with check (true);

-- Anonymous access for demo clinician portal (no Supabase Auth for clinicians)
-- and patient portal reads
create policy "anon read patients"      on patients    for select to anon using (true);
create policy "anon read assessments"   on assessments for select to anon using (true);
create policy "anon write assessments"  on assessments for insert to anon with check (true);
create policy "anon write patients"     on patients    for insert to anon with check (true);
create policy "anon update patients"    on patients    for update to anon using (true);
create policy "anon write audit"        on audit_log   for insert to anon with check (true);
