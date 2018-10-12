# Elm入門者向けハンズオン

## ターゲット
- Elm始めようとしている方・始めて間もない方

## ゴール
- ElmでWebアプリ作りを体験する
  - その中で基本的な文法やアーキテクチャを知ってもらう
- Elm良い言語だな〜と思ってもらう
  - 今後選択肢の一つになったら嬉しいです！

## やること
1. 手を動かしながらElmになれる
1. チャットアプリを作ってみる

## このハンズオンでやらないこと
- 全部の文法の紹介と詳細な文法の説明
- 関数型言語の説明
- サーバサイド通信
- JSとの連携

## Elmについて
> A delightful language for reliable webapps.

信頼できるWebアプリケーションのための楽しい言語

### 特徴
- Webフロントエンドに特化している
- 言語がフレームワークを提供する
- AltJS
- 静的型付け言語
- 実行時例外が発生しないとしている
- 関数型

### 特に推しポイント
- 静的型付け言語
  - 強力な型の力を使える
- 言語がフレームワークを提供する
  - フレームワークで悩む必要がない

## 準備
ここからは実際に手を動かしながら見ていくことになるので、リポジトリをcloneしてください。

```
$ git clone https://github.com/asmasa/elm-hands-on.git

or

$ git clone git@github.com:asmasa/elm-hands-on.git
```

### 動かし方
今回はElmアプリケーションを簡単に動かせる`elm reactor`を使用します。
使い方は以下になります。

```
$ cd elm-hands-on
$ elm reactor
```

これで`http://localhost:8080`にアクセスできるWebサーバが立ち上がります。

以下にブラウザからアクセスし、`test`と表示されれば成功です。  
`elm reactor`は立ち上げぱなしで大丈夫です。

- http://localhost:8000/step1/HelloWorld.elm

※ハンズオン中に表示がうまく反映されないことが起きた場合は、`elm-hands-on/elm-stuff`を消してみてください。

### 開発の仕方
1. vscodeを起動する
1. `ファイル` -> `開く...`
1. cloneしたリポジトリのディレクトリ(`elm-hands-on`)を選択して`開く

## 目次
- [Step1. Elmアーキテクチャで始めるHello World!!!](step1/README.md)
- [Step2. 型を使う](step2/README.md)
- [Step3. ちょっとリッチなViewを作ってみる](step3/README.md)
- [Step4. イベントを使う](step4/README.md)
- [各Stepの実装例](sample)
- [チャットアプリ作成](https://github.com/asmasa/elm-chat)

## 参考
- [syntax](https://elm-lang.org/docs/syntax)
- ライブラリ
  - [Core](https://package.elm-lang.org/packages/elm/core/latest/)
  - [Html](https://package.elm-lang.org/packages/elm/html/latest/)
  - [Html.Attributes](https://package.elm-lang.org/packages/elm/html/latest/Html-Attributes)
  - [Html.Events](https://package.elm-lang.org/packages/elm/html/latest/Html-Events)
- [Style Guide](https://elm-lang.org/docs/style-guide)
