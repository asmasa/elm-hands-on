# Step2. 型を使う

ここではModelに色んな値を持たせてみましょう。

## 試してみる
`step2/Types.elm`ファイルを開いて、Modelを変えてみましょう！

### Model
`Model`の定義を下記に変えてください。

```
type alias Model =
    { id : Int
    , name : String
    }
```

### init
次に`Model`の初期化を行う`init`関数を変更します。  
`init`関数を下記に変えてください。

```
init : () -> (Model, Cmd msg)
init _ =
    (Model 1 "user", Cmd.none)
```

定義し直した`Model`に合うように変更しました。

### view
`view`関数でも定義し直した`Model`を使ってみます。  
`view`関数を下記に変えてください。

```
view : Model -> Html Msg
view model =
    let
        value =
            String.fromInt model.id ++ "," ++ model.name
    in
    text value
```

ファイルを保存してから、ブラウザから`http://localhost:8000/step2/Types.elm`にアクセスします。

再度ソースを変更したあとに画面表示を確かめたいときには、画面をリロードして下さい。

## レコードについて
ここではModelをレコードにしています。  
レコードはプロパティを持つ型で、任意のプロパティを追加できます。  
`type alias 型名`で記述することで、新しい型を定義できます。

```
type alias Model =
    { id : Int
    , name : String
    }
```

つまり、上記は以下となります。

- 以下のプロパティを持つレコードを定義
  - `Int`型の`id`
  - `String`型の`name`
- このレコードを`Model`と定義

なお`type alias`は型の別名になります。例えば`String`型に`Name`という別名の型をつける例は以下となります。

```
type alias Name =
    String
```

## `let`について
`let`はその後に記述する`in`で使う値や関数を予め定義するときに使います。  
これによってソースの見通しを良くしたい時に使うことが多いです。  

```
view model =
    let
        value =
            String.fromInt model.id ++ "," ++ model.name
    in
    text value
```

ここでは`text`関数に渡す値を`value`に入れています。この中で以下を使っています。

- Int -> String変換のために`String.fromInt`関数
- 文字列を連結する`++`関数
- __大事なことですが、変数への再代入はできません。つまり`value`に違う値を入れることはできません。__
