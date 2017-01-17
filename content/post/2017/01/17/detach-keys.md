---
date: 2017-01-17T23:08:18+09:00
tags:
  - docker
title: detach keys
---

`docker-compose run` や `docker-compose exec` をすると `C-p` の動作がおかしくてずっと困っていました。

これは Docker のデタッチが `C-p` `C-q` だったからなんですね。

デタッチ機能はときどき使っていたのに、頭の中でまったく結びついていませんでした。そうじゃないかと言ってくれたチームメイトに感謝。

で、デタッチキーは変更できるのだそうです

> Following is a sample config.json file:

> ```json
>  {
>   "HttpHeaders": {
>     "MyHeader": "MyValue"
>   },
>   "psFormat": "table {{.ID}}\\t{{.Image}}\\t{{.Command}}\\t{{.Labels}}",
>   "imagesFormat": "table {{.ID}}\\t{{.Repository}}\\t{{.Tag}}\\t{{.CreatedAt}}",
>   "detachKeys": "ctrl-e,e"
> }
> ```

<https://docs.docker.com/engine/reference/commandline/cli/#/configuration-files>

同様に設定したところ無事解決……と思いきや、 `docker` コマンドでは有効でしたが
`docker-compose` コマンドでは効きませんでした。残念。

なので今は

    docker exec -it $(docker-compose ps -q spring) rails c

こんなことをして使っています。

 `C-p` は快適に使えるものの、コマンドラインが不恰好なようなー。
