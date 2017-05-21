Github setup and useful commands
================================

# 1. config github for the first time

## 1.1 setup user id and email
```bash
 git config --global user.name "yhb852948970" 
 git config --global user.email "kevin07yhb@gmail.com" 
 git config --global color.ui auto 
```
## 1.2 Config global gitignore
```bash
git config --global core.excludesfile ~/.gitignore
```

To check the current setting,
```bash
git config --list
```
the above files are stored in *~/.gitconfig* 

## 1.3 SSH Key setting
- Step 1. Generate the key from you new device
```bash
ssh-keygen -t rsa -C "kevin07yhb@gmail.com"
```
- Step 2. Get the key by 
```bash
cat ~/.ssh/id_rsa.pub 
```
- Step 3. Add the key in github setting <br />
*GitHub* -> *Accout Settings* -> *SSH Keys* -> *Add SSH Key*

- Step 4. Paste the key in id_rsa.pub
- Step 5. Check if the setting is successful by executing this command in the new added device
```bash
ssh -T git@github.com
```

# 2. Github useful commands

## 2.1 git push 
### 2.1.1 Push and add upstream by *-u* option
```bash
git push -u upstream BRANCH-NAME
```
### 2.1.2 Using *--force* option to force update for all the branches
- force means replace instead of merge
```bash
git push --force
```
### 2.1.2 force update for a specific branch
```bash
git push origin BRANCH-NAME --force
git push origin +branch-name
```

## 2.2 git pull
```bash
git pull origin BRANCH-NAME
```
pull from a branch other than master <br />

### Method1: create from local branch
```bash
git checkout -b BRANCH-NAME origin/BRANCH-NAME
```
### Method2: clone from remote repo
```bash
git clone -b BRANCH-NAME --single-branch GIT-HASH or remote/branch-name 
```

## 2.3 git log
```bash
git log --oneline
git log --summary
git log --graph
git log -p
git log --stat
```
To check commit log for a file, using
```bash
git log filename
```

## 2.4 Compare branches
*https://help.github.com/articles/comparing-commits-across-time/*


## 2.5 git remote
### 2.5.1 Show all the remote repos
```bash
git remote 
```
### 2.5.2 rename remote repos
```bash
git remote rename <old-name> <new-name>
```
e.g. 
```bash
git remote rename upstream hope
```
### 2.5.3 add remote (origin/upstream) branch for a local repo
```bash
git remote add <short-name> <url>
```
e.g.
```bash
git remote add upstream git@github.com:ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
```
### 2.5.4 remove a remote repo
```bash
git remote rm <repo-name>
```
## 2.6 Steps to merge multiple commits into one
```bash
git rebase --interactive HEAD~"#of-commits-want-to-merge"
```
keep the first one as pick, all the others as s (squash) <br />
change the commit message accordingly <br />

If typos are made in git rebase, use abort to undo.<br />
```bash
git rebase --abort*  
```

## 2.7 Change last commit
```bash
git commit --amend
git commit --amend -m MESSAGE
```

## 2.8 Create a git project from scratch
```bash
git init
git remote add
git remote add origin git@github.com:USER-NAME/REPOSITORY-NAME.git
```

## 2.9 git diff

### 2.9.1 show upstaged changes
```bash
git diff
```
### 2.9.2 show staged changes
```bash
git diff --cached or --staged
```
### 2.9.3 compare current file with last commit
```bash
git diff HEAD
```
### 2.9.4 compare changes in general
```bash
git diff first-branch second-branch
```

## 2.10 git branch
To check all the existing branchs, including origin and upstream branches, using <br />
```bash
git branch -a
```
To create new branch, using
```bash
git checkout -b new-branch-name
```

## 2.11 git checkout 
### 2.11.1 make HEAD points to a branch 
```bash
git checkout branch-name
```
### 2.11.2 make HEAD points to a commit 
```bash
git checkout commit-name
```
### 2.11.3 discard change in the file since last commit 
```bash
git checkout -- file-name
```

## 2.12 git stash
```bash
git stash save all
git stash list
git stash pop stash@{0}
```

## 2.13 git rm
### 2.13.1 Deletes the file from the working directory and stages the deletion
```bash
git rm filename
```
- if we delete the file from file system, we also need to run the above command to stage the deletion
### 2.13.2 Removes the file from version control but preserves the file locally <br />
```
git rm [-r] --cached filename
```

## 2.14 git reset
### 2.14.1 It can be used to remove staged files.  
- `git reset` is the opposite of `git add`.   <br />
```
git reset FILENAME
```
### 2.14.2 Revert back all the changes in the file systems
```bash
git reset --hard HASH
```
### 2.14.3 Revert back the changes back in git, but keep the file system untouched
```bash
git reset --soft HASH
```

# other commands

show the last commit info <br />
```
git show COMMIT-HASH
```

If a branch has been merged, we can use *-d* option to delete it. <br />
If a branch hasn't been merged, we need to add the *--force* option. <br />
```bash
git branch -d BRANCH-NAME [--force]
git rebase branch-name
```
