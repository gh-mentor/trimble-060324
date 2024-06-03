# This bash script uses git 2.40 or greater to stage, commit, and push changes to the main branch of the existing remote repository.

# stage all changes
git add .

# commit changes
git commit -m "Update"

# push to main branch
git push origin main

# show status
git status

# end of script
exit 0
