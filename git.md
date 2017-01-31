# Github useful commands

## config github for the first time<br />
```
 git config --global user.name "yhb852948970" 
 git config --global user.email "kevin07yhb@gmail.com" 
 git config --global clolor.ui auto 
```
To check the current setting, <br />
```
git config --list
```
the above files are stored in *~/.gitconfig* <br />

## SSH Key setting
```
ssh-keygen -t rsa -C "kevin07yhb@gmail.com"
```
go to *GitHub* -> *Accout Settings* -> *SSH Keys* -> *Add SSH Key* <br />
```
cat ~/.ssh/id_rsa.pub 
```
Paste the key in id_rsa.pub <br />
Using `ssh -T git@github.com` to check if the setting is successful. <br />

## git push 
For the first time, we run <br />
```
git push -u origin BRANCH-NAME
```

## git pull
```
git pull origin BRANCH-NAME
```
pull from a branch other than master <br />

Method1:
```
git checkout -b BRANCH-NAME origin/BRANCH-NAME
```
Method2:
```
git clone -b BRANCH-NAME --single-branch GIT-SSH
```

## git log
To see the files change in each commit <br />
```
git log --oneline
```
To see the files changed in each commit, using <br />
```
git log --summary
```
To see the details of changing files, using <br />
```
git log -p
```

## Compare branches
*https://help.github.com/articles/comparing-commits-across-time/*


## keep forks up-to-date
```
git remote add upstream git@github.com:ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
git remote -v
git fetch upstream
git merge upstream/branch-name
git push
```

## Steps to merge multiple commits into one <br />
```
git log
git rebase --interactive HEAD~"#of-commits-want-to-merge"
```
keep the first one as pick, all the others as s (squash) <br />
change the commit message accordingly <br />
```
git push -u origin haibo --force
```
If typos are made in git rebase, use abort to undo.<br />
git rebase --abort*  

## Change last commit
Stage the changes first and then <br />
```
git commit --amend
git commit --amend -m MESSAGE
```

## Create a git project from scratch
```
git init
git remote add
git remote add origin git@github.com:USER-NAME/REPOSITORY-NAME.git
```

## git diff
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

## git branch
To check all the existing branchs, using 
```
git branch -a
```
To create new branch, using
```
git checkout -b new-branch-name
```

## git checkout 
1. make HEAD points to a branch <br />
```
git checkout branch-name
```
2. make HEAD points to a commit <br />
```
git checkout commit-name
```
3. discard change in the file since last commit <br />
```
git checkout -- file-name
```

## git useful commands

the opposite to `git add` is `git reset` <br />
```
git reset FILENAME
```
Undo last commit, preserving local changes <br />
```
git reset --soft HEAD~1 
```

Undo last commit, without preserving local changes <br />
```
git reset --hard HEAD~1 <br />
```
Got back to a previous commit <br />
```
git reset --hard HASH-VALUE
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

merge a branch to curent branch <br />
```
git merge [--no-ff] branch-to-be-merged 
```
the *--no-ff* option is used to avoid fast-forward merge <br />

```
git commit -am "Delete stuff"
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

Move the HEAD point to previous commits <br />
1-level back <br />
```
git checkout HEAD^
```
10-level back <br />
```
git checkout HEAD~10
```

```
git reflog
```