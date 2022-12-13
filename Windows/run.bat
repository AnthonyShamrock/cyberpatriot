@echo off

:SetSecPol
REM GO TO SECPOL & USE SECEDIT
pause

:EnableFirewall
NetSh Advfirewall set allprofiles state on


:DisableRDP


:Menu

echo 1 = Set Local User Policy
echo 2 = enable Firwall
echo 3 = Disable RDP (Remote Desktop)
echo 4 = Disable Guest & Administrator



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
