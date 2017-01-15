---
aliases:
  - /tech/2013/06/27/upload-image-to-your-github-wiki-page/
category: tech
date: 2013-06-28T02:00:00+09:00
slug: Upload image to your github wiki page
tags:
  - github
  - wiki
title: GitHub の Wiki に表示する画像を git で上げる
---

# tl;dr

    $ git clone git@github.com:<username>/<repository>.wiki.git
    $ cd <repository>.wiki
    $ mkdir images
    $ cp path/to/image_file images
    $ git -a -m 'Attach images'
    $ open https://github.com/<username>/<repository>/wiki/<pagename>

And put `[[/images/image_file]]` to your wiki page.

That's it.

* * *

情報元: [Editing Wiki Locally](https://github.com/wicketstuff/core/wiki/Editing-Wiki-Locally)

この方法を使えば、好きな画像を wiki に貼り付けることができます :)

* * *
