---
aliases:
  - /2015/09/22/a-powerline-package-of-the-el-get-will-be-grafted/
date: 2015-09-22T10:29:19+09:00
slug: Selects another Powerline for Emacs package
tags:
  - emacs
title: Emacs 用 Powerline を別なパッケージにした
---

BYOD していた現場から「よかったらこの Mac Pro 使ってください」という願ってもないお話をいただきまして。

喜び勇んで Xcode やら Homebrew やら Emacs やらを入れていたわけですが、どうにも Emacs 用 powerline の表示がおかしい。

![](/media/2015-09-22_powerline/broken.png)

「まったく同じ .emacs.d を使っているのになぜだろうなー」と思っていろいろ追っていたところ、このコミットを見付けました。

[803e2f7 - Use milkypostman's powerline fork][803e2f7]

```diff
commit 803e2f71de62a4503671b704c3b9084e4c5d8a3a
Author: Fabián Ezequiel Gallina <galli.87@gmail.com>
Date:   Sat Aug 24 00:03:49 2013 -0300

    Use milkypostman's powerline fork

    This one is actively maintained as opposed to jonathanchu's version.
---
 recipes/powerline.rcp | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/powerline.rcp b/recipes/powerline.rcp
index f3eb1bb..d23b67e 100644
--- a/recipes/powerline.rcp
+++ b/recipes/powerline.rcp
@@ -1,6 +1,8 @@
 (:name powerline
-       :website "https://github.com/jonathanchu/emacs-powerline"
+       :website "https://github.com/milkypostman/powerline"
+       :depends (cl-lib)
        :description "Powerline for Emacs"
        :type github
-       :pkgname "jonathanchu/emacs-powerline"
+       :pkgname "milkypostman/powerline"
+       :load-path "."
        :features powerline)
```

**おお……アップストリームが変更されている……**

それぞれのリポジトリをクローンしてきて、ざっと `git log` を比べたり `diff -uw` してみたりしましたが、共通項のが少ない……というより機能以外に共通しているところが **見当りません**。

それにしてもこれは 2013 年の変更なのですね。今まで何度も `M-x el-get-update-all` を実行していたのに、 mode-line の表示がこわれなかったところを見ると、レシピのアップストリーム変更までは追従しないようですね。

新しい環境では、変更後のレシピを使ったので表示が崩れた、と。

## 結局

[@milkypostman 版は `(powerline-default-theme)` を呼べばいい感じに表示してくれる][powerline-installation]ようなので、とりあえず手持ちの Emacs 環境はそれで揃えることにしました。

![](/media/2015-09-22_powerline/normal.png)

めでたし、めでたし。

[803e2f7]: https://github.com/dimitri/el-get/commit/803e2f7

[powerline-installation]: https://github.com/milkypostman/powerline#installation
