---
title: Update the packages of the el-get's
date: 2018-01-04T01:13:31Z
tags:
  - emacs
  - el-get
---

どうも `el-get-update-all` や `el-get-update` では `git pull` 相当のことをしてくれないようです。

やや乱暴ですが以下のようにして更新しました。<!--more-->

    $ for d in *(/); do (echo; echo $d; cd $d; test -d .git && git pull); done

少し改良すれば `apt-listchanges` 相当のことができそう。 

1. `git fetch` して
2. upstream との違いを `git log` で見て
3. 受け入れるなら `y` を打鍵

など。ただ `read` を oneline で書くとかなり長くなりそう。 `git log` までで良いならこんな感じでしょうか。

    $ for d in *(/); do (echo; echo $d; cd $d; test -d .git && git fetch && git log -p HEAD..$(git rev-parse --symbolic-full-name HEAD@\{u\}) && git pull); done
