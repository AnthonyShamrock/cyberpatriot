# gpedit.msc

## Window Defender

### If options are hiddens in Windows Defender
Go to: and make the options below match
  Computer Configurations > Administrative Templates > Windows Components > Window Security
  > Account Protection > Hide the Account Protection Area is  `disabled`
  - App and Browser Protection > Hide the App and broswer protection is  `disabled`
  - Device performance and health > Hide the Device performance and health area is  `disabled`
  - Device Security > Hide the Device security area is  `disabled`
  - Firewall and network protection > Hide the Firewall and network protection area is `disabled`
  - Virus and threat protection > Hide the Virus and threat protection area is `disabled`

> Computer Configurations > Administrative Templates > Windows Components > Window Defender Antivirus 
  - Make sure nothing is disabled
> Computer Configurations > Administrative Templates > Windows Components > Window Defender Antivirus > Real-time protection
  - Make sure nothing is disabled
> Computer Configurations > Administrative Templates > Windows Components > Window Defender Antivirus > Scan
  - Make sure nothing is disabled
> Computer Configurations > Administrative Templates > Windows Components > Window Defender Antivirus > Threats
  - Make sure nothing is disabled





> Admin Template > Security Center 
 Make sure turn on Security Center is not disabled
> Admin Template > Window Security
  - check every folder and make sure nothing is disabled


## Disable rollback (to older windows)
> Admin Template > Window Installer > Prohibit Rollback
 
 ## Disable Auto login
 > Admin Template > Windows Logon Options
  - Disable "Sign-in and lock last interactive user after restart" (unless says otherwise)
  - Disable "Display information about previous logons during user logon"
  - 
