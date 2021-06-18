@echo off
@echo Clean Git cache...

git gc --aggressive --prune=now
git prune --expire now
  
echo Done