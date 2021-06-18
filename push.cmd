@echo off
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set mydate=%%a/%%b/%%c)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a:%%b)

echo Pushing changes to remote reporistory

git pull

:commit_message

set text=""
set /p text="Commit Message: "

if ["%text%"] == [""] goto no_text

set msg="COMMIT %mydate% %mytime%: %text%"
echo %msg%

git add --all

echo File added, begin commit (message %msg%)
git commit -m %msg%

echo Committed, begin pushing...
git push -u origin main

goto done

:no_text
echo Please insert Commit Message!
goto commit_message

:done
echo Done