@echo off

:SetSecPol
REM GO TO SECPOL & USE SECEDIT
pause

:Menu

echo 1 = Set Local User Policy

:ConfirmBeforeStart
set /p i="Did you complete the forensic (y/n)"

if %i% ==y (
  :Menu
)

if %i% ==n (
  echo OPERATION CANCELLED!
  exit
) 

else (
  echo Please try again, input must be lowercase!
  :ConfirmBeforeStart
)


:ConfirmBeforeStart
