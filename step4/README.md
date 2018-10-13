# Step4. イベントを使う

ここではイベントを使って、イベントに応じてのModel更新をしてみます。

## 試してみる
`step4/Event.elm`ファイルを開いて、イベントを使ってみましょう！

テキストを入力してボタンを押すと、入力値がdiv要素に表示される  
というの作ってみます。

### Modelの変更
Modelを以下のように変更してください。

```
type alias Model =
    { inputText : String
    , divText : String
    }
```

### initの変更

```
init : () -> ( Model, Cmd msg )
init _ =
    ( Model "" "", Cmd.none )
```

### Msgの変更
Msgを以下のように変更してください。

```
type Msg
    = ChangeInput String
    | ChangeDiv
```

### Updateの変更
`update`関数を以下のように変更してください。

```
update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ChangeInput text ->
            ( { model | inputText = text }, Cmd.none )

        ChangeDiv ->
            ( { model | divText = model.inputText }, Cmd.none )
```

### viewの変更

`view`関数を以下のように変更してください。

```
view : Model -> Html Msg
view model =
    div []
        [ div []
            [ input [ onInput ChangeInput ] []
            , button [ onClick ChangeDiv ] [ text "クリック" ]
            ]
        , div [] [ text model.divText ]
        ]
```

ファイルを保存してから、ブラウザから`http://localhost:8000/step4/Event.elm`にアクセスします。

再度ソースを変更したあとに画面表示を確かめたいときには、画面をリロードして下さい。

## Msg

カスタイムタイプという、他の言語でいうenumのような感じのモノを使います。
以下は標準モジュール内でのカスタムタイプの例です。

```
type Bool = True | False

-- 任意の`a`型の値を持つ場合はJust、値を持たない場合はNothingで表す
type Maybe a = Just a | Nothing
```

カスタムタイプは`type`で宣言します  
右辺は値を表し`|`で区切ることによって、複数の値を定義することができ、どれかを値として入れられる

```
type Msg
    = ChangeInput String
    | ChangeDiv
```

ここでは

- `Msg`型が取りうるのは、`ChangeInput "xxxxx"`みたいに`String`を与えた`ChangeInput`、または`ChangeDiv`となる
  - `ChangeInput String`と`ChangeDiv`はコンストラクタとしても使える

各値が表すのは

- `ChangeInput String`
  - テキストボックスに文字が入力された時に発生するイベントに対応するMsg。`String`は入力された文字列を表す。
- `ChangeDiv`
  - ボタンをクリックされた時に発生するイベントに対応するMsg

## update

`update`はMsgを解釈して、`現在のModel -> 新しいModel` に変換する関数です。

```
update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ChangeInput text ->
            ( { model | inputText = text }, Cmd.none )

        ChangeDiv ->
            ( { model | divText = model.inputText }, Cmd.none )
```

### Msgの解釈
複数の値を持つカスタムタイプであるMsgを解釈するのに、パターンマッチで`case`を使っています。
`case`を使う場合は、全ての値について分岐を書く必要があります。

※何かの場合・次の何かの場合・それ以外、のそれ以外を表す時に`_`を使うという手段はあります。
            
### 新しいModelの生成
Elmではデータの更新はできません。代わりに新しいデータを作ることになります。

レコードの一部のプロパティを変更した新しいレコードを生成するには以下のようにします。
指定しなかったプロパティの値は元のレコードの値のままになります。

```
{ レコード | プロパティ1 = <新しい値>, プロパティ2 = <新しい値> ..... }
```

## view
2つのイベントを仕掛けています。

- ボタンをクリックされた時に発生するイベント
- テキストボックスに入力された時に発生するイベント

### ボタンをクリックされた時に発生するイベント 
このイベントは[onClick](https://package.elm-lang.org/packages/elm/html/latest/Html-Events#onClick)関数で表現します。

イベントは属性に設定します。

```
button [ onClick ChangeDiv ] [ text "クリック" ]
```

```
-- onClickの型注釈
onClick : msg -> Attribute msg
```

`onClick`関数は`msg`を引数に受け取るので、`Msg`の`ChangeDiv`を渡しています。
これによりボタンがクリックされると、`ChangeDiv`が`update`関数に渡されます。

### テキストボックスに文字入力された時に発生するイベント
このイベントは[onInput](https://package.elm-lang.org/packages/elm/html/latest/Html-Events#onInput)関数で実現します。

```
input [ onInput ChangeInput ] []
```

```
-- onInputの型注釈
onInput : (String -> msg) -> Attribute msg
```

`onInput`関数は、`String -> msg`という関数を引数に受け取ります。  
入力された値を使って`任意の型msg`を返す関数です。  
`Msg`の`ChangeInput String`コンストラクタもこの関数に該当するので、`ChangeInput`を渡しています。

これにより何か文字を入力する度に、`ChangeInput`が`update`関数に渡されます。

イベントに対する関数の詳細は以下にあります。

- https://package.elm-lang.org/packages/elm/html/latest/Html-Events


## モジュール

ここまで試してもらった.elmファイルの先頭には以下のような記述していました。

```
module Event exposing (Model, Msg, init, main, update, view)

import Browser
import Html exposing (Html, button, div, input, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (attribute)
import Html.Events exposing (onClick, onInput)
```

### `module`
`module`でこのファイルのモジュール名を宣言し、`exposing ()`のカッコ内で他のモジュールに公開する型と関数を宣言します。

### `import`

`import`は逆に公開されたモジュールを使う時に使います。  
`import`で使用するモジュールを宣言し、`exposing ()`のカッコ内で使用する型と関数を書きます。
