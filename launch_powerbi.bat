@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "PBIP_FILE=%SCRIPT_DIR%ccmr-powerbi-dashboard.pbip"
set "PBIX_FILE=%SCRIPT_DIR%ccmr-powerbi-dashboard.pbix"
set "PBI_DESKTOP_EXE="

if exist "%ProgramFiles%\Microsoft Power BI Desktop\bin\PBIDesktop.exe" set "PBI_DESKTOP_EXE=%ProgramFiles%\Microsoft Power BI Desktop\bin\PBIDesktop.exe"
if not defined PBI_DESKTOP_EXE if exist "%ProgramFiles(x86)%\Microsoft Power BI Desktop\bin\PBIDesktop.exe" set "PBI_DESKTOP_EXE=%ProgramFiles(x86)%\Microsoft Power BI Desktop\bin\PBIDesktop.exe"
if not defined PBI_DESKTOP_EXE for /f "delims=" %%A in ('where /r "%ProgramFiles%" PBIDesktop.exe 2^>nul') do if not defined PBI_DESKTOP_EXE set "PBI_DESKTOP_EXE=%%A"
if not defined PBI_DESKTOP_EXE for /f "delims=" %%A in ('where /r "%ProgramFiles(x86)%" PBIDesktop.exe 2^>nul') do if not defined PBI_DESKTOP_EXE set "PBI_DESKTOP_EXE=%%A"

echo CCMR Pathway Navigator for Power BI
echo.
echo 1. Power BI Desktop will open first if it is installed.
echo 2. If it does not open automatically, open:
echo    %PBIP_FILE%
echo 3. In Power BI Desktop, choose File ^> Save As.
echo 4. Save the project as:
echo    %PBIX_FILE%
echo 5. Connect the queries to the powerbi_source folder and refresh.
echo.
if defined PBI_DESKTOP_EXE (
  start "" "%PBI_DESKTOP_EXE%" "%PBIP_FILE%"
) else if exist "%PBIP_FILE%" (
  start "" "%PBIP_FILE%"
) else (
  echo Could not find the PBIP file at %PBIP_FILE%
)

endlocal
