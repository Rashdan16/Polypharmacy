# Changelog

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
