lang: ja
viewport: "width=device-width, initial-scale=1.0"
title: xrandr(1)があればPCの画面の色温度を変えて目に優しくすることができる | Tpaefawzen
author: Tpaefawzen
description: PCの画面キツい。デスクトップ環境の画面の色を変えて目に優しくしよう。
keywords: linux,xrandr,xorg,X11,xorg-xrandr,desktop environment,画面,色,目,色温度,ターミナルエミュレータ

# xrandr(1)があればPCの画面の色温度を変えて目に優しくすることができる

書いた日　2025年1月14日

画面の明るさ変えるだけじゃムリだと思ってたり、
親不知生えてて顎と頭が痛くて困りながらもPCでなんやかんややるというふざけた真似やっちゃいながらやってるんでここぞという時は画面の色を白すぎるやつではなく暖かみのある赤もしくは橙にしたいよね。
昨日誤って灯油零しちゃってシンナー臭くて頭痛くてまじやばいんだけど。

## [xrandr]とは

[xrandr]: https://wiki.archlinux.jp/index.php/Xrandr

X Window Systemにて、画面のサイズとか、向き変更とか、マルチディスプレイの設定とか、なんやかんやができるやつ。

## 結論

    xrandr --output eDP1 --gamma 1:0.70:0.70

## 参考にしたやつ
[Control gamma widht xrandr to save your eyes](https://manerosss.wordpress.com/2017/07/11/xrandr-gamma/) manero's blog
