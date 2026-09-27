@echo off
setlocal
set "PORT=8095"
set "DIR=%~dp0"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "if (-not (Get-NetTCPConnection -LocalPort %PORT% -State Listen -ErrorAction SilentlyContinue)) {" ^
  "  Start-Process powershell.exe -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-File','%DIR%serve.ps1','-Port','%PORT%' -WindowStyle Hidden;" ^
  "  Start-Sleep -Seconds 2 }" ^
  "Start-Process ('http://localhost:%PORT%/')"

endlocal
