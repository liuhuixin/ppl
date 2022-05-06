#!/bin/sh

echo "begin build blog"

# Commit changes.
msg="Update Public Static Page `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

#git clone https://git.oschina.net/gaofeifps/body.git --recursive
hugo
git add .
git commit -m "$msg"
git push origin master

# Go To Public folder
cd public

git init
git remote add origin https://github.com/liuhuixin/liuhuixin.github.io.git
git pull origin main --allow-unrelated-histories
# Add changes to git.
git add .
git commit -m "$msg"
# Push source and build repos.
git push origin main -f 

# Come Back up to the Project Root
cd ..
