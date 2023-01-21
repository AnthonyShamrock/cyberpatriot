## Window Updates Disabled?
### 1) `gpedit.msc`
> Computer Configurations > Administrative Templates > Windows Components > Windows Update
- Change `"Allow Configure Automatic Updates"` to `Not configured`

### 2) `regedit.msc` 
> HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows 
Check for folder named `"WindowsUpdate"` > `"AU"`
- If found `"NoAutoUpdate"` change to `0` (You will need to restart computer)
- If found `"AUOptions"` change to `3` (You will need to restart)


## Window Defender
### 1) `gpedit.msc`
> Computer Configurations > Administrative Templates > Windows Components > Window Security > Account Protection
- Change `"Hide the Account Protection Area"` to `disabled`
> Computer Configurations > Administrative Templates > Windows Components > Window Security > Account Protection
- Change `"Hide the Account Protection Area"` to  `disabled`
> Computer Configurations > Administrative Templates > Windows Components > Window Security > App and Browser Protection
- Change `"Hide the App and broswer protection"` to  `disabled`
> Computer Configurations > Administrative Templates > Windows Components > Window Security > Device performance and health
- Change `"Hide the Device performance and health area"` to  `disabled`
> Computer Configurations > Administrative Templates > Windows Components > Window Security > Device Security 
- Change `"Hide the Device security area"` to `disabled`
> Computer Configurations > Administrative Templates > Windows Components > Window Security > Firewall and network protection
- Change `"Hide the Firewall and network protection area"` to `disabled`
> Computer Configurations > Administrative Templates > Windows Components > Window Security > Virus and threat protection 
- Change `"Hide the Virus and threat protection area"` to `disabled`

### 2) `regedit.msc`
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
