---
date: 2017-01-30T14:00:00+09:00
description: 気づいたら Emacs が終了している環境になってしまったため、 ad-hoc な対応を入れました。
slug: Confirm before killing Emacs
tags:
  - emacs
title: Emacs を終了する前に確認する
---

どうも最近、知らずしらずのうちにアプリケーションを落としてしまうのです。どうやら Hammerspoon の設定がわるいようで、ふとした拍子に Cmd+q か何かを送ってしまう模様。

特に、気づいたら Emacs がいなくなっているので大問題です。（私は Emacs を GUI で使っています。）<!--more-->

ということで当座の対処として以下を追加しました。

    (setq confirm-kill-emacs 'y-or-n-p)

こうすると `Really exit Emacs? (y or n) ` と聞いてくれて便利です。

* * *

## 2017-03-13 追記

Emacs を起動したシェルで何度か C-c を発行すると Emacs が音もなく死ぬことを確認……。

## 2017-05-06 追記

`open -a Emacs` といった形で呼び出すと問題ないことを確認しました。

私は macOS では GUI でしか起動しませんし、勢いでエイリアスも変更してしまいました。

```sh
if [[ $(uname) == "Darwin" ]]; then
  alias emacs="open -a Emacs"
else
  alias emacs="XMODIFIERS='@im=none' emacs"
fi
```
