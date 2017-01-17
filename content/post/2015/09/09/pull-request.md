---
aliases:
  - /2015/09/09/fix-the-date-and-time-of-the-format-of-the-article/
date: 2015-09-09T11:27:00Z
slug: Pull Reqest was incorporated
tags:
  - github
  - pull-request
title: Pull Reqest が取り込まれた
---

ここで使わせていただいてるテーマの [Steam][steam] へ [Pull Request を送った][pr]ところ、無事取り込んでいただけました。

## 修正点

いずれも投稿日時の表示に関するものです。

-   投稿日時ではなく、現在日時が使用されていた個所を改める
-   日時フォーマットを Go 言語の仕様に合わせる

## 謝辞

なお、日時フォーマットの仕様確認の際 [Fucking Go Date Format][go-date-format] に大変お世話になりました。

同サイトを知るきっかけになった [Rebuild: 81: Enable The Broken Web (Hajime Morrita)][rebuild-81] に感謝です。

* * *

ところで [Hugo][hugo] はテーマと同構造のディレクトリを用意すると、そちらを優先して読んでくれるようです。

たとえば、以下のファイルを変更したい場合は

    ./themes/hugo-steam-theme/layouts/partials/post-list.html
    ./themes/hugo-steam-theme/layouts/post/single.html

以下のようにファイルを用意すると、そちらが読み込まれます。

    ./layouts/partials/post-list.html
    ./layouts/post/single.html

「ちょっと手を加えたいだけ」といった時にはこちらの方が簡単かも。

[go-date-format]: http://fuckinggodateformat.com/

[hugo]: https://gohugo.io/

[pr]: https://github.com/digitalcraftsman/hugo-steam-theme/pull/1

[rebuild-81]: http://rebuild.fm/81/

[steam]: https://github.com/digitalcraftsman/hugo-steam-theme

