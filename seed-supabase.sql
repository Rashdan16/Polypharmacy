-- PharmAware: Seed patients + anon RLS policies
-- Run this ENTIRE script in Supabase SQL Editor

DROP POLICY IF EXISTS "anon read patients" ON patients;
CREATE POLICY "anon read patients" ON patients FOR SELECT TO anon USING (true);
DROP POLICY IF EXISTS "anon read assessments" ON assessments;
CREATE POLICY "anon read assessments" ON assessments FOR SELECT TO anon USING (true);
DROP POLICY IF EXISTS "anon write assessments" ON assessments;
CREATE POLICY "anon write assessments" ON assessments FOR INSERT TO anon WITH CHECK (true);
DROP POLICY IF EXISTS "anon write patients" ON patients;
CREATE POLICY "anon write patients" ON patients FOR INSERT TO anon WITH CHECK (true);
DROP POLICY IF EXISTS "anon update patients" ON patients;
CREATE POLICY "anon update patients" ON patients FOR UPDATE TO anon USING (true);
DROP POLICY IF EXISTS "anon write audit" ON audit_log;
CREATE POLICY "anon write audit" ON audit_log FOR INSERT TO anon WITH CHECK (true);

-- Patient data
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0001', 'F', '1943-01-01', 'AF;HF;CKD3;T2DM', 'AF', 'HF;CKD3;T2DM', 'warfarin 3 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules;furosemide 40 mg tablets;metformin 500 mg tablets;atorvastatin 40 mg tablets', NULL, 'Penicillin', 'Never', 27.0, 88, 48, '2025-01-01')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0002', 'M', '1950-02-02', 'T2DM;HYPERTENSION;OBESITY', 'T2DM', 'HYPERTENSION;OBESITY', 'metformin 1000 mg tablets;gliclazide 80 mg tablets;ramipril 10 mg capsules;amlodipine 5 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Ex-smoker', 30.0, 72, 49, '2025-02-02')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0003', 'M', '1957-03-03', 'AF;CKD4;FALLS_HX;FRAILTY', 'AF', 'CKD4;FALLS_HX;FRAILTY', 'apixaban 5 mg tablets;furosemide 80 mg tablets;bisoprolol 2.5 mg tablets;mirtazapine 15 mg tablets;prednisolone 5 mg tablets;amlodipine 10 mg tablets', NULL, NULL, 'Current', 33.0, 55, NULL, '2025-03-03')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0004', 'F', '1964-04-04', 'COPD;T2DM;CKD3', 'COPD', 'T2DM;CKD3', 'salbutamol 100 micrograms inhaler;beclometasone 200 micrograms inhaler;metformin 500 mg tablets;losartan 50 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 36.0, 45, 51, '2025-04-04')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0005', 'M', '1971-05-05', 'HF;AF;CKD3;DEPRESSION', 'HF', 'AF;CKD3;DEPRESSION', 'digoxin 125 micrograms tablets;furosemide 40 mg tablets;ramipril 5 mg capsules;bisoprolol 5 mg tablets;citalopram 20 mg tablets;spironolactone 25 mg tablets', NULL, NULL, 'Ex-smoker', 39.0, 38, NULL, '2025-05-05')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0006', 'M', '1978-06-06', 'T2DM;HYPERTENSION;CKD3;OBESITY', 'T2DM', 'HYPERTENSION;CKD3;OBESITY', 'metformin 1000 mg tablets;empagliflozin 10 mg tablets;ramipril 10 mg capsules;amlodipine 10 mg tablets;atorvastatin 40 mg tablets;indapamide 2.5 mg tablets', NULL, NULL, 'Never', 22.0, 62, 53, '2025-06-06')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0007', 'F', '1930-07-07', 'AF;STROKE;FALLS_HX', 'AF', 'STROKE;FALLS_HX', 'rivaroxaban 20 mg tablets;aspirin 75 mg tablets;amlodipine 5 mg tablets;atorvastatin 80 mg tablets;bisoprolol 2.5 mg tablets', NULL, NULL, 'Never', 25.0, 78, NULL, '2025-07-07')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0008', 'M', '1937-08-08', 'CKD4;HF;FRAILTY;DEMENTIA', 'CKD4', 'HF;FRAILTY;DEMENTIA', 'warfarin 5 mg tablets;furosemide 80 mg tablets;digoxin 62.5 micrograms tablets;mirtazapine 30 mg tablets;bisoprolol 10 mg tablets;spironolactone 50 mg tablets;ramipril 10 mg capsules;prednisolone 5 mg tablets', NULL, 'Penicillin', 'Ex-smoker', 28.0, 28, NULL, '2025-08-08')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0009', 'M', '1944-09-09', 'T2DM;DEPRESSION;ANXIETY', 'T2DM', 'DEPRESSION;ANXIETY', 'metformin 500 mg tablets;sertraline 100 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Current', 31.0, 90, 56, '2025-09-09')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0010', 'F', '1951-10-10', 'COPD;HF;CKD3', 'COPD', 'HF;CKD3', 'tiotropium 18 micrograms inhaler;salbutamol 100 micrograms inhaler;furosemide 40 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 34.0, 52, NULL, '2025-10-10')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0011', 'M', '1958-11-11', 'HYPERTENSION;T2DM', 'HYPERTENSION', 'T2DM', 'ramipril 5 mg capsules;amlodipine 5 mg tablets;metformin 500 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 37.0, 65, 58, '2025-11-11')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0012', 'M', '1965-12-12', 'AF;HF', 'AF', 'HF', 'apixaban 5 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules', NULL, 'NSAID', 'Ex-smoker', 20.0, 42, NULL, '2025-12-12')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0013', 'F', '1972-01-13', 'CKD3;HYPERTENSION;T2DM;GOUT', 'CKD3', 'HYPERTENSION;T2DM;GOUT', 'losartan 100 mg tablets;metformin 1000 mg tablets;atorvastatin 40 mg tablets;amlodipine 10 mg tablets', NULL, NULL, 'Current', 23.0, 75, 60, '2025-01-13')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0014', 'M', '1979-02-14', 'FALLS_HX;OSTEOPOROSIS;FRAILTY', 'FALLS_HX', 'OSTEOPOROSIS;FRAILTY', 'amlodipine 5 mg tablets;alfacalcidol 1 micrograms capsules;prednisolone 5 mg tablets', NULL, NULL, 'Never', 26.0, 80, NULL, '2025-02-14')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0015', 'M', '1931-03-15', 'T2DM;CKD4;AF;HF;FRAILTY', 'T2DM', 'CKD4;AF;HF;FRAILTY', 'warfarin 3 mg tablets;furosemide 80 mg tablets;bisoprolol 10 mg tablets;digoxin 125 micrograms tablets;metformin 500 mg tablets;gliclazide 40 mg tablets;ramipril 10 mg capsules;spironolactone 25 mg tablets;atorvastatin 40 mg tablets;mirtazapine 15 mg tablets', NULL, 'Penicillin', 'Ex-smoker', 29.0, 22, 62, '2025-03-15')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0016', 'F', '1938-04-16', 'COPD;ASTHMA', 'COPD', 'ASTHMA', 'salbutamol 100 micrograms inhaler;seretide 250 micrograms inhaler;montelukast 10 mg tablets', NULL, NULL, 'Never', 32.0, 95, NULL, '2025-04-16')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0017', 'M', '1945-05-17', 'HYPERTENSION;OBESITY;T2DM;CKD3', 'HYPERTENSION', 'OBESITY;T2DM;CKD3', 'metformin 1000 mg tablets;sitagliptin 100 mg tablets;ramipril 5 mg capsules;amlodipine 5 mg tablets;atorvastatin 40 mg tablets;indapamide 2.5 mg tablets;doxazosin 4 mg tablets', NULL, NULL, 'Never', 35.0, 48, 64, '2025-05-17')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0018', 'M', '1952-06-18', 'DEPRESSION;ANXIETY;FALLS_HX', 'DEPRESSION', 'ANXIETY;FALLS_HX', 'sertraline 50 mg tablets;mirtazapine 15 mg tablets;amlodipine 5 mg tablets', NULL, NULL, 'Ex-smoker', 38.0, 70, NULL, '2025-06-18')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0019', 'F', '1959-07-19', 'AF;CKD3;BLEEDING_HX', 'AF', 'CKD3;BLEEDING_HX', 'rivaroxaban 15 mg tablets;aspirin 75 mg tablets;losartan 50 mg tablets;atorvastatin 40 mg tablets', NULL, NULL, 'Current', 21.0, 35, NULL, '2025-07-19')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0020', 'M', '1966-08-20', 'HF;T2DM;CKD3;HYPERTENSION;AF', 'HF', 'T2DM;CKD3;HYPERTENSION;AF', 'sacubitril/valsartan 97 mg tablets;bisoprolol 10 mg tablets;furosemide 80 mg tablets;metformin 500 mg tablets;empagliflozin 10 mg tablets;warfarin 5 mg tablets;atorvastatin 40 mg tablets;spironolactone 50 mg tablets;gliclazide 80 mg tablets;doxazosin 4 mg tablets', NULL, NULL, 'Never', 24.0, 60, 67, '2025-08-20')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0021', 'M', '1973-09-21', 'DEMENTIA;FALLS_HX;FRAILTY;CKD3', 'DEMENTIA', 'FALLS_HX;FRAILTY;CKD3', 'mirtazapine 30 mg tablets;furosemide 40 mg tablets;bisoprolol 2.5 mg tablets;amlodipine 5 mg tablets', NULL, NULL, 'Never', 27.0, 30, NULL, '2025-09-21')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0022', 'F', '1980-10-22', 'PARKINSON;FALLS_HX;DEPRESSION', 'PARKINSON', 'FALLS_HX;DEPRESSION', 'citalopram 20 mg tablets;doxazosin 2 mg tablets;amlodipine 5 mg tablets;bisoprolol 5 mg tablets', NULL, 'Penicillin', 'Ex-smoker', 30.0, 68, NULL, '2025-10-22')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0023', 'M', '1932-11-23', 'T2DM;HYPERTENSION;CKD3;AF', 'T2DM', 'HYPERTENSION;CKD3;AF', 'apixaban 5 mg tablets;metformin 1000 mg tablets;ramipril 10 mg capsules;amlodipine 5 mg tablets;atorvastatin 40 mg tablets;indapamide 2.5 mg tablets', NULL, 'NSAID', 'Current', 33.0, 85, 70, '2025-11-23')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0024', 'M', '1939-12-24', 'COPD;HF;AF;CKD3', 'COPD', 'HF;AF;CKD3', 'tiotropium 18 micrograms inhaler;salbutamol 100 micrograms inhaler;beclometasone 200 micrograms inhaler;furosemide 40 mg tablets;digoxin 125 micrograms tablets;warfarin 3 mg tablets;bisoprolol 5 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 36.0, 58, NULL, '2025-12-24')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0025', 'F', '1946-01-25', 'STROKE;AF;HYPERTENSION;T2DM', 'STROKE', 'AF;HYPERTENSION;T2DM', 'rivaroxaban 20 mg tablets;ramipril 5 mg capsules;amlodipine 10 mg tablets;metformin 500 mg tablets;atorvastatin 80 mg tablets;aspirin 75 mg tablets', NULL, NULL, 'Ex-smoker', 39.0, 40, 72, '2025-01-25')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0026', 'M', '1953-02-26', 'CKD5;HF;AF;FRAILTY', 'CKD5', 'HF;AF;FRAILTY', 'apixaban 2.5 mg tablets;furosemide 80 mg tablets;bisoprolol 5 mg tablets;spironolactone 25 mg tablets;mirtazapine 15 mg tablets;prednisolone 5 mg tablets', NULL, NULL, 'Never', 22.0, 18, NULL, '2025-02-26')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0027', 'M', '1960-03-27', 'T2DM;OBESITY;HYPERTENSION', 'T2DM', 'OBESITY;HYPERTENSION', 'metformin 500 mg tablets;atorvastatin 20 mg tablets;ramipril 5 mg capsules', NULL, NULL, 'Never', 25.0, 74, 74, '2025-03-27')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0028', 'F', '1967-04-28', 'OSTEOPOROSIS;FALLS_HX;CKD3', 'OSTEOPOROSIS', 'FALLS_HX;CKD3', 'amlodipine 5 mg tablets;alfacalcidol 1 micrograms capsules;losartan 50 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Ex-smoker', 28.0, 82, NULL, '2025-04-28')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0029', 'M', '1974-05-01', 'HF;CKD3;AF;DEPRESSION', 'HF', 'CKD3;AF;DEPRESSION', 'apixaban 5 mg tablets;furosemide 40 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules;citalopram 20 mg tablets;spironolactone 25 mg tablets;atorvastatin 40 mg tablets', NULL, 'Penicillin', 'Current', 31.0, 56, NULL, '2025-05-01')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0030', 'M', '1981-06-02', 'COPD;T2DM;CKD3;AF', 'COPD', 'T2DM;CKD3;AF', 'tiotropium 18 micrograms inhaler;carbocisteine 750 mg capsules;salbutamol 100 micrograms inhaler;metformin 500 mg tablets;apixaban 5 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 34.0, 44, 77, '2025-06-02')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0031', 'F', '1933-07-03', 'T2DM;CKD3', 'T2DM', 'CKD3', 'metformin 500 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 37.0, 92, 48, '2025-07-03')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0032', 'M', '1940-08-04', 'AF;HYPERTENSION', 'AF', 'HYPERTENSION', 'apixaban 5 mg tablets;bisoprolol 5 mg tablets', NULL, NULL, 'Ex-smoker', 20.0, 66, NULL, '2025-08-04')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0033', 'M', '1947-09-05', 'COPD;ASTHMA;DEPRESSION', 'COPD', 'ASTHMA;DEPRESSION', 'salbutamol 100 micrograms inhaler;beclometasone 200 micrograms inhaler;citalopram 20 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Current', 23.0, 50, NULL, '2025-09-05')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0034', 'F', '1954-10-06', 'HF;T2DM;CKD4', 'HF', 'T2DM;CKD4', 'insulin glargine 100 units/ml;metformin 1000 mg tablets;furosemide 80 mg tablets;bisoprolol 10 mg tablets;ramipril 10 mg capsules;atorvastatin 40 mg tablets', NULL, 'NSAID', 'Never', 26.0, 25, 51, '2025-10-06')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0035', 'M', '1961-11-07', 'HYPERTENSION', 'HYPERTENSION', NULL, 'ramipril 5 mg capsules;amlodipine 5 mg tablets', NULL, NULL, 'Ex-smoker', 29.0, 88, NULL, '2025-11-07')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0036', 'M', '1968-12-08', 'T2DM;CKD3;HF;FRAILTY', 'T2DM', 'CKD3;HF;FRAILTY', 'warfarin 5 mg tablets;furosemide 80 mg tablets;bisoprolol 10 mg tablets;metformin 1000 mg tablets;gliclazide 80 mg tablets;ramipril 10 mg capsules;atorvastatin 40 mg tablets;spironolactone 50 mg tablets;amlodipine 10 mg tablets;doxazosin 4 mg tablets', NULL, 'Penicillin', 'Never', 32.0, 15, 53, '2025-12-08')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0037', 'F', '1975-01-09', 'GLAUCOMA;FALLS_HX;DEMENTIA', 'GLAUCOMA', 'FALLS_HX;DEMENTIA', 'mirtazapine 15 mg tablets;amlodipine 5 mg tablets;prednisolone 5 mg tablets', NULL, NULL, 'Never', 35.0, 72, NULL, '2025-01-09')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0038', 'M', '1982-02-10', 'AF;STROKE;CKD3;T2DM', 'AF', 'STROKE;CKD3;T2DM', 'rivaroxaban 20 mg tablets;aspirin 75 mg tablets;ramipril 5 mg capsules;metformin 500 mg tablets;atorvastatin 40 mg tablets;amlodipine 5 mg tablets', NULL, NULL, 'Ex-smoker', 38.0, 78, 55, '2025-02-10')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0039', 'M', '1934-03-11', 'T2DM;CKD3;DEPRESSION;ANXIETY', 'T2DM', 'CKD3;DEPRESSION;ANXIETY', 'citalopram 20 mg tablets;metformin 500 mg tablets;losartan 50 mg tablets;atorvastatin 20 mg tablets;amlodipine 5 mg tablets', NULL, NULL, 'Current', 21.0, 55, 56, '2025-03-11')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0040', 'F', '1941-04-12', 'HF;AF;CKD3;FRAILTY;FALLS_HX', 'HF', 'AF;CKD3;FRAILTY;FALLS_HX', 'apixaban 5 mg tablets;furosemide 80 mg tablets;bisoprolol 10 mg tablets;digoxin 125 micrograms tablets;spironolactone 50 mg tablets;ramipril 10 mg capsules;mirtazapine 30 mg tablets;prednisolone 5 mg tablets;atorvastatin 40 mg tablets;warfarin 3 mg tablets', NULL, NULL, 'Never', 24.0, 62, NULL, '2025-04-12')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0041', 'M', '1948-05-13', 'COPD;HF;DEPRESSION', 'COPD', 'HF;DEPRESSION', 'tiotropium 18 micrograms inhaler;salbutamol 100 micrograms inhaler;sertraline 50 mg tablets;furosemide 40 mg tablets;bisoprolol 5 mg tablets', NULL, NULL, 'Never', 27.0, 38, NULL, '2025-05-13')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0042', 'M', '1955-06-14', 'T2DM;HYPERTENSION;OBESITY;CKD3', 'T2DM', 'HYPERTENSION;OBESITY;CKD3', 'metformin 1000 mg tablets;empagliflozin 10 mg tablets;ramipril 10 mg capsules;atorvastatin 40 mg tablets;amlodipine 10 mg tablets;indapamide 2.5 mg tablets;doxazosin 4 mg tablets', NULL, NULL, 'Ex-smoker', 30.0, 45, 59, '2025-06-14')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0043', 'F', '1962-07-15', 'AF;CKD3;PEPTIC_ULCER', 'AF', 'CKD3;PEPTIC_ULCER', 'apixaban 5 mg tablets;aspirin 75 mg tablets;losartan 50 mg tablets;atorvastatin 40 mg tablets', NULL, 'Penicillin', 'Current', 33.0, 85, NULL, '2025-07-15')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0044', 'M', '1969-08-16', 'PARKINSON;DEMENTIA;FALLS_HX;FRAILTY', 'PARKINSON', 'DEMENTIA;FALLS_HX;FRAILTY', 'citalopram 20 mg tablets;doxazosin 4 mg tablets;amlodipine 5 mg tablets;mirtazapine 15 mg tablets;bisoprolol 5 mg tablets;prednisolone 5 mg tablets', NULL, NULL, 'Never', 36.0, 28, NULL, '2025-08-16')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0045', 'M', '1976-09-17', 'THROMBOCYTOPENIA;CKD3;AF', 'THROMBOCYTOPENIA', 'CKD3;AF', 'clopidogrel 75 mg tablets;losartan 50 mg tablets;atorvastatin 40 mg tablets;aspirin 75 mg tablets', NULL, 'NSAID', 'Ex-smoker', 39.0, 70, NULL, '2025-09-17')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0046', 'F', '1983-10-18', 'T2DM;CKD4;HF;AF', 'T2DM', 'CKD4;HF;AF', 'insulin aspart 100 units/ml;insulin glargine 100 units/ml;metformin 1000 mg tablets;furosemide 80 mg tablets;apixaban 5 mg tablets;bisoprolol 10 mg tablets;ramipril 10 mg capsules;atorvastatin 40 mg tablets;spironolactone 50 mg tablets', NULL, NULL, 'Never', 22.0, 20, 63, '2025-10-18')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0047', 'M', '1935-11-19', 'COPD;T2DM;HYPERTENSION', 'COPD', 'T2DM;HYPERTENSION', 'salbutamol 100 micrograms inhaler;beclometasone 200 micrograms inhaler;metformin 500 mg tablets;ramipril 5 mg capsules;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 25.0, 90, 64, '2025-11-19')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0048', 'M', '1942-12-20', 'STROKE;AF;CKD3;FALLS_HX', 'STROKE', 'AF;CKD3;FALLS_HX', 'rivaroxaban 15 mg tablets;aspirin 75 mg tablets;amlodipine 5 mg tablets;bisoprolol 5 mg tablets;atorvastatin 40 mg tablets;prednisolone 5 mg tablets', NULL, NULL, 'Ex-smoker', 28.0, 52, NULL, '2025-12-20')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0049', 'F', '1949-01-21', 'HF;CKD3;HYPERTENSION', 'HF', 'CKD3;HYPERTENSION', 'losartan 100 mg tablets;furosemide 40 mg tablets;bisoprolol 5 mg tablets;atorvastatin 40 mg tablets', NULL, NULL, 'Current', 31.0, 65, NULL, '2025-01-21')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0050', 'M', '1956-02-22', 'QT_PROLONGED_HX;AF;HF', 'QT_PROLONGED_HX', 'AF;HF', 'citalopram 40 mg tablets;bisoprolol 5 mg tablets;digoxin 125 micrograms tablets;furosemide 40 mg tablets;sacubitril/valsartan 49 mg tablets;spironolactone 25 mg tablets', NULL, 'Penicillin', 'Never', 34.0, 42, NULL, '2025-02-22')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0051', 'M', '1963-03-23', 'AF;HF;CKD3;T2DM', 'AF', 'HF;CKD3;T2DM', 'warfarin 3 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules;furosemide 40 mg tablets;metformin 500 mg tablets;atorvastatin 40 mg tablets', NULL, NULL, 'Never', 37.0, 88, 68, '2025-03-23')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0052', 'F', '1970-04-24', 'T2DM;HYPERTENSION;OBESITY', 'T2DM', 'HYPERTENSION;OBESITY', 'metformin 1000 mg tablets;gliclazide 80 mg tablets;ramipril 10 mg capsules;amlodipine 5 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Ex-smoker', 20.0, 72, 69, '2025-04-24')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0053', 'M', '1977-05-25', 'AF;CKD4;FALLS_HX;FRAILTY', 'AF', 'CKD4;FALLS_HX;FRAILTY', 'apixaban 5 mg tablets;furosemide 80 mg tablets;bisoprolol 2.5 mg tablets;mirtazapine 15 mg tablets;prednisolone 5 mg tablets;amlodipine 10 mg tablets', NULL, NULL, 'Current', 23.0, 55, NULL, '2025-05-25')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0054', 'M', '1984-06-26', 'COPD;T2DM;CKD3', 'COPD', 'T2DM;CKD3', 'salbutamol 100 micrograms inhaler;beclometasone 200 micrograms inhaler;metformin 500 mg tablets;losartan 50 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 26.0, 45, 71, '2025-06-26')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0055', 'F', '1936-07-27', 'HF;AF;CKD3;DEPRESSION', 'HF', 'AF;CKD3;DEPRESSION', 'digoxin 125 micrograms tablets;furosemide 40 mg tablets;ramipril 5 mg capsules;bisoprolol 5 mg tablets;citalopram 20 mg tablets;spironolactone 25 mg tablets', NULL, NULL, 'Ex-smoker', 29.0, 38, NULL, '2025-07-27')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0056', 'M', '1943-08-28', 'T2DM;HYPERTENSION;CKD3;OBESITY', 'T2DM', 'HYPERTENSION;CKD3;OBESITY', 'metformin 1000 mg tablets;empagliflozin 10 mg tablets;ramipril 10 mg capsules;amlodipine 10 mg tablets;atorvastatin 40 mg tablets;indapamide 2.5 mg tablets', NULL, 'NSAID', 'Never', 32.0, 62, 73, '2025-08-28')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0057', 'M', '1950-09-01', 'AF;STROKE;FALLS_HX', 'AF', 'STROKE;FALLS_HX', 'rivaroxaban 20 mg tablets;aspirin 75 mg tablets;amlodipine 5 mg tablets;atorvastatin 80 mg tablets;bisoprolol 2.5 mg tablets', NULL, 'Penicillin', 'Never', 35.0, 78, NULL, '2025-09-01')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0058', 'F', '1957-10-02', 'CKD4;HF;FRAILTY;DEMENTIA', 'CKD4', 'HF;FRAILTY;DEMENTIA', 'warfarin 5 mg tablets;furosemide 80 mg tablets;digoxin 62.5 micrograms tablets;mirtazapine 30 mg tablets;bisoprolol 10 mg tablets;spironolactone 50 mg tablets;ramipril 10 mg capsules;prednisolone 5 mg tablets', NULL, NULL, 'Ex-smoker', 38.0, 28, NULL, '2025-10-02')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0059', 'M', '1964-11-03', 'T2DM;DEPRESSION;ANXIETY', 'T2DM', 'DEPRESSION;ANXIETY', 'metformin 500 mg tablets;sertraline 100 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Current', 21.0, 90, 76, '2025-11-03')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0060', 'M', '1971-12-04', 'COPD;HF;CKD3', 'COPD', 'HF;CKD3', 'tiotropium 18 micrograms inhaler;salbutamol 100 micrograms inhaler;furosemide 40 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 24.0, 52, NULL, '2025-12-04')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0061', 'F', '1978-01-05', 'HYPERTENSION;T2DM', 'HYPERTENSION', 'T2DM', 'ramipril 5 mg capsules;amlodipine 5 mg tablets;metformin 500 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 27.0, 65, 48, '2025-01-05')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0062', 'M', '1930-02-06', 'AF;HF', 'AF', 'HF', 'apixaban 5 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules', NULL, NULL, 'Ex-smoker', 30.0, 42, NULL, '2025-02-06')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0063', 'M', '1937-03-07', 'CKD3;HYPERTENSION;T2DM;GOUT', 'CKD3', 'HYPERTENSION;T2DM;GOUT', 'losartan 100 mg tablets;metformin 1000 mg tablets;atorvastatin 40 mg tablets;amlodipine 10 mg tablets', NULL, NULL, 'Current', 33.0, 75, 50, '2025-03-07')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0064', 'F', '1944-04-08', 'FALLS_HX;OSTEOPOROSIS;FRAILTY', 'FALLS_HX', 'OSTEOPOROSIS;FRAILTY', 'amlodipine 5 mg tablets;alfacalcidol 1 micrograms capsules;prednisolone 5 mg tablets', NULL, 'Penicillin', 'Never', 36.0, 80, NULL, '2025-04-08')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0065', 'M', '1951-05-09', 'T2DM;CKD4;AF;HF;FRAILTY', 'T2DM', 'CKD4;AF;HF;FRAILTY', 'warfarin 3 mg tablets;furosemide 80 mg tablets;bisoprolol 10 mg tablets;digoxin 125 micrograms tablets;metformin 500 mg tablets;gliclazide 40 mg tablets;ramipril 10 mg capsules;spironolactone 25 mg tablets;atorvastatin 40 mg tablets;mirtazapine 15 mg tablets', NULL, NULL, 'Ex-smoker', 39.0, 22, 52, '2025-05-09')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0066', 'M', '1958-06-10', 'COPD;ASTHMA', 'COPD', 'ASTHMA', 'salbutamol 100 micrograms inhaler;seretide 250 micrograms inhaler;montelukast 10 mg tablets', NULL, NULL, 'Never', 22.0, 95, NULL, '2025-06-10')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0067', 'F', '1965-07-11', 'HYPERTENSION;OBESITY;T2DM;CKD3', 'HYPERTENSION', 'OBESITY;T2DM;CKD3', 'metformin 1000 mg tablets;sitagliptin 100 mg tablets;ramipril 5 mg capsules;amlodipine 5 mg tablets;atorvastatin 40 mg tablets;indapamide 2.5 mg tablets;doxazosin 4 mg tablets', NULL, 'NSAID', 'Never', 25.0, 48, 54, '2025-07-11')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0068', 'M', '1972-08-12', 'DEPRESSION;ANXIETY;FALLS_HX', 'DEPRESSION', 'ANXIETY;FALLS_HX', 'sertraline 50 mg tablets;mirtazapine 15 mg tablets;amlodipine 5 mg tablets', NULL, NULL, 'Ex-smoker', 28.0, 70, NULL, '2025-08-12')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0069', 'M', '1979-09-13', 'AF;CKD3;BLEEDING_HX', 'AF', 'CKD3;BLEEDING_HX', 'rivaroxaban 15 mg tablets;aspirin 75 mg tablets;losartan 50 mg tablets;atorvastatin 40 mg tablets', NULL, NULL, 'Current', 31.0, 35, NULL, '2025-09-13')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0070', 'F', '1931-10-14', 'HF;T2DM;CKD3;HYPERTENSION;AF', 'HF', 'T2DM;CKD3;HYPERTENSION;AF', 'sacubitril/valsartan 97 mg tablets;bisoprolol 10 mg tablets;furosemide 80 mg tablets;metformin 500 mg tablets;empagliflozin 10 mg tablets;warfarin 5 mg tablets;atorvastatin 40 mg tablets;spironolactone 50 mg tablets;gliclazide 80 mg tablets;doxazosin 4 mg tablets', NULL, NULL, 'Never', 34.0, 60, 57, '2025-10-14')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0071', 'M', '1938-11-15', 'DEMENTIA;FALLS_HX;FRAILTY;CKD3', 'DEMENTIA', 'FALLS_HX;FRAILTY;CKD3', 'mirtazapine 30 mg tablets;furosemide 40 mg tablets;bisoprolol 2.5 mg tablets;amlodipine 5 mg tablets', NULL, 'Penicillin', 'Never', 37.0, 30, NULL, '2025-11-15')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0072', 'M', '1945-12-16', 'PARKINSON;FALLS_HX;DEPRESSION', 'PARKINSON', 'FALLS_HX;DEPRESSION', 'citalopram 20 mg tablets;doxazosin 2 mg tablets;amlodipine 5 mg tablets;bisoprolol 5 mg tablets', NULL, NULL, 'Ex-smoker', 20.0, 68, NULL, '2025-12-16')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0073', 'F', '1952-01-17', 'T2DM;HYPERTENSION;CKD3;AF', 'T2DM', 'HYPERTENSION;CKD3;AF', 'apixaban 5 mg tablets;metformin 1000 mg tablets;ramipril 10 mg capsules;amlodipine 5 mg tablets;atorvastatin 40 mg tablets;indapamide 2.5 mg tablets', NULL, NULL, 'Current', 23.0, 85, 60, '2025-01-17')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0074', 'M', '1959-02-18', 'COPD;HF;AF;CKD3', 'COPD', 'HF;AF;CKD3', 'tiotropium 18 micrograms inhaler;salbutamol 100 micrograms inhaler;beclometasone 200 micrograms inhaler;furosemide 40 mg tablets;digoxin 125 micrograms tablets;warfarin 3 mg tablets;bisoprolol 5 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 26.0, 58, NULL, '2025-02-18')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0075', 'M', '1966-03-19', 'STROKE;AF;HYPERTENSION;T2DM', 'STROKE', 'AF;HYPERTENSION;T2DM', 'rivaroxaban 20 mg tablets;ramipril 5 mg capsules;amlodipine 10 mg tablets;metformin 500 mg tablets;atorvastatin 80 mg tablets;aspirin 75 mg tablets', NULL, NULL, 'Ex-smoker', 29.0, 40, 62, '2025-03-19')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0076', 'F', '1973-04-20', 'CKD5;HF;AF;FRAILTY', 'CKD5', 'HF;AF;FRAILTY', 'apixaban 2.5 mg tablets;furosemide 80 mg tablets;bisoprolol 5 mg tablets;spironolactone 25 mg tablets;mirtazapine 15 mg tablets;prednisolone 5 mg tablets', NULL, NULL, 'Never', 32.0, 18, NULL, '2025-04-20')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0077', 'M', '1980-05-21', 'T2DM;OBESITY;HYPERTENSION', 'T2DM', 'OBESITY;HYPERTENSION', 'metformin 500 mg tablets;atorvastatin 20 mg tablets;ramipril 5 mg capsules', NULL, NULL, 'Never', 35.0, 74, 64, '2025-05-21')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0078', 'M', '1932-06-22', 'OSTEOPOROSIS;FALLS_HX;CKD3', 'OSTEOPOROSIS', 'FALLS_HX;CKD3', 'amlodipine 5 mg tablets;alfacalcidol 1 micrograms capsules;losartan 50 mg tablets;atorvastatin 20 mg tablets', NULL, 'Penicillin', 'Ex-smoker', 38.0, 82, NULL, '2025-06-22')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0079', 'F', '1939-07-23', 'HF;CKD3;AF;DEPRESSION', 'HF', 'CKD3;AF;DEPRESSION', 'apixaban 5 mg tablets;furosemide 40 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules;citalopram 20 mg tablets;spironolactone 25 mg tablets;atorvastatin 40 mg tablets', NULL, NULL, 'Current', 21.0, 56, NULL, '2025-07-23')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0080', 'M', '1946-08-24', 'COPD;T2DM;CKD3;AF', 'COPD', 'T2DM;CKD3;AF', 'tiotropium 18 micrograms inhaler;carbocisteine 750 mg capsules;salbutamol 100 micrograms inhaler;metformin 500 mg tablets;apixaban 5 mg tablets;bisoprolol 5 mg tablets;ramipril 5 mg capsules;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 24.0, 44, 67, '2025-08-24')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0081', 'M', '1953-09-25', 'T2DM;CKD3', 'T2DM', 'CKD3', 'metformin 500 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 27.0, 92, 68, '2025-09-25')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0082', 'F', '1960-10-26', 'AF;HYPERTENSION', 'AF', 'HYPERTENSION', 'apixaban 5 mg tablets;bisoprolol 5 mg tablets', NULL, NULL, 'Ex-smoker', 30.0, 66, NULL, '2025-10-26')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0083', 'M', '1967-11-27', 'COPD;ASTHMA;DEPRESSION', 'COPD', 'ASTHMA;DEPRESSION', 'salbutamol 100 micrograms inhaler;beclometasone 200 micrograms inhaler;citalopram 20 mg tablets;atorvastatin 20 mg tablets', NULL, NULL, 'Current', 33.0, 50, NULL, '2025-11-27')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0084', 'M', '1974-12-28', 'HF;T2DM;CKD4', 'HF', 'T2DM;CKD4', 'insulin glargine 100 units/ml;metformin 1000 mg tablets;furosemide 80 mg tablets;bisoprolol 10 mg tablets;ramipril 10 mg capsules;atorvastatin 40 mg tablets', NULL, NULL, 'Never', 36.0, 25, 71, '2025-12-28')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0085', 'F', '1981-01-01', 'HYPERTENSION', 'HYPERTENSION', NULL, 'ramipril 5 mg capsules;amlodipine 5 mg tablets', NULL, 'Penicillin', 'Ex-smoker', 39.0, 88, NULL, '2025-01-01')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0086', 'M', '1933-02-02', 'T2DM;CKD3;HF;FRAILTY', 'T2DM', 'CKD3;HF;FRAILTY', 'warfarin 5 mg tablets;furosemide 80 mg tablets;bisoprolol 10 mg tablets;metformin 1000 mg tablets;gliclazide 80 mg tablets;ramipril 10 mg capsules;atorvastatin 40 mg tablets;spironolactone 50 mg tablets;amlodipine 10 mg tablets;doxazosin 4 mg tablets', NULL, NULL, 'Never', 22.0, 15, 73, '2025-02-02')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0087', 'M', '1940-03-03', 'GLAUCOMA;FALLS_HX;DEMENTIA', 'GLAUCOMA', 'FALLS_HX;DEMENTIA', 'mirtazapine 15 mg tablets;amlodipine 5 mg tablets;prednisolone 5 mg tablets', NULL, NULL, 'Never', 25.0, 72, NULL, '2025-03-03')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0088', 'F', '1947-04-04', 'AF;STROKE;CKD3;T2DM', 'AF', 'STROKE;CKD3;T2DM', 'rivaroxaban 20 mg tablets;aspirin 75 mg tablets;ramipril 5 mg capsules;metformin 500 mg tablets;atorvastatin 40 mg tablets;amlodipine 5 mg tablets', NULL, NULL, 'Ex-smoker', 28.0, 78, 75, '2025-04-04')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0089', 'M', '1954-05-05', 'T2DM;CKD3;DEPRESSION;ANXIETY', 'T2DM', 'CKD3;DEPRESSION;ANXIETY', 'citalopram 20 mg tablets;metformin 500 mg tablets;losartan 50 mg tablets;atorvastatin 20 mg tablets;amlodipine 5 mg tablets', NULL, 'NSAID', 'Current', 31.0, 55, 76, '2025-05-05')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0090', 'M', '1961-06-06', 'HF;AF;CKD3;FRAILTY;FALLS_HX', 'HF', 'AF;CKD3;FRAILTY;FALLS_HX', 'apixaban 5 mg tablets;furosemide 80 mg tablets;bisoprolol 10 mg tablets;digoxin 125 micrograms tablets;spironolactone 50 mg tablets;ramipril 10 mg capsules;mirtazapine 30 mg tablets;prednisolone 5 mg tablets;atorvastatin 40 mg tablets;warfarin 3 mg tablets', NULL, NULL, 'Never', 34.0, 62, NULL, '2025-06-06')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0091', 'F', '1968-07-07', 'COPD;HF;DEPRESSION', 'COPD', 'HF;DEPRESSION', 'tiotropium 18 micrograms inhaler;salbutamol 100 micrograms inhaler;sertraline 50 mg tablets;furosemide 40 mg tablets;bisoprolol 5 mg tablets', NULL, NULL, 'Never', 37.0, 38, NULL, '2025-07-07')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0092', 'M', '1975-08-08', 'T2DM;HYPERTENSION;OBESITY;CKD3', 'T2DM', 'HYPERTENSION;OBESITY;CKD3', 'metformin 1000 mg tablets;empagliflozin 10 mg tablets;ramipril 10 mg capsules;atorvastatin 40 mg tablets;amlodipine 10 mg tablets;indapamide 2.5 mg tablets;doxazosin 4 mg tablets', NULL, 'Penicillin', 'Ex-smoker', 20.0, 45, 49, '2025-08-08')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0093', 'M', '1982-09-09', 'AF;CKD3;PEPTIC_ULCER', 'AF', 'CKD3;PEPTIC_ULCER', 'apixaban 5 mg tablets;aspirin 75 mg tablets;losartan 50 mg tablets;atorvastatin 40 mg tablets', NULL, NULL, 'Current', 23.0, 85, NULL, '2025-09-09')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0094', 'F', '1934-10-10', 'PARKINSON;DEMENTIA;FALLS_HX;FRAILTY', 'PARKINSON', 'DEMENTIA;FALLS_HX;FRAILTY', 'citalopram 20 mg tablets;doxazosin 4 mg tablets;amlodipine 5 mg tablets;mirtazapine 15 mg tablets;bisoprolol 5 mg tablets;prednisolone 5 mg tablets', NULL, NULL, 'Never', 26.0, 28, NULL, '2025-10-10')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0095', 'M', '1941-11-11', 'THROMBOCYTOPENIA;CKD3;AF', 'THROMBOCYTOPENIA', 'CKD3;AF', 'clopidogrel 75 mg tablets;losartan 50 mg tablets;atorvastatin 40 mg tablets;aspirin 75 mg tablets', NULL, NULL, 'Ex-smoker', 29.0, 70, NULL, '2025-11-11')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0096', 'M', '1948-12-12', 'T2DM;CKD4;HF;AF', 'T2DM', 'CKD4;HF;AF', 'insulin aspart 100 units/ml;insulin glargine 100 units/ml;metformin 1000 mg tablets;furosemide 80 mg tablets;apixaban 5 mg tablets;bisoprolol 10 mg tablets;ramipril 10 mg capsules;atorvastatin 40 mg tablets;spironolactone 50 mg tablets', NULL, NULL, 'Never', 32.0, 20, 53, '2025-12-12')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0097', 'F', '1955-01-13', 'COPD;T2DM;HYPERTENSION', 'COPD', 'T2DM;HYPERTENSION', 'salbutamol 100 micrograms inhaler;beclometasone 200 micrograms inhaler;metformin 500 mg tablets;ramipril 5 mg capsules;atorvastatin 20 mg tablets', NULL, NULL, 'Never', 35.0, 90, 54, '2025-01-13')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0098', 'M', '1962-02-14', 'STROKE;AF;CKD3;FALLS_HX', 'STROKE', 'AF;CKD3;FALLS_HX', 'rivaroxaban 15 mg tablets;aspirin 75 mg tablets;amlodipine 5 mg tablets;bisoprolol 5 mg tablets;atorvastatin 40 mg tablets;prednisolone 5 mg tablets', NULL, NULL, 'Ex-smoker', 38.0, 52, NULL, '2025-02-14')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0099', 'M', '1969-03-15', 'HF;CKD3;HYPERTENSION', 'HF', 'CKD3;HYPERTENSION', 'losartan 100 mg tablets;furosemide 40 mg tablets;bisoprolol 5 mg tablets;atorvastatin 40 mg tablets', NULL, 'Penicillin', 'Current', 21.0, 65, NULL, '2025-03-15')
ON CONFLICT (patient_id) DO NOTHING;
INSERT INTO patients (patient_id, sex, date_of_birth, long_term_conditions, primary_diagnosis_code, secondary_diagnosis_codes, current_repeat_medications, acute_medications, allergies, smoking_status, bmi, latest_egfr, latest_hba1c, last_review_date)
VALUES ('P0100', 'F', '1976-04-16', 'QT_PROLONGED_HX;AF;HF', 'QT_PROLONGED_HX', 'AF;HF', 'citalopram 40 mg tablets;bisoprolol 5 mg tablets;digoxin 125 micrograms tablets;furosemide 40 mg tablets;sacubitril/valsartan 49 mg tablets;spironolactone 25 mg tablets', NULL, 'NSAID', 'Never', 24.0, 42, NULL, '2025-04-16')
ON CONFLICT (patient_id) DO NOTHING;

