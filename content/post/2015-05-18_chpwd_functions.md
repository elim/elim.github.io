---
aliases:
  - /2015/05/18/chpwd_functions/
date: 2015-05-18T22:36:15+09:00
slug: Temporarily disable the chpwd hooks of Zsh
tags:
  - zsh
title: chpwd_functions
---

## tl;dr

Zsh で一時的に chpwd の hook を無効にしたいときは `chpwd_function=` を前置する。

    $ chpwd_functions= cd

* * *

私の _Zsh_ 環境で [tab.bash] を使ってみたところ、iTerm のタブを作成したあとの `cd` に失敗してしまいました。

chpwd 時に ls する hook を入れていたため `$cdto` 内にディレクトリ内のファイルが列挙されてしまっていたようです。

以下のように書き換えることで、私の環境でも [tab.bash] を動作させることができました。

```diff
diff --git a/tab.bash b/tab.bash
old mode 100644
new mode 100755
index 85a0e2c..d2ddf7a
--- a/tab.bash
+++ b/tab.bash
@@ -23,7 +23,7 @@ function tab () {
     local args="$@"

     if [ -d "$1" ]; then
-        cdto=`cd "$1"; pwd`
+        cdto=`chpwd_functions= cd "$1"; pwd`
         args="${@:2}"
     fi
```

[tab.bash]: https://gist.github.com/bobthecow/757788
