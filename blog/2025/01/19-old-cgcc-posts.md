lang: ja
viewport: "width=device-width, initial-scale=1.0"
title: 昔のCode Golf & Code Challenge Stack Exchangeの投稿一覧 | Tpaefawzen
author: Tpaefawzen
description: My old CGCC & Meta CGCC posts as user100411
keywords: code golf & code challenge stack exchange,stack exchange,cgcc,user100411,鳴神裁四点一号,コードゴルフ,CSV,シェルスクリプト,Tukubaiツール

# 昔のCode Golf & Code Challenge Stack Exchangeの投稿一覧

書いた日　2025年1月19日

2021年に旧アカウントで投稿していたやつ。
Stack Exchangeでは、一度消えたアカウントで検索するの、できないので、
SQLで操作するやつでなんやかんやするのじゃないと前に投稿してた内容の一覧が取得できない。

ということで、一覧ページを作った。

* [CGCCの方のリスト](list-cgcc-user100411.html)
* [CGCC Metaの方のリスト](list-metacgcc-user100411.html)

## 作り方

部分的に[シェルスクリプト](__cgcc.sh)で作った。これ、CGCCの方で、Metaな方についても、同様にすれば作れる。

[Parsrs]必須。
[Unicageツール]必須。

```sh:__cgcc.sh
#!/bin/sh

### Generate html.

# Convert CSV into Unicage CSV-Value format
cat cgcc-posts.csv | parsrc.sh |
#
# 1. Row 2. Column 3/NF. Value
#
# Original CSV
# 1. Post Link
# 2. body
# 3. owneruserid
# 4. ownerdisplayname
awk '$2 <= 2' |
#
# Remove header line of original CSV
awk '$1 > 1' |
#
# Original CSV
# 1. Post Link
# 2. body
#
# Convert each body into actual one-field
sed '
    /^[0-9]* 2 /{
	s/_/\\_/g;
	y/ /_/;
	s/_/ /; s// /;
    }' |
#
# 1. Row 2. Column 3. Value
delf 1 2 |
#
# Now convert to tag-value field
paste -d ' ' - - > __cgcc.unicage

mojihame -l ./__cgcc.mojihame ./__cgcc.unicage  > __cgcc.html
```

[Parsrs]: https://github.com/ShellShoccar-jpn/Parsrs
[Unicageツール]: https://github.com/Tpaefawzen/ShellShoccar-jpn-Tukubai-just-sh

## 元のCSV

[CGCC](cgcc-posts.csv)

[CGCC Meta](cgcc-meta-posts.csv)

## 現在のCGCCのアカウント

2022年9月から、
[「鳴神裁四点一号」名義でアカウント作りなおして今に至る。](https://codegolf.stackexchange.com/users/113493/%e9%b3%b4%e7%a5%9e%e8%a3%81%e5%9b%9b%e7%82%b9%e4%b8%80%e5%8f%b7)

2025年1月19日現在ではCGCCなんかまともにやってない。もしも私が久し振りに遊びに行ったら、よろしく。

## ところでアナゴルについて

あれはほったらかしてる。

## リンク集

* [Code Golf Stack Exchange](https://codegolf.stackexchange.com/)
