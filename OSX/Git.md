




## git checkout --track origin/mb-pages



基于 一个分支创建 另一个 分支， 这条命令非常重要。




<hr>


解决 git pull


rejected



no fast forward


<hr>



同步 远程分支 到 本地的第一分支，

再基于 第一分支， 创建第二分支， 想得到的分支


<hr>





    Last login: Mon Aug 27 00:10:19 on ttys002
    dengjiangzhou@dengjiangzhou  ~  cd /Users/dengjiangzhou/Documents/JS/3 
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3  git clone https://github.com/dengV/mapbox-gl-js.git
    Cloning into 'mapbox-gl-js'...
    remote: Counting objects: 75959, done.
    remote: Compressing objects: 100% (24/24), done.
    remote: Total 75959 (delta 12), reused 2 (delta 2), pack-reused 75933
    Receiving objects: 100% (75959/75959), 118.90 MiB | 8.04 MiB/s, done.
    Resolving deltas: 100% (51143/51143), done.
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3  cd mapbox-gl-js 
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   master  git checkout -b mb-pages
    Switched to a new branch 'mb-pages'
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git pull
    There is no tracking information for the current branch.
    Please specify which branch you want to merge with.
    See git-pull(1) for details.

    git pull <remote> <branch>

    If you wish to set tracking information for this branch you can do so with:

    git branch --set-upstream-to=origin/<branch> mb-pages

    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git pull https://github.com/dengV/mapbox-gl-js mb-pages:mb-pages
    From https://github.com/dengV/mapbox-gl-js
    ! [rejected]            mb-pages   -> mb-pages  (non-fast-forward)
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git pull https://github.com/dengV/mapbox-gl-js.git  mb-pages:mb-pages
    From https://github.com/dengV/mapbox-gl-js
    ! [rejected]            mb-pages   -> mb-pages  (non-fast-forward)
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git checkout master
    Switched to branch 'master'
    Your branch is up to date with 'origin/master'.
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   master  git pull https://github.com/dengV/mapbox-gl-js.git  mb-pages:mb-pages
    From https://github.com/dengV/mapbox-gl-js
    ! [rejected]            mb-pages   -> mb-pages  (non-fast-forward)
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   master  git branch
    * master
    mb-pages
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   master  git branch -d  mb-pages

    Deleted branch mb-pages (was a65651a69).
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   master  git checkout -b --track mb-pages:mb-pages
    fatal: 'mb-pages:mb-pages' is not a commit and a branch '--track' cannot be created from it
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   master  git checkout --track mb-pages:mb-pages 
    fatal: Missing branch name; try -b
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   master  git checkout --track mb-pages/mb-pages
    fatal: 'mb-pages/mb-pages' is not a commit and a branch 'mb-pages' cannot be created from it
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   master  git checkout --track  https://github.com/dengV/mapbox-gl-js.git   mb-pages/mb-pages
    fatal: '/github.com/dengV/mapbox-gl-js.git' is not a valid branch name.
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   master  git checkout --track origin/mb-pages
    Branch 'mb-pages' set up to track remote branch 'mb-pages' from 'origin'.
    Switched to a new branch 'mb-pages'
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git pull https://github.com/dengV/mapbox-gl-js.git  mb-pages:mb-pages     
    Already up to date.
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git pull https://github.com/dengV/mapbox-gl-js  mb-pages:mb-pages  
    Already up to date.
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git branch
    master
    * mb-pages
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git branch issue_four:mb-pages 
    fatal: 'issue_four:mb-pages' is not a valid branch name.
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git branch issue_four mb-pages 
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git ceckout -b issue_four
    git: 'ceckout' is not a git command. See 'git --help'.

    The most similar command is
    checkout
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   mb-pages  git checkout  issue_four
    Switched to branch 'issue_four'
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   issue_four  git push https://github.com/dengV/mapbox-gl-js.git
    To https://github.com/dengV/mapbox-gl-js.git
    ! [rejected]            issue_four -> issue_four (non-fast-forward)
    error: failed to push some refs to 'https://github.com/dengV/mapbox-gl-js.git'
    hint: Updates were rejected because the tip of your current branch is behind
    hint: its remote counterpart. Integrate the remote changes (e.g.
    hint: 'git pull ...') before pushing again.
    hint: See the 'Note about fast-forwards' in 'git push --help' for details.
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   issue_four  git push https://github.com/dengV/mapbox-gl-js.git --delete issue_four
    To https://github.com/dengV/mapbox-gl-js.git
    - [deleted]             issue_four
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   issue_four  git push https://github.com/dengV/mapbox-gl-js.git 
    Total 0 (delta 0), reused 0 (delta 0)
    To https://github.com/dengV/mapbox-gl-js.git
    * [new branch]          issue_four -> issue_four
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   issue_four  git status
    On branch issue_four
    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   src/index.js
    modified:   src/ui/camera.js

    no changes added to commit (use "git add" and/or "git commit -a")
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   issue_four ●  
    git add .                                                   ✔  28  00:28:37 
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   issue_four ✚  
    git commit -m"translate AnimationOptions  and    translate accessToken"
    [issue_four 1014b1649] translate AnimationOptions  and    translate accessToken
    2 files changed, 45 insertions(+), 39 deletions(-)
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   issue_four  git push https://github.com/dengV/mapbox-gl-js.git
    Counting objects: 6, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (6/6), done.
    Writing objects: 100% (6/6), 1.97 KiB | 1.97 MiB/s, done.
    Total 6 (delta 5), reused 0 (delta 0)
    remote: Resolving deltas: 100% (5/5), completed with 5 local objects.
    To https://github.com/dengV/mapbox-gl-js.git
    a2b727fe3..1014b1649  issue_four -> issue_four
    dengjiangzhou@dengjiangzhou  ~/Documents/JS/3/mapbox-gl-js   issue_four  
