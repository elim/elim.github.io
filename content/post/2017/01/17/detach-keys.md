---
date: 2017-01-17T23:08:18+09:00
description: docker-compose run や docker-compose exec をすると C-p の動作がおかしくてずっと困っていました
tags:
  - docker
title: detach keys
---

`docker-compose run` や `docker-compose exec` をすると `C-p` の動作がおかしくてずっと困っていました

これは Docker のデタッチが `C-p` `C-q` だったからなんですね

デタッチ機能はときどき使っていたのに、頭の中でまったく結びついていませんでした。そうじゃないかと言ってくれたチームメイトに感謝。

で、デタッチキーは変更できるのだそうです<!--more-->

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

~~同様に設定したところ無事解決……と思いきや、 `docker` コマンドでは有効でしたが `docker-compose` コマンドでは効きませんでした。残念。~~

~~なので今は~~

    docker exec -it $(docker-compose ps -q spring) rails c

~~こんなことをして使っています~~

~~`C-p` は快適に使えるものの、コマンドラインが不恰好なようなー~~

Docker Compose 1.20 では解決しています

* <https://github.com/docker/compose/issues/3311#issuecomment-386647052>

    > > > In which version of docker-compose will this feature become available?
    > 
    > It's available from docker-compose 1.20.0
    > 
    > [d8d484e#diff-b4ef698db8ca845e5845c4618278f29a](https://github.com/docker/compose/commit/d8d484e0e19db5326afeb4cdf56864eceb81566c#diff-b4ef698db8ca845e5845c4618278f29a)


