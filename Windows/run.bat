@echo off

echo List users & admins

set /p %i%="Continue test (y/n)"

if %i% ==y (
echo START
)

if %i% ==n (
echo cancel
) 
