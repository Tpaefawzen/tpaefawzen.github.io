lang: ja
viewport: "width=device-width, initial-scale=1.0"
title: INTERCALに機能を追加してコマンドライン引数を読めるようにしたーい! | Tpaefawzen
author: Tpaefawzen
description: INTERCALに機能を追加して、コマンドライン引数を読めるようにする拡張を提案
keywords: INTERCAL,CLC-INTERCAL,C-INTERCAL,esolang,機能拡張,コマンドライン引数,command-line arguments

<!--
<link rel=canonical href="https://tpaefawzen.github.io/blog/intercal/read-commandline-args.html" />
<meta name="keywords" content="INTERCAL,CLC-INTERCAL,C-INTERCAL,esolang,機能拡張,コマンドライン引数,command-line arguments" />
-->

# INTERCALに機能を追加してコマンドライン引数を読めるようにしたーい！

書いた日　2025年1月12日

そう、こうすれば標準入出力以外の手段で、なんやかんやができる…と思います。
そうすれば、コードゴルフとかで、あるいは使いやすいプログラムの作りかたとして役に立つかも。

## INTERCALといえば
[C-INTERCAL]と[CLC-INTERCAL]の2つのメジャーな実装があると思います[^2]。

逆に、他にもあるとか、そんなばかなと思います[^1]。

[C-INTERCAL]: https://gitlab.com/esr/intercal
[CLC-INTERCAL]: https://uilebheist.srht.site/
[^1]: 何者かが、J-INTERCALとかを実装してたと思いますが、C-INTERCALにも届かない状況ですしINTERCAL-72のをそのまま実装した程度ですんで、取り上げません。
[^2]: [昔のCLC-INTERCAL](http://www.catb.org/~esr/intercal/)

## INTERCALにそんな機能とかあるの？
ないよ今のところ。入出力関連について、あるところと言えば、こんな感じだと思います。

### C-INTERCALにある入出力関連機能
最新版は2024年10月に出た0.33なんだけれど、
[ウェブでそのまま載ってるのは0.27という、2007年の版のマニュアル](http://www.catb.org/~esr/intercal/ick.htm)になってて、
最新版のマニュアルもそこから全く変わってなくてびっくりしました。
最新版でなんか増えなかったかを調べてみました。
機能としてはマジで増えてなくて、バグ修正してたのがこれまでの内容だったんです。まあこの話はさておき、入出力関連で何やるんだろうね？

C-INTERCALというコンパイラは、C-INTERCALという方言の他にCLC-INTERCALとかPIC-INTERCALとかをなんやかんやするんだけど、
C-INTERCALという方言に限って話すとなれば、

* 英単語数字入力、ローマ数字出力
* 文字入出力(Turing Tapeメソッド)

の二つがあります。PIC-INTERCALとかだとピンへの入出力だったり。なんでって？組み込みプログラミング。

### CLC-INTERCALにある入出力関連機能
最新版は2024年4月の1.00で、入出力としてはこんな機能。しかもC-INTERCALより機能たくさんあるよ。

* 英単語[^3]数字入力、ローマ数字[^4]出力
* Baudot式英数字I/O
* 汎用バイナリI/O
* クラスI/Oによるファイルハンドラ機能[^5]
* システムコールによるファイル入出力、TCPソケットへのI/Oとか

[^3]: 英語以外にイケる言語あるよ（笑）
[^4]: C-INTERCALより出力のしかたちょっと違うよ
[^5]: このハンドラで標準エラー出力とかに出せたりネットワークプログラミングできたりします。

## 機能を追加するとなれば？
### C-INTERCALだったら
じつはC-INTERCALコンパイラは、C言語の関数とリンクできたり、
Befunge-98のプログラムとリンクできたりするので、この機能を使えば
コマンドライン引数の内容を配列に書き込むようなライブラリが実現できるんですけど、
まあ詳しくは元ネタのマニュアルをごらんください。

### CLC-INTERCALだったら
システムコール`#10`を追加して「`.X`に引数の数、`:X`に最大文字数、`;XSUB#1`から`;XSUB,X`までの各配列に各引数の内容をバイナリI/Oで表したものをそれぞれ格納する」っていう機能を追加してこれをプルリクしてもらおうかなと思います。暇だったら。

## まとめ：レッツ・INTERCALプログラミング
いかがでしたか？

今日は、INTERCALに機能を拡張する場合の概要をお話ししました。

コード例とかあったら前向きに検討しますのでお楽しみに。
