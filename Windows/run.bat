@echo off

echo List users & admins

:ConfirmBeforeStart
set /p i="Did you complete the forensic (y/n)"

if %i% ==y (
echo START
)

if %i% ==n (
echo cancel
) 

else (
  echo Please try again, input must be lowercase!
  :ConfirmBeforeStart
)


:ConfirmBeforeStart
