git add .
echo "Enter Commit Message:\n"
set/p message
git commit -m "%message%"
git push