-- Verify: SELECT count(*) FROM patients;

-- ═══════════════════════════════════════════
-- Mock assessments for P0001 and P0002
-- ═══════════════════════════════════════════

-- P0001: 82F, AF;HF;CKD3;T2DM, on warfarin/bisoprolol/ramipril/furosemide/metformin/atorvastatin, eGFR 88
INSERT INTO assessments (patient_id, clinician_email, assessed_at, age, sex, egfr, weight_kg, diagnoses, medications, overall_score, risk_band, domain_scores, drug_details, top_offenders)
VALUES (
  'P0001',
  'dr.patel@nhs.net',
  '2026-02-15 10:30:00+00',
  83, 'F', 88, 68,
  ARRAY['AF','HF','CKD3','T2DM'],
  '[{"name":"warfarin","dose":"3 mg"},{"name":"bisoprolol","dose":"5 mg"},{"name":"ramipril","dose":"5 mg"},{"name":"furosemide","dose":"40 mg"},{"name":"metformin","dose":"500 mg"},{"name":"atorvastatin","dose":"40 mg"}]'::jsonb,
  5.82,
  'MODERATE',
  '{"fall":5.3,"bleed":6.7,"acb":0.3,"qt":1.7,"frailty":4.5,"renal":6.4}'::jsonb,
  '[{"drug":"warfarin","fall":1,"bleed":3,"acb":0,"qt":0,"frailty":1,"renal":1},{"drug":"bisoprolol","fall":1,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":1},{"drug":"ramipril","fall":1,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":2},{"drug":"furosemide","fall":2,"bleed":0,"acb":0,"qt":1,"frailty":1,"renal":2},{"drug":"metformin","fall":0,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":3},{"drug":"atorvastatin","fall":0,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":0}]'::jsonb,
  '[{"drug":"warfarin","domain":"bleed","score":3},{"drug":"metformin","domain":"renal","score":3},{"drug":"furosemide","domain":"fall","score":2}]'::jsonb
);

