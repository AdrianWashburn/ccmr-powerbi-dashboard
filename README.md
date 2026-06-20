# CCMR Pathway Navigator for Power BI

A Power BI-ready package for a Texas high school campus to identify CCMR status, closest pathway, skill gaps, CTE progress, counselor actions, and next best actions. Download the repo, double-click `START_HERE.bat`, connect the project to the `powerbi_source/` folder, then save the project as a `.pbix` in Power BI Desktop.

Reference alignment: design is configuration-driven for the TEA 2027 accountability manual and local updates. District staff should verify final cut scores/rules against the official accountability manual before production.

## Intended users
Campus administrators, counselors, teachers, testing coordinators, CTE coordinators, district accountability/data staff, and curriculum leaders.

## Quick start
1. Download this repository from GitHub.
2. On Windows, double-click `START_HERE.bat`.
3. Wait for Power BI Desktop to open the package.
4. In Power BI Desktop, connect the queries to the `powerbi_source/` folder in this repo.
5. In Power BI Desktop, choose `File` > `Save As` and save the project as `ccmr-powerbi-dashboard.pbix`.
6. Select `Refresh`.

In short: download the repo, double-click `START_HERE.bat`, connect to `powerbi_source/`, save the PBIX, and refresh.

## TMDL source
The semantic model also has a TMDL source folder at `ccmr-powerbi-dashboard.SemanticModel/definition/` for imported model definitions, tables, relationships, and roles.

## Templates and sample data
`templates/` contains upload templates with headers and 10-25 synthetic rows. `sample_data/` contains larger internally consistent synthetic data: 100 students, 300 assessments, 400 transcripts, 200 skill records, 60 CTE records, 35 IBC records, 55 counselor notes, and 65 interventions.

## Parameters and refresh
Use `pDataFolder` so the same PBIX can switch between the `powerbi_source/` folder, campus exports, and district production extracts. Keep `LocalStudentID` as text.

## Known limitations
This package is not legal/accountability certification. TEA rules and district coding practices must be validated annually. Notes entry requires Power Apps/SharePoint or Dataverse because Power BI is not an operational writeback database.

## Next steps
Validate rules, map SIS exports to templates, pilot with one counselor caseload, add RLS, publish, schedule refresh, then iterate toward a template app or embedded product.
