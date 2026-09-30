# Changelog

## [2026-09-30] - Add demo patient record PDF
- Added a 2-page A4 PDF record for demo patient P0001 (Margaret Thompson), built from the existing demo data in `index.html` and `seed-supabase.sql`
- Contents: patient details, clinical measurements, long-term conditions, repeat medications, latest risk assessment with domain scores, per-drug contributions, top risk drivers and assessment history
- Every page is watermarked "DEMO DATA" and has a footer saying the record is fictitious
- Generated with Python `reportlab`
- Files affected: `Demo_Patient_Record_P0001.pdf` (new), `CHANGELOG.md`

## [2026-09-30] - Prefill demo login credentials
- Clinician form now opens with `clinician@nhs.demo` / `Demo1234!` already filled in, and the patient form with `P0001` / `Patient1!`, so you only need to click Sign In or Access My Record
- Files affected: `index.html`, `CHANGELOG.md`

## [2026-03-12] - Add Assessment Timeline to clinician results panel
- Added an "Assessment Timeline" card at the bottom of the clinician results panel showing historical risk assessments
- Each timeline entry displays: date/time, reviewing clinician, overall score with colour-coded risk band, and domain score chips (Fall Risk, Bleed Risk, ACB, QT Risk, Frailty, Renal Risk)
- Hardcoded mock assessment history for P0001 (2 assessments) and P0002 (2 assessments)
- Also fetches from Supabase if available, overriding mock data
- Timeline styled with vertical line, coloured dots, and a "LATEST" badge on the most recent entry
- Dark mode and high contrast support included
- Files affected: `polyrisk.html`, `CHANGELOG.md`

## [2026-03-12] - Reorder clinician results panel cards
- New order: Patient Summary → Overall Risk Assessment → Spider Chart/Domains/Drugs → Patient Complaints
- Files affected: `polyrisk.html`, `CHANGELOG.md`

## [2026-03-12] - Fix login card header symmetry
- Set a consistent `min-height: 200px` on both login card headers so the clinician (blue) and patient (teal) headers are the same height
- Added flexbox centering to vertically align header content in both cards
- Files affected: `index.html`, `CHANGELOG.md`

## [2026-03-12] - Add Patient Complaints & Symptoms table to clinician portal
- Added structured "Patient Complaints & Recorded Symptoms" card on the clinician results panel with a proper table (Date, Time, Complaint, Severity, Recorded By)
- Hardcoded clinical complaint data for demo patients P0001 (5 complaints) and P0002 (3 complaints) matching the medical record format
- Updated both AI prompts (text and image) to extract complaints/symptoms from imported documents, so complaints from any patient record PDF/image are automatically displayed
- AI-extracted complaints take priority, then hardcoded demo data, then patient portal self-reported notes
- Severity values are colour-coded: green for Mild, orange for Moderate, red for Severe
- Styled with NHS blue table header, alternating row colours, and dark mode / high contrast support
- Files affected: `polyrisk.html`, `CHANGELOG.md`

## [2026-03-12] - Add accessibility options to login page
- Added dark mode, high contrast, and font size (A− / A+) buttons to the top bar on the login page, matching the patient portal
- Dark mode and high contrast CSS rules added for all login page elements (cards, inputs, forms, footer, demo hints)
- Uses the same `pp_dark`, `pp_contrast`, `pp_fontsize` localStorage keys so preferences persist when navigating between login and portal
- Files affected: `index.html`, `CHANGELOG.md`

## [2026-03-12] - Enlarge and bold Patient Notes text and Emergency 999 button
- Increased font sizes and added bold weight across the notes section: textarea, save button, saved message, timestamp, and description text
- Emergency 999 button enlarged from 68px to 100px diameter, with bigger phone icon (2rem) and number text (1.3rem), plus larger label
- Mobile breakpoint also scaled up accordingly
- Files affected: `patient-portal.html`, `CHANGELOG.md`

