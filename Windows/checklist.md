## Window Updates Disabled?
1) Go to `gpedit.msc` then
> Computer Configurations > Administrative Templates > Windows Components > Windows Update > Allow Configure Automatic Updates
Change to Enabled

2) Go to `regedit.msc` then 
> HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows 
Check for folder named `"WindowsUpdate"` > `"AU"`
Check for:
- `"NoAutoUpdate"` if found change to `0`(You will need to restart computer)
- `"AUOptions"` if found change to `3` (You will need to restart)


## Window Defender
1) Go to `gpedit.msc` then
> Computer Configurations > Administrative Templates > Windows Components > Window Security
Change following
  - Account Protection > Hide the Account Protection Area to  `disabled`
  - App and Browser Protection > Hide the App and broswer protection to  `disabled`
  - Device performance and health > Hide the Device performance and health area to  `disabled`
  - Device Security > Hide the Device security area to `disabled`
  - Firewall and network protection > Hide the Firewall and network protection area to `disabled`
  - Virus and threat protection > Hide the Virus and threat protection area to `disabled`

2) Go to `regedit.msc` then 
> HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender
- Change `"DisableAntiSpyware"` to `0` (`1` == disabled)
> Real-time protection
- Change `"DisableAntiSpyware"` to `0` (`1` == disabled)


## Passwords 
Go to `secpol.msc` then to Security Settings > Account Policies > 

## Disable rollback (to older windows)
> Admin Template > Window Installer > Prohibit Rollback
 
 ## Disable Auto login
 > Admin Template > Windows Logon Options
  - Disable "Sign-in and lock last interactive user after restart" (unless says otherwise)
  - Disable "Display information about previous logons during user logon"
  - 
