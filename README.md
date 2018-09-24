# brochuremaker

remove brochure.zip file from the history

git filter-branch -f --tree-filter 'rm -f brochure.zip' HEAD

Or remove the history and re initialise the repo 

Step 1: remove all history (Make sure you have backup, this cannot be reverted)

rm -rf .git
Step 2: reconstruct the Git repo with only the current content

git init
git add .
git commit -m "Initial commit"
Step 3: push to GitHub.

git remote add origin <github-uri>
git push -u --force origin master
