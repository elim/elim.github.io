---
title: "Thunderbird 68"
date: 2019-10-14T06:21:49Z
slug: thunderbird 68
subtitle: "It has familiar incompatibility."
tags:
  - thunderbird
---

Thunderbird を 68 系に上げた

以前つかっていたのは 60 系だった。そのため「自動更新が働いていなかったのかな。それにしても随分と放ってしまっていたものだ」と思ったが、何のことはない 60 系の次が 68 系なのだそうな。そして 60 系から 68 系への自動更新が始まるのは、まだ先のことなのだそう。それなら気がつかなくても不思議はない

契機は macOS を Catalina 10.15 へ更新したことだった

例の Hiragino Kaku Gothic の話題に関係するのだろうか。それとも関係ないなにかのだろうか。 Catalina の上では Thunderbird のメッセージリストペインが見づらくなってしまっていた。英字部分とそれ以外が違うフォントで表示され、英字部分は未読でも太字にならなくなった。もちろん使えなくはないが、違和感は残る

解法を求めるうちに、自身の利用している Thunderbird が古い（実際はさほど古くもなかったわけだが）ことに気づき、更新してみたのだった

前置きが長くなった

更新することで上掲の問題は解決した。しかし今度は別の問題に直面してしまった。 アドオンの互換性がなくなり、導入していたものも軒並み動かなくなっていたのだ

* * *

幸い、利用しているアドオンは 1 つを除いて対応版が出されていた

* [Check and Send] [^1]

* [Enigmail] [^2]

* [External Editor] [^3]

* [Manually sort folders] [^4]

残りは Dorando keyconfig だ。これは Gmail 互換のキーバインドへ変更するために利用していた。 [dorando-keyconfig#38 Thunderbird 68 support] を見るとすぐに対応版を出されることはなさそうだ

その中で [userChromeJS] と userChrome.js が紹介されていたので、そちらで対応することにした

> In the meantime, you can use my [userChromeJS] add-on to run JavaScript which modifies key bindings, though that's obviously not as user-friendly as keyconfig.

<https://github.com/trlkly/dorando-keyconfig/issues/30#issuecomment-530343943>

また userChrome.js はこちらを参考にさせていただいた

<http://forums.mozillazine.org/viewtopic.php?p=14845317#p14846103>

以下のように L49 から L52 にかけて j/k, J/K のサポートを追加して利用している

```diff
diff --git a/userChrome.js b/userChrome.js
index 88b178f..2441bea 100644
--- a/userChrome.js
+++ b/userChrome.js
@@ -46,6 +46,10 @@
     changeKeyStrokeForKeyId("key_reply", "r");
     changeKeyStrokeForKeyId("key_replyall", "a");
     changeKeyStrokeForKeyId("key_forward", "f");
+    changeKeyStrokeForKeyId("key_nextMsg", "j");
+    changeKeyStrokeForKeyId("key_previousMsg", "k");
+    changeKeyStrokeForKeyId("key_nextUnreadMsg", "j", null, "shift");
+    changeKeyStrokeForKeyId("key_previousUnreadMsg", "k", null, "shift");
     changeKeyStrokeForKeyId("key_newMessage", "c");
     changeKeyStrokeForKeyId("key_searchMail", "/");
     changeKeyStrokeForKeyId("key_delete", "3", null, "shift");
```

コード全体はこちら <https://gist.github.com/elim/02f9017fe6af72104a2c1a5bf02ee739>

[userChromeJS] 導入後、[上記のコード](https://gist.github.com/elim/02f9017fe6af72104a2c1a5bf02ee739) を `~/Library/Thunderbird/Profiles/<random>.default/chrome/userChrome.js` として置くことで、概ね以前通り動くようになった

* * *

ところで、 Thunderbird は次の 69 系から旧来の作りのアドオンをサポートしなくなるそうだ

そのときは、いよいよ移行先を検討しなければいけないかな

[^1]: _To:_ や _Cc:_ から表示名を消去するために利用している
[^2]: 稀にデジタル署名をつけたり確認したりしたいことがある
[^3]: 文章は Emacs で書きたい
[^4]: よく使うアカウントを、フォルダーペインの上部に表示したい

[Check and Send]: http://hogi-ja.blogspot.com/2019/08/thunderbird-68.html
[dorando-keyconfig#38 Thunderbird 68 support]: https://github.com/trlkly/dorando-keyconfig/issues/30
[Enigmail]: https://addons.thunderbird.net/en-US/thunderbird/addon/enigmail/
[External Editor]: https://github.com/exteditor/exteditor/releases/tag/v2.0.1
[Manually sort folders]: https://addons.thunderbird.net/en-US/thunderbird/addon/manually-sort-folders/
[userChromeJS]: https://addons.thunderbird.net/en-us/thunderbird/addon/userchromejs-2/
