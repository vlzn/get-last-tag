@echo off
@echo Updating repository from remote...

git clean -df
git checkout -- .
git reset
git fetch
git pull

echo Done