## [2026-03-12] - Add Patient Notes section and Emergency 999 button
- Added "My Notes" card on the Medications tab, placed below Long-Term Conditions, allowing patients to write and save personal notes (symptoms, questions for GP, side effects, etc.)
- Notes are persisted in localStorage per patient ID with a timestamp showing when last saved
- Added a fixed "Call 999" emergency button on the right side of the viewport — tapping/clicking it initiates a phone call to 999
- Styled with a red circular button, phone icon, and "Emergency" label; responsive for mobile
- Files affected: `patient-portal.html`, `CHANGELOG.md`

## [2026-03-12] - Add AI Symptom Checker to Medications tab
- Added a new "Symptom Checker" card on the Medications tab where patients can describe their symptoms
- AI (GPT-4o-mini via OpenAI API) analyses the symptoms against the patient's current repeat medications and suggests which ones may be relevant
- Includes loading spinner, error handling, and a disclaimer that this is not a diagnosis
- Designed to help patients prepare information for their next clinician visit
- Files affected: `patient-portal.html`, `CHANGELOG.md`

## [2026-03-12] - Hardcode patient logins with passwords for P0001 and P0002
- Added password field to the patient login form
- Added `PATIENT_USERS` object with hardcoded credentials and full patient data for P0001 and P0002
- P0001: Margaret Thompson — ID `P0001` / password `Patient1!`
- P0002: David Okafor — ID `P0002` / password `Patient2!`
- Login checks hardcoded credentials first; wrong password shows "Incorrect password" error
- Other patient IDs still fall through to Supabase then CSV fallback (no password required)
- Demo hint on login card updated to show both sets of credentials
- Files affected: `index.html`, `CHANGELOG.md`

## [2026-03-12] - Hardcode mock assessments for P0001 and P0002
- Assessment history for P0001 and P0002 is now hardcoded in `patient-portal.html` as a fallback so the Assessment History tab always shows data for these demo patients
- Supabase is still queried first — if real assessments exist in the DB they take priority; hardcoded data is only used if Supabase returns nothing
- P0001: 2 assessments (Feb 2026 + Sep 2025, both MODERATE ~5.5, dr.patel & pharmacist.jones)
- P0002: 2 assessments (Jan 2026 + Aug 2025, both MODERATE ~3.1, dr.patel & pharmacist.jones)
- Files affected: `patient-portal.html`, `CHANGELOG.md`

## [2026-03-11] - Add mock assessments for P0001 and P0002
- Added 4 mock assessment INSERT statements to `seed-supabase.sql` (2 per patient)
- **P0001** (83F, AF/HF/CKD3/T2DM, 6 meds): scores 5.82 MODERATE (Feb 2026, dr.patel) and 5.45 MODERATE (Sep 2025, pharmacist.jones). Key risks: bleed 6.7 (warfarin), renal 6.4 (metformin+furosemide), fall 5.3
- **P0002** (76M, T2DM/HYPERTENSION/OBESITY, 5 meds): scores 3.28 MODERATE (Jan 2026, dr.patel) and 3.02 MODERATE (Aug 2025, pharmacist.jones). Key risks: renal 5.3 (metformin+gliclazide), fall 3.5 (amlodipine)
- Domain scores, drug details, and top offenders all populated based on the actual risk engine logic
- Files affected: `seed-supabase.sql`, `CHANGELOG.md`

## [2026-03-11] - Remove Overview tab, make Medication Schedule the default
- Removed the Overview tab button and its panel (contacts card) entirely
- Medication Schedule is now the first and default active tab on page load
- Files affected: `patient-portal.html`, `CHANGELOG.md`

## [2026-03-11] - Add Medication Schedule tab & remove risk data from Patient Portal
- **Removed** from Overview tab: score card (risk gauge), domain breakdown grid, overview-grid layout, "Understanding your risk score" advice banner, and all related JS (`calcRiskFromPatient()`, `DRUG_DB`, `HIST_MOD`, `DOMAIN_RAW_MAX`). Overview now shows only the contacts card.
- **Added** new "Medication Schedule" tab between Overview and Medications with:
  - First Dose Time Setter — patient can anchor their schedule to a custom start time, persisted to localStorage per patient ID. All times shift by the offset from 08:00 default.
  - Next Dose Banner — teal gradient card showing next medication, time, instruction, and a live countdown (updates every 60s). Handles "all doses passed" → shows tomorrow's first dose.
  - Adherence Summary Strip — 4-stat grid: daily medications, times per day, weekly doses, adherence rate (placeholder).
  - Google Calendar-style weekly timetable — CSS Grid (60px time col + 7 day cols), hours 06:00–22:00, colour-coded medication event chips with hover effects. Day/Week toggle, Today button, arrow navigation.
  - Day View — larger event cards with instruction notes.
  - Legend — colour dots for each medication.
  - PRN section — "As-Needed Medications" card for drugs like salbutamol.
  - Schedule advice banner.
