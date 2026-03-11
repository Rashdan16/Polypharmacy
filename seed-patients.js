/**
 * seed-patients.js — One-time CSV → Supabase migration script
 *
 * Usage:
 *   1. npm install @supabase/supabase-js
 *   2. Set SUPABASE_URL and SUPABASE_SERVICE_KEY below (use service role key, not anon key)
 *   3. node seed-patients.js
 */

const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');

// ── Config ──
const SUPABASE_URL = process.env.SUPABASE_URL || 'https://YOUR_PROJECT.supabase.co';
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY || 'YOUR_SERVICE_ROLE_KEY';

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

// ── CSV Parser (RFC 4180) ──
function parseCSVLine(line) {
  const result = [];
  let current = '';
  let inQuotes = false;
  for (let i = 0; i < line.length; i++) {
    const ch = line[i];
    if (inQuotes) {
      if (ch === '"') {
        if (i + 1 < line.length && line[i + 1] === '"') { current += '"'; i++; }
        else inQuotes = false;
      } else {
        current += ch;
      }
    } else {
      if (ch === '"') inQuotes = true;
      else if (ch === ',') { result.push(current); current = ''; }
      else current += ch;
    }
  }
  result.push(current);
  return result;
}

function parseCSV(csvText) {
  const lines = csvText.trim().split('\n');
  const headers = parseCSVLine(lines[0]);
  const rows = [];
  for (let i = 1; i < lines.length; i++) {
    const cols = parseCSVLine(lines[i]);
    if (cols.length < headers.length) continue;
    const obj = {};
    headers.forEach((h, j) => { obj[h.trim()] = (cols[j] || '').trim(); });
    rows.push(obj);
  }
  return rows;
}

// ── Map CSV row to Supabase patient record ──
function mapRow(row) {
  return {
    patient_id: row.Patient_ID,
    name: null, // mock names are generated client-side
    sex: row.Sex || null,
    date_of_birth: row.Date_of_Birth || null,
    postcode_prefix: row.Postcode_Prefix || null,
    ethnicity: row.Ethnicity || null,
    long_term_conditions: row.Long_Term_Conditions || null,
    primary_diagnosis_code: row.Primary_Diagnosis_Code || null,
    secondary_diagnosis_codes: row.Secondary_Diagnosis_Codes || null,
    current_repeat_medications: row.Current_Repeat_Medications || null,
    acute_medications: row.Acute_Medications_Last_12m || null,
    allergies: row.Allergies || null,
    smoking_status: row.Smoking_Status || null,
    bmi: row.BMI ? parseFloat(row.BMI) : null,
    latest_egfr: row.Latest_eGFR ? parseFloat(row.Latest_eGFR) : null,
    latest_hba1c: row.Latest_HbA1c ? parseFloat(row.Latest_HbA1c) : null,
    weight_kg: 70,
    last_review_date: row.Last_Review_Date || null
  };
}

async function main() {
  const csvPath = path.join(__dirname, 'patients.csv');
  if (!fs.existsSync(csvPath)) {
    console.error('patients.csv not found in', __dirname);
    process.exit(1);
  }

  const csvText = fs.readFileSync(csvPath, 'utf-8');
  const rows = parseCSV(csvText);
  console.log(`Parsed ${rows.length} patients from CSV`);

  const records = rows.map(mapRow);

  // Bulk upsert in batches of 50
  const BATCH_SIZE = 50;
  let inserted = 0;
  for (let i = 0; i < records.length; i += BATCH_SIZE) {
    const batch = records.slice(i, i + BATCH_SIZE);
    const { error } = await supabase
      .from('patients')
      .upsert(batch, { onConflict: 'patient_id' });

    if (error) {
      console.error(`Error at batch starting index ${i}:`, error.message);
    } else {
      inserted += batch.length;
      console.log(`  Upserted ${inserted}/${records.length}`);
    }
  }

  console.log(`Done. ${inserted} patients seeded into Supabase.`);
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
