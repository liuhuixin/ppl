#!/bin/sh

echo "begin build blog"
hugo
git add .
git commit -m "Update Hugo Blog"
git push origin master

# Go To Public folder
cd public

git init
git remote add origin https://github.com/liuhuixin/ppl-s-Blog.git
git pull
# Add changes to git.
git add .

# Commit changes.
msg="Update Public Static Page `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
