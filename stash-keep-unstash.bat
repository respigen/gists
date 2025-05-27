@echo off
for /f "tokens=1-4 delims=/- " %%a in ('echo %date%') do set timestamp=%%a %%b %%c 
git stash push -m "%timestamp%"
git stash show -p stash@{0} | git apply
