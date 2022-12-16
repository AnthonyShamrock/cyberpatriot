@echo off

:SetSecPol
REM GO TO SECPOL & USE SECEDIT
pause

:EnableFirewall
NetSh Advfirewall set allprofiles state on
netsh advfirewall firewall set rule name="Remote Assistance (DCOM-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (PNRP-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (RA Server TCP-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (SSDP TCP-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (SSDP UDP-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (TCP-In)" new enable=no 
netsh advfirewall firewall set rule name="Telnet Server" new enable=no 
netsh advfirewall firewall set rule name="netcat" new enable=no



:RDP
set /p rdpi="Enable/Disable Remote Desktop (enable/disable)"

if %rdpi%==disable (
  reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
  reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
  netsh advfirewall firewall set rule group="remote desktop" new enable=No
  netsh advfirewall firewall set service type = remotedesktop mode = disable
  powershell.exe -Command Set-Service -Name termService -StartupType Disabled -Status Stopped
)
if%rpid%=enable (
  reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 1 /f
  reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
  netsh advfirewall firewall set rule group="remote desktop" new enable=yes
  netsh advfirewall firewall set service type = remotedesktop mode = enable
  powershell.exe -Command Set-Service -Name termService -StartupType Manual -Status Running
)
goto:Menu


REM Disable Remote Desktop Services in Services.msc use powershell set-services


:DisablePrinters
net stop spoolers
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v LegacyDefaultPrinterMode /t REG_DWORD /d 1 /f
reg ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" /v AddPrinterDrivers /t REG_DWORD /d 1 /f
powershell.exe -Command Set-Service -Name spooler -StartupType Disabled -Status Stopped
pause 

:DisableUSBPorts
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 4 /f

:EnableWindowsUpdates
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AutoInstallMinorUpdates /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DisableWindowsUpdateAccess /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v ElevateNonAdmins /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWindowsUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\Internet Communication Management\Internet Communication" /v DisableWindowsUpdateAccess /t REG_DWORD /d 0 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate /v DisableWindowsUpdateAccess /t REG_DWORD /d 0 /f

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