INSERT INTO assessments (patient_id, clinician_email, assessed_at, age, sex, egfr, weight_kg, diagnoses, medications, overall_score, risk_band, domain_scores, drug_details, top_offenders)
VALUES (
  'P0001',
  'pharmacist.jones@nhs.net',
  '2025-09-20 14:15:00+00',
  82, 'F', 90, 69,
  ARRAY['AF','HF','CKD3','T2DM'],
  '[{"name":"warfarin","dose":"3 mg"},{"name":"bisoprolol","dose":"5 mg"},{"name":"ramipril","dose":"5 mg"},{"name":"furosemide","dose":"40 mg"},{"name":"metformin","dose":"500 mg"},{"name":"atorvastatin","dose":"40 mg"}]'::jsonb,
  5.45,
  'MODERATE',
  '{"fall":4.9,"bleed":6.3,"acb":0.3,"qt":1.7,"frailty":4.0,"renal":5.5}'::jsonb,
  '[{"drug":"warfarin","fall":1,"bleed":3,"acb":0,"qt":0,"frailty":1,"renal":1},{"drug":"bisoprolol","fall":1,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":1},{"drug":"ramipril","fall":1,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":2},{"drug":"furosemide","fall":2,"bleed":0,"acb":0,"qt":1,"frailty":1,"renal":2},{"drug":"metformin","fall":0,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":3},{"drug":"atorvastatin","fall":0,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":0}]'::jsonb,
  '[{"drug":"warfarin","domain":"bleed","score":3},{"drug":"metformin","domain":"renal","score":3},{"drug":"furosemide","domain":"fall","score":2}]'::jsonb
);

