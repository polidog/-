# WordPress and Vagrant sample

PHP7 + nginx + mysqlのsample

## 使い方

```
$cp vagrant_config.dist.yml vagrant_config.yml
$ vagrant up
```

## hostsの設定は必要

ブラウザからアクセスするためにはhostsの設定が必要です。

```
$ sudo vi /etc/hosts

polidog.local 192.168.33.140
```

## ブラウザでアクセスする

`http://polidog.local`

これでブラウザにアクセスできます。あとはおこのみで設定してくだしあ。
