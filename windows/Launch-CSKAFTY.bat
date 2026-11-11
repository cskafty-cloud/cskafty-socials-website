@echo off
setlocal
set "SITE=https://cskafty-cloud.github.io/cskafty-socials-website/"
where msedge >nul 2>nul
if %errorlevel%==0 (
  start "" msedge --app="%SITE%"
) else (
  start "" "%SITE%"
)
endlocal
