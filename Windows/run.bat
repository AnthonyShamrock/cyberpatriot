@echo off

:SetSecPol
REM GO TO SECPOL & USE SECEDIT
pause

:EnableFirewall
NetSh Advfirewall set allprofiles state on


:DisableRDP
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=No
netsh advfirewall firewall set service type = remotedesktop mode = disable
powershell.exe -Command Set-Service -Name termService -StartupType Disabled -Status Stopped

REM Disable Remote Desktop Services in Services.msc use powershell set-services


:DisablePrinters
net stop spoolers
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v LegacyDefaultPrinterMode /t REG_DWORD /d 1 /f
powershell.exe -Command Set-Service -Name spooler -StartupType Disabled -Status Stopped
pause 

:DisableUSBPorts
reg add "HHKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 4 /f

:Menu

echo 1 = Set Local User Policy
echo 2 = Enable Firwall
echo 3 = Disable RDP (Remote Desktop)
echo 4 = Disable Guest & Administrator
echo 5 = Disable Printing Services



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
