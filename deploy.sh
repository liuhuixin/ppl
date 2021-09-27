#!/bin/sh

echo "begin build blog"

# Commit changes.
msg="Update Public Static Page `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi


hugo
git add .
git commit -m "$msg"
git push origin master

# Go To Public folder
cd public

git init
git remote add origin https://github.com/liuhuixin/ppl-s-Blog.git
git pull master
# Add changes to git.
git add .
git commit -m "$msg"
# Push source and build repos.
git push origin master -f --allow-unrelated-histories

# Come Back up to the Project Root
cd ..
