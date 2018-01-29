# Introduction

This is a sample document show you how to git hun command line to management your repository and use git hub as your source control

## Getting Started

Down and install Git at this link
* [Git](https://git-scm.com/downloads)

### Map your workspace 
Open command line tool 
cd to the directoy you want hold you code here.

```bash
For Windows:
cd\
cd Windows\system32\
cd..
G:
cd MainFolder\SubFolder
```

### Clone Resotority
```bash
git clone https://github.com/xiongyunqiang/Ranchod.git
```
after this your can start coding now.

### 常用的Command Line
```bash
Folder Map: git clone
Get Lastest Version: git pull
Check In: git push origin HEAD
Shelve: git stash(local only)
Exclude/Include: by default will Exculde all files
                 Include: git add . //include all files
                 Exclude: git reset
Commit Local: git commit -m "your message"
New Branch: git branch // if with name will create new branch else will show all branch at local
Show All changed Files: git status
Switch Branch: git checkout master //change to master branch
Delete Brach: git branch -D brach-name 
Add Cuccent Commint to previous one： git commit --amend 
rollback commit:  git reset HEAD~1
add some thing for test only
```


