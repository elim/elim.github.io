---
title: "Keychafin 2.8.4"
date: 2017-11-21T14:49:25Z
slug: keychain 2.8.4
subtitle: "Support to GPG2"
tags:
  - keychain
  - gpg
---

久し振りに [keychain][1] がバージョンアップしているのを発見しました

[Changelog][2] を見ると実に 1 年振りのようです

<!--more-->

* * *

> Keychain 2.8.4 (19 Oct 2017)

--snip--

> keychain 2.8.3 (24 Jun 2016)

* * *

このバージョンから正式に [GPG2][3] をサポートするようになったとのことです。また [2.8.3 からの差分][4] を確認したところ、他にも細々とした調整が入っていました

いままで Ubuntu 17.04 上では手パッチした keychain を使っていたのですが、こちらに差し替えることにしました

きちんと .deb を作って差し替えようかとも思ったのですが、実体は man と sh が 1 つずつのシンプルなコマンドですので、以下で済ませました

    $ ghq get -p git@github.com:funtoo/keychain.git
    $ cd path/to/keychain
    $ git checkout 2.8.4
    $ sudo cp -v keychain.1 $(locate keychain.1)
    $ sudo cp -v keychain $(where keychain)

ひとまず正常に動いているようです

    $ exec $SHELL -l

    * keychain 2.8.4 ~ http://www.funtoo.org
    * Found existing gpg-agent: 2833
    * Found existing ssh-agent: 2859
    * Known ssh key: /home/takeru/.ssh/id_ed25519
    * Known gpg key: 0A2D3E0E

[1]: https://www.funtoo.org/Keychain "Keychain : Official Project Page"
[2]: https://github.com/funtoo/keychain/blob/2.8.4/ChangeLog "keychain/ChangeLog at 2.8.4 · funtoo/keychain"
[3]: https://www.gnupg.org/ "The GNU Privacy Guard"
[4]: https://github.com/funtoo/keychain/compare/2.8.3...2.8.4 "Comparing 2.8.3...2.8.4 · funtoo/keychain"