- **Schedule engine**: `SCHEDULE_DB` maps 28 common drugs to time slots (morning/evening/twice/three/prn) with NHS guidance notes. `DEFAULT_TIME_MAP` defines base hours. Offset logic shifts all times when patient sets a custom first dose.
- **Colour coding**: 8-colour rotating palette (blue, teal, amber, red, purple, green, indigo, pink) with dark mode and high contrast overrides.
- Assessment History tab still renders clinician-saved assessments from Supabase; shows "No clinician assessments on record yet" if none exist (no auto-calc fallback).
- All existing features preserved: dark mode, high contrast, font controls, Supabase integration, medications tab, profile tab.
- Files affected: `patient-portal.html`, `CHANGELOG.md`

## [2026-03-11] - Fix layout overflow at large font sizes in clinician portal
- Left sidebar changed from fixed `340px` to `minmax(300px, 360px)` so it can shrink with large fonts
- Added `min-width: 0` to layout children to prevent grid blowout
- Patient details form grid changed from rigid `1fr 1fr` to `repeat(auto-fit, minmax(120px, 1fr))` so fields wrap gracefully instead of overflowing
- Files affected: `polyrisk.html`

## [2026-03-11] - Bump font size to 20px + patient portal accessibility controls
- Increased base font size to 20px across all three pages (index.html, polyrisk.html, patient-portal.html)
- Added accessibility toolbar to patient portal header: dark mode (🌙), high contrast (◑), font decrease (A−), font increase (A+)
- Preferences persist across sessions via localStorage (keys: pp_dark, pp_contrast, pp_fontsize)
- Font size range clamped to 14–28px; dark mode and high contrast use CSS class overrides on body
- Files affected: `index.html`, `polyrisk.html`, `patient-portal.html`

## [2026-03-11] - Auto-calculate Risk Score in Patient Portal
- Patient portal now auto-calculates risk score and domain breakdown from the patient's own data (medications, conditions, age, eGFR) when no clinician-saved assessments exist
- Added full risk engine (DRUG_DB, HIST_MOD, DOMAIN_RAW_MAX, `calcRiskFromPatient()`) to `patient-portal.html`, mirroring the algorithm in `polyrisk.html`
- Score card shows "Auto-calculated from your current medications" instead of clinician name
- Assessment History tab shows message explaining the auto-calculation
- If clinician-saved assessments exist in Supabase, those take priority
- Files affected: `patient-portal.html`, `CHANGELOG.md`

## [2026-03-11] - Fix Patient Login (CSV Fallback + DB Seed Script)
- Root cause: `patients` table in Supabase was empty AND anon RLS policies were missing
- Patient login now tries Supabase first, falls back to `patients.csv` if DB is empty/unavailable
- Added CSV parser (`findPatientInCSV`, `parseCSVLine`) to `index.html` for the fallback
- Generated `seed-supabase.sql`: combined anon RLS policies + 100 patient INSERT statements from CSV
- Removed password field from patient login — only Patient ID is needed
- Files affected: `index.html`, `seed-supabase.sql` (new), `CHANGELOG.md`

## [2026-03-11] - Fix Patient Login (ID Lookup, No Auth Required)
- Removed Supabase Auth from patient login entirely — was causing "stuck on signing in" due to email confirmation requirement
- Patient login now queries the `patients` table directly by Patient ID using the anon read policy
- Full patient record is stored in sessionStorage on login; patient portal uses it directly
- Removed password field from patient login form — only Patient ID needed
- Patient portal only fetches assessment history from Supabase (patient data comes from sessionStorage)
- Patient logout no longer calls `supabase.auth.signOut()`
- Login details: just enter a valid Patient ID (e.g. P0001) — no password required
- Files affected: `index.html`, `patient-portal.html`, `CHANGELOG.md`

