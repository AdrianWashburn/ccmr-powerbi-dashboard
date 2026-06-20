# CCMR Pathway Navigator for Power BI

A Power BI-ready package for a Texas high school campus to identify CCMR status, closest pathway, skill gaps, CTE progress, counselor actions, and next best actions. It uses synthetic data only and is designed for assembly in Power BI Desktop; no `.pbix` is generated because Desktop automation is not available in this Linux environment.

Reference alignment: design is configuration-driven for the TEA 2027 accountability manual and local updates. District staff should verify final cut scores/rules against the official accountability manual before production.

## Intended users
Campus administrators, counselors, teachers, testing coordinators, CTE coordinators, district accountability/data staff, and curriculum leaders.

## Quick start
1. Open Power BI Desktop.
2. Create text parameter `pDataFolder` pointing to this repo's `sample_data/` folder with a trailing slash.
3. For each file in `power_query/`, create a blank query, paste the M script, and name it using the model guide.
4. Load the tables, create relationships from `model/table_relationships.md`, and add calculated columns from `model/calculated_columns.md`.
5. Create a Measures table and paste DAX from `dax/`.
6. Build pages using `report_layout/`.
7. Configure notes using SharePoint Lists for pilots or Dataverse for scale.

## Templates and sample data
`templates/` contains upload templates with headers and 10-25 synthetic rows. `sample_data/` contains larger internally consistent synthetic data: 100 students, 300 assessments, 400 transcripts, 200 skill records, 60 CTE records, 35 IBC records, 55 counselor notes, and 65 interventions.

## Parameters and refresh
Use `pDataFolder` so the same PBIX can switch between sample data, campus exports, and district production extracts. Keep `LocalStudentID` as text.

## Known limitations
This package is not legal/accountability certification. TEA rules and district coding practices must be validated annually. Notes entry requires Power Apps/SharePoint or Dataverse because Power BI is not an operational writeback database.

## Next steps
Validate rules, map SIS exports to templates, pilot with one counselor caseload, add RLS, publish, schedule refresh, then iterate toward a template app or embedded product.
