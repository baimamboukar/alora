@REM commit all files one by one
@REM git add .
 for file in $(git ls-files --others --exclude-standard); do
   git add $file
   git commit -m "add $file ✅"
   git push
 done