## [2026-03-11] - Fix Patient Login (Auto-create Supabase Account)
- Patient login now auto-creates a Supabase Auth account on first use if the account doesn't exist
- Flow: try `signInWithPassword` → if "Invalid login credentials", try `signUp` → then redirect
- Removed hardcoded demo credentials hint from patient card; replaced with usage instructions
- Files affected: `index.html`, `CHANGELOG.md`

## [2026-03-10] - Split Auth: Hardcoded Clinician, Supabase Patient
- Clinician login restored to hardcoded demo credentials (`clinician@nhs.demo` / `Demo1234!`, `admin@nhs.demo` / `Demo1234!`) — no Supabase Auth for clinicians
- Patient login now uses Supabase Auth (`signInWithPassword`) with derived email format `{patientId.toLowerCase()}@pharmaware.nhs`
- `polyrisk.html` uses sessionStorage auth guard only; all DB operations use the anon key (requires anon RLS policies)
- Patient portal logout calls `supabase.auth.signOut()`
- `supabase-schema.sql` updated: added anon write policies for `assessments`, `patients`, `audit_log` to support the demo clinician portal
- Files affected: `index.html`, `polyrisk.html`, `patient-portal.html`, `supabase-schema.sql`, `CHANGELOG.md`

## [2026-03-10] - Re-integrate Supabase Backend
- Restored full Supabase integration across all three pages after demo-mode removal
- **`index.html`**: Clinician login/register now uses `supabase.auth.signInWithPassword` / `signUp`; auto-redirect checks Supabase session
- **`polyrisk.html`**: Patients loaded from `patients` table (CSV fallback if offline); `saveAssessment()` inserts to `assessments` table; `showHistory()` queries assessments with modal; `savePatient()` upserts to `patients` table; `auditLog()` inserts to `audit_log`; `logout()` calls `supabase.auth.signOut()`; Supabase session verified on page load
- **`patient-portal.html`**: Fetches patient record and assessment history from Supabase; falls back to sessionStorage if unavailable
- **`supabase-schema.sql`**: Added anon read policies for `patients` and `assessments` tables (required for patient portal — no Supabase Auth for patients)
- Patient login remains demo credentials (P0001/patient123) — patients use anon key to read data
- Files affected: `index.html`, `polyrisk.html`, `patient-portal.html`, `supabase-schema.sql`, `CHANGELOG.md`

## [2026-03-10] - Remove Supabase Dependency (Demo Mode)
- Removed all Supabase dependencies from the app — no backend required
- **Authentication**: Hardcoded demo credentials (no Supabase Auth)
  - Clinician: `clinician@nhs.demo` / `Demo1234!` (also works for `admin@nhs.demo`)
  - Patient: `P0001` / `patient123` (also works for P0002, P0003)
- **Clinician App** (`polyrisk.html`): Patients loaded from CSV file instead of database; save assessment/history/create patient show demo messages
- **Patient Portal** (`patient-portal.html`): Shows patient info from session storage; assessment history disabled
- **Logout**: Uses sessionStorage instead of Supabase auth.signOut()
- Files affected: `index.html`, `polyrisk.html`, `patient-portal.html`

## [2026-03-10] - Simplify Patient Login
- Replaced Date of Birth picker + Supabase lookup with a simple Patient ID + password form
- Auth is now handled client-side against hardcoded demo credentials — no backend required
- Demo: Patient ID `P0001` / Password `patient123` (also works for P0002, P0003)
- Files affected: `index.html`

## [2026-03-10] - Patient Portal Redesign
- Complete redesign of `patient-portal.html` into a tabbed, dashboard-style interface
- Hero banner with patient name greeting and sticky teal header
- **Overview tab**: prominent latest risk score gauge, 6-domain tile breakdown with colour-coded bars, contacts panel, and plain-English advice section
- **Medications tab**: medication cards grid with parsed drug name/dose, long-term conditions chips
- **Assessment History tab**: chronological timeline with dot indicators, per-domain pill breakdown, latest badge
- **My Profile tab**: full patient details grid, advice on updating records
- Files affected: `patient-portal.html`

