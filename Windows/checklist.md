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

- Minimum password length: 8 characters

- Minimum password age: 5 days
- Maximum password age: 30-90 days

- Enforce password history: 5 passwords
- Passwords must meet complexity requirements? Yes
- Store password using reversible encryption for all users in the domain? Disable

- For Administrator account: Enforce password history: 9 passwords
- For Administrator account: Maximum password age: 14 days
- Number of times a password can be reused: 3 

## Disable rollback (to older windows)
> Admin Template > Window Installer > Prohibit Rollback
 
## Auto login
*Depends on readme.txt*

### 1) `gpedit.msc`
 > Admin Template > Windows Logon Options
  - Disable "Sign-in and lock last interactive user after restart" (unless says otherwise)
  - Disable "Display information about previous logons during user logon"
 
###2) `regedit.msc`
> HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
- Delete `DefaultUserName` (Right click on value and press delete)
- Change `AutoAdminLogon` to `0` (`1` == enabled)
- Delete `DefaultUserName` (Right click on value and press delete)
*To add or re-enable, right click then press `New > String Value`, Value Name the title and Value data is information*

###3) `netplwiz`
*Press `Window key + R`, then type `"netplwiz"`*
Select username and make sure `"Users must enter a user name and password to use this computer"` checked (uncheck == user automatically logs on)