-- P0002: 76M, T2DM;HYPERTENSION;OBESITY, on metformin/gliclazide/ramipril/amlodipine/atorvastatin, eGFR 72


-- Verify: SELECT count(*) FROM assessments;INSERT INTO assessments (patient_id, clinician_email, assessed_at, age, sex, egfr, weight_kg, diagnoses, medications, overall_score, risk_band, domain_scores, drug_details, top_offenders)
VALUES (
  'P0002',
  'dr.patel@nhs.net',
  '2026-01-22 09:45:00+00',
  76, 'M', 72, 92,
  ARRAY['T2DM','HYPERTENSION','OBESITY'],
  '[{"name":"metformin","dose":"1000 mg"},{"name":"gliclazide","dose":"80 mg"},{"name":"ramipril","dose":"10 mg"},{"name":"amlodipine","dose":"5 mg"},{"name":"atorvastatin","dose":"20 mg"}]'::jsonb,
  3.28,
  'MODERATE',
  '{"fall":3.5,"bleed":0.8,"acb":0.3,"qt":0.4,"frailty":2.3,"renal":5.3}'::jsonb,
  '[{"drug":"metformin","fall":0,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":3},{"drug":"gliclazide","fall":1,"bleed":0,"acb":0,"qt":0,"frailty":1,"renal":2},{"drug":"ramipril","fall":1,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":2},{"drug":"amlodipine","fall":2,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":0},{"drug":"atorvastatin","fall":0,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":0}]'::jsonb,
  '[{"drug":"metformin","domain":"renal","score":3},{"drug":"amlodipine","domain":"fall","score":2},{"drug":"gliclazide","domain":"renal","score":2}]'::jsonb
);

