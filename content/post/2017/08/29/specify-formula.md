---
title: "salt-ssh で formula を指定して適用する"
date: 2017-08-28T16:24:53Z
slug: specify formula
tags: 
  - saltstack
  - salt-ssh
---

`state.apply` に formula を渡す。

    salt-ssh [options] '<target>' state.apply users

2 つ以上渡す場合はカンマで区切る。

    salt-ssh [options] '<target>' state.apply users,logrotate
