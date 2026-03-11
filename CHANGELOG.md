# Changelog

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
