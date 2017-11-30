---
title: "Atomic Chrome for Emacs"
date: 2017-08-28T16:33:35Z
slug: atomic emacs
subtitle: ""
tags:
  - emacs
  - chrome
---

@onk さんが GhostText なる Chrome 拡張を紹介されていました。

{{< tweet 901329085976109057 >}} 

Emacs 用があるかなーと思って[探したらありました][1].

<!--more-->

README では melpa からインストールする例がありましたが、私は el-get 使いなので以下のようにしました。

<https://github.com/elim/dotemacs/commit/8a6a234>

```diff
diff --git a/config/packages.el b/config/packages.el
index d93a5ba..bbadba6 100644
--- a/config/packages.el
+++ b/config/packages.el
@@ -19,6 +19,7 @@
 (el-get-bundle tarao/with-eval-after-load-feature-el)

 (el-get-bundle ag)
+(el-get-bundle alpha22jp/atomic-chrome :depends (let-alist websocket))
 (el-get-bundle anzu)
 (el-get-bundle buffer-move)
 (el-get-bundle company-mode)
diff --git a/config/packages/init-atomic-chrome.el b/config/packages/init-atomic-chrome.el
new file mode 100644
index 0000000..0fae668
--- /dev/null
+++ b/config/packages/init-atomic-chrome.el
@@ -0,0 +1,9 @@
+;;; init-atomic-chrome.el --- A setting of the atomic-chrome.
+;;; Commentary:
+;;; Code:
+
+(require 'atomic-chrome)
+(atomic-chrome-start-server)
+
+(provide 'init-atomic-chrome)
+;;; init-atomic-chrome.el ends here
```

[1]: https://github.com/alpha22jp/atomic-chrome "Atomic Chrome for Emacs"
