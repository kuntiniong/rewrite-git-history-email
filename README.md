Run the bash script in your terminal/ git cli to rewrite your commit history with a new email. 

The changes made ***won't*** affect the original commit dates.

---

### Unrelated yet useful commands:
use this command if you wanna preserve the author date as your commit date after rebasing
```
git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'
```
