---
title: salt-ssh で TemplateNotFound がでたら
date: 2017-08-23T15:49:27Z
slug: extra_filerefs
tags:
  - saltstack
  - salt-ssh
---

`salt/master` で extra_filerefs を設定すると、解決できるようになる。

```yaml
extra_filerefs:
  - salt://logrotate/map.jinja
  - salt://logrotate/defaults.yaml
```

Ref: [saltstack/salt#21370][1]

[1]: https://github.com/saltstack/salt/issues/21370