INSERT INTO assessments (patient_id, clinician_email, assessed_at, age, sex, egfr, weight_kg, diagnoses, medications, overall_score, risk_band, domain_scores, drug_details, top_offenders)
VALUES (
  'P0002',
  'pharmacist.jones@nhs.net',
  '2025-08-10 11:00:00+00',
  75, 'M', 75, 94,
  ARRAY['T2DM','HYPERTENSION','OBESITY'],
  '[{"name":"metformin","dose":"1000 mg"},{"name":"gliclazide","dose":"80 mg"},{"name":"ramipril","dose":"10 mg"},{"name":"amlodipine","dose":"5 mg"},{"name":"atorvastatin","dose":"20 mg"}]'::jsonb,
  3.02,
  'MODERATE',
  '{"fall":3.1,"bleed":0.8,"acb":0.3,"qt":0.4,"frailty":2.0,"renal":4.8}'::jsonb,
  '[{"drug":"metformin","fall":0,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":3},{"drug":"gliclazide","fall":1,"bleed":0,"acb":0,"qt":0,"frailty":1,"renal":2},{"drug":"ramipril","fall":1,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":2},{"drug":"amlodipine","fall":2,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":0},{"drug":"atorvastatin","fall":0,"bleed":0,"acb":0,"qt":0,"frailty":0,"renal":0}]'::jsonb,
  '[{"drug":"metformin","domain":"renal","score":3},{"drug":"amlodipine","domain":"fall","score":2},{"drug":"gliclazide","domain":"renal","score":2}]'::jsonb
);