## [2026-03-10] - Patient Login & Portal
- Added patient login card side-by-side with the clinician card on `index.html`
- Patient authenticates with Patient ID + Date of Birth (looked up against Supabase `patients` table)
- Demo credentials shown for both portals: Clinician (`clinician@nhs.demo` / `Demo1234!`), Patient (`P0001` / `1943-01-01`)
- New `patient-portal.html`: shows patient profile, long-term conditions, repeat medications, and full assessment history (read-only)
- Files affected: `index.html`, `patient-portal.html` (new), `CHANGELOG.md`

## [2026-03-10] - Supabase Database Integration
- Replaced client-side CSV loading and sessionStorage auth with full Supabase backend
- **Login page (`index.html`)**: Now uses Supabase Auth (email/password) with registration support; removed hardcoded demo users
- **Main app (`polyrisk.html`)**: Patients loaded from Supabase `patients` table; auth guard uses Supabase session; user email shown in header
- **Save Assessment**: New button in risk card saves assessment results (scores, drugs, domains) to `assessments` table
- **Assessment History**: New History button in patient summary fetches and displays past assessments in a modal; clicking loads historical results
- **Create/Edit Patient**: New Patient button enables form creation mode with Save Patient to upsert into database
- **Audit Logging**: All key actions (login, logout, run_assessment, save_assessment, create_patient, ai_import) logged to `audit_log` table
- **New files**: `supabase-schema.sql` (DDL + RLS policies), `seed-patients.js` (CSV migration script)
- **Updated**: `config.js` (added `SUPABASE_URL` + `SUPABASE_ANON_KEY`)
- Files affected: `index.html`, `polyrisk.html`, `config.js`, `supabase-schema.sql` (new), `seed-patients.js` (new), `CHANGELOG.md`

## [2026-03-10] - Add liability disclaimer at page bottom
- Added a disclaimer at the bottom of both index.html (in the existing footer) and polyrisk.html (new footer element)
- Disclaimer states PharmAware is not liable for damages, adverse outcomes, or loss of life, and that the tool is for clinical decision support only
- Files affected: index.html, polyrisk.html

## [2026-03-10] - Add AI Document Import card
- New card between Patient Search and Patient Details with drag-and-drop zone for PDFs and images
- Uses OpenAI GPT-4o Vision to extract: name, NHS number, age, sex, eGFR, weight, diagnoses, medications
- PDF.js converts PDF pages to canvas images before sending to OpenAI (API doesn't accept raw PDFs)
- API key stored in sessionStorage; restored on page reload; status indicator shows progress and errors
- On success, auto-populates all form fields and runs risk assessment
- Files affected: `polyrisk.html`

## [2026-03-09] - Replace PolyRisk badge with PharmAware SVG logo
- Replaced text badge with inline SVG recreation of PharmAware logo (circular arrows icon + styled text)
- Logo is transparent — renders cleanly on any background
- Updated in: main app header, login page top bar, login card header
- Files affected: `polyrisk.html`, `index.html`

## [2026-03-09] - Add login page and auth guard
- Created `index.html` login page with NHS branding, matching the main app's design
- Demo credentials shown on page: `nhs.admin / PolyRisk2026`
- Uses `sessionStorage` to persist auth state; redirects to login if unauthenticated
- Added auth guard script at top of `polyrisk.html` to block direct URL access
- Added username display and Sign Out button to the main app header
- Files affected: `index.html` (new), `polyrisk.html`

## [2026-03-09] - Initial PolyRisk NHS Polypharmacy Risk Assessment Tool
- Built complete single-page clinical decision support tool (`polyrisk.html`)
- Generated 100 synthetic NHS patient records (`patients.csv`)
- Implemented 6-domain risk scoring engine (Fall, Bleed, ACB, QT, Frailty, Renal)
- Features: patient search with autocomplete, tag-based diagnosis input, medication table with datalist, Plotly radar chart, domain score grid, drug attribution table
- NHS-branded UI with responsive two-column layout
- Files: `polyrisk.html`, `patients.csv`, `CHANGELOG.md`
