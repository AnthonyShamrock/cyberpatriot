$path=Split-Path .\users.txt
$get= Get-content $path/path.txt
$accounts = Get-Wmiobject Win32_UserAccount -filter 'LocalAccount=TRUE' | select-object -expandproperty Name
Clear-content "$get\users.txt"
foreach($l in $accounts){
	$l >> "$get\users.txt"
}
REM May need to add split path
$getUsers = Get-content .\Userlist.txt

