.HEAD "<meta charset=UTF-8>"
.ds ABSTRACT 要約
.nr FF 3
.TL
groff -Thtml -mwwwとかで書いてみた
.AU
Tpaefawzen
.AB
昨日Discordの人に「日本語でHTMLに出力するような\c
ブログをgroffのmsマクロとかで書こうとか思ってそんな\c
話をしたら「Markdown使いなよ」と言われた。\c
それでもやっぱ諦めきれなくてgroffで書いてみた。
.AE
.PP
2025年1月10日作成
.SH
はじめに
.PP
やっぱMarkdownとかで書けよというのが定石なんだと思います。\c
それでもなお、諦めきれないから書きました。
.SH
私の環境を紹介してみた
.PP
私は、2020年？から
.URL https://www.archlinux.org/ "Arch GNU/Linux"
を使っています。ってことで、使用歴を紹介していきます。\**
.DLS
.IP 大昔
家庭にあったWindows機を共有
.IP 2015年6月か7月か8月
.URL https://ja.wikipedia.org/wiki/Scientific_Linux "Scientific Linux"
をはじめとしてGNU/Linuxデビュー
.IP 2016年春ぐらい
自作PC、Ubuntuデビュー
.IP 2017年か18年じゃね？
テキストエディタviとかシェルスクリプトとかの、ターミナルでやるやつデビュー。\c
当初はshとbashの違いすらもわからなかったり、変数代入の正しい文法とかもわからな\c
かったり、shebangとかもわからなかったり、空白の有無とかの意味論とか\c
わからなかったりした。
.IP 2019年
デスクトップPCによるWindows 10を購入。Windows Subsystem for Linuxデビュー。
.IP 2020年
Arch GNU/Linuxデビュー
.DLE
.PP
.FS
.PP
当初は
.CW tbl(1)
使って、表で表示しようとしたんですけど、正直マニュアル読む限界が\c
来たのでやめました。
.FE
.SH
このページについて
.PP
このページを生成するのに、
.LD
groff -b -Thtml -KUTF-8 -ms -mwww 2025/01/10-first-blog-groff-www.ms > 2025/01/10-first-blog-groff-www.html &&
xdg-open 2025/01/10-first-blog-groff-www.html
.DE
というコマンドを実行しました。
.SH
このページを作った感想
.PP
文字の間に空白がたっぷりあったり、\c
できたHTMLのソースが文字参照だらけだったりと\c
まじでしんどい結果とはなりました。\c
.PP
これでもなお、作れてよかったです。今後のgroffの\c
発展に期待します。
