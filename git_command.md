Github setup and useful commands
================================

1. config github for the first time

1.1 setup user id and email
```
 git config --global user.name "yhb852948970" 
 git config --global user.email "kevin07yhb@gmail.com" 
 git config --global color.ui auto 
```
Config global gitignore
```
git config --global core.excludesfile ~/.gitignore_global
```

To check the current setting, <br />
```
git config --list
```
the above files are stored in *~/.gitconfig* <br />

1.2 SSH Key setting
```
ssh-keygen -t rsa -C "kevin07yhb@gmail.com"
```
go to *GitHub* -> *Accout Settings* -> *SSH Keys* -> *Add SSH Key* <br />
```
cat ~/.ssh/id_rsa.pub 
```
Paste the key in id_rsa.pub <br />
Using `ssh -T git@github.com` to check if the setting is successful. <br />


2. Github useful commands

2.1 git push 
For the first time, we run 
```
git push -u origin BRANCH-NAME
```

2.2 git pull
```
git pull origin BRANCH-NAME
```
pull from a branch other than master <br />

- Method1: create from local branch
```
git checkout -b BRANCH-NAME origin/BRANCH-NAME
```
- Method2: clone from remote repo
```
git clone -b BRANCH-NAME --single-branch GIT-HASH or remote/branch-name 
```

2.3 git log
To see the files change in each commit
```
git log --oneline
```
To see the files changed in each commit, using 
```
git log --summary
```
To see the details of changing files, using
```
git log -p
```
To check commit log for a file, using
```
git log filename
```
Check git log with graph
```
git log --graph
```

2.4 Compare branches
*https://help.github.com/articles/comparing-commits-across-time/*


2.5 keep forks up-to-date
```
git remote add upstream git@github.com:ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
git remote -v
git fetch upstream
git merge upstream/branch-name
git push
```

2.6 Steps to merge multiple commits into one <br />
```
git rebase --interactive HEAD~"#of-commits-want-to-merge"
```
keep the first one as pick, all the others as s (squash) <br />
change the commit message accordingly <br />
```
git push -u origin haibo --force
```
If typos are made in git rebase, use abort to undo.<br />
```
git rebase --abort*  
```

2.7 Change last commit
Stage the changes first and then <br />
```
git commit --amend
git commit --amend -m MESSAGE
```

2.8 Create a git project from scratch
```
git init
git remote add
git remote add origin git@github.com:USER-NAME/REPOSITORY-NAME.git
```

2.9 git diff
compare current file with last commit <br />
```
git diff HEAD
```
```
git diff --staged
git diff first-branch second-branch
```
See non-staged (non-added) changes to existing files <br />
```
git diff
```
See staged, non-commited changes <br />
```
git diff --cached
```

2.10 git branch
To check all the existing branchs, including origin and upstream branches, using 
```
git branch -a
```
To create new branch, using
```
git checkout -b new-branch-name
```

2.11 git checkout 
2.11.1 make HEAD points to a branch 
```
git checkout branch-name
```
2.11.2 make HEAD points to a commit 
```
git checkout commit-name
```
2.11.3 discard change in the file since last commit 
```
git checkout -- file-name
```

# other commands

the opposite to `git add` is `git reset` <br />
```
git reset FILENAME
```

Deletes the file from the working directory and stages the deletion <br />
```
git rm FILENAME
```

Removes the file from version control but preserves the file locally <br />
```
git rm [-r] --cached FILENAME
```

Changes the file name and prepares it for commit <br />
```
git mv file-original-name file-renamed
```

show the last commit info <br />
```
git show COMMIT-HASH
```

If a branch has been merged, we can use *-d* option to delete it. <br />
If a branch hasn't been merged, we need to add the *--force* option. <br />
```
git branch -d BRANCH-NAME [--force]
git rebase branch-name
```
