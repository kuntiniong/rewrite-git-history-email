#!/bin/bash

# clone and cd to your target repo

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "No git repo is found."
  exit 1
fi

echo "Enter your original email:"
read ORIGINAL_EMAIL
echo "Enter your username:"
read USERNAME
echo "Enter your new email:"
read NEW_EMAIL

echo "Starting to rewrite commit history..."

# configure the new email used in future commits (comment it out if unnecessary)
git config --global user.email "$NEW_EMAIL"

# rewrite the existing commits with the new email
git filter-branch --commit-filter "
if [ \"\$GIT_AUTHOR_EMAIL\" = \"$ORIGINAL_EMAIL\" ]; then
    GIT_AUTHOR_NAME=\"$USERNAME\"
    GIT_AUTHOR_EMAIL=\"$NEW_EMAIL\"
    GIT_COMMITTER_NAME=\"$USERNAME\"
    GIT_COMMITTER_EMAIL=\"$NEW_EMAIL\"
fi
git commit-tree \"\$@\";
" HEAD

echo "Commit history rewritten, sync the changes to GitHub with: git push --force"