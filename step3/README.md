# Step3. ちょっとリッチなViewを作ってみる

ここまではplain textしか表示していませんでしたが、ちょっとリッチなHTMLを作ってみます。  
具体的にはtable要素を作ってみます。  
今回は多いです！

## 試してみる
`step3/Table.elm`ファイルを開いて、table要素を使ってみましょう！

### 新しい型の追加
tableのtr要素に対応させるレコードを用意します。

```
type alias TableRecord =
    { id: Int
    , name : String
    , age : Int
    }
```

### Modelの変更
Modelで`TableRecord`の値を保持させますが、複数扱いたいのでリストを使います。

```
type alias Model =
    { records : List TableRecord
    }
```

### initの変更
初期化で、`List TableRecord`のデータを用意します。

```
init : () -> (Model, Cmd msg)
init _ =
    let
        records =
            [ TableRecord 1 "taro" 30
            , TableRecord 2 "jiro" 25
            , TableRecord 3 "saburo" 20
            ]

        model =
            Model records
    in
    (model, Cmd.none)
```

### viewの変更
定義し直したModelを使ってみます。

```
view : Model -> Html Msg
view model =
    let
        trs =
            List.map toTr model.records
    in
    table [ attribute "border" "1" ]
        [ thead []
            [ tr []
                [ th [] [ text "ID" ]
                , th [] [ text "名前" ]
                , th [] [ text "年齢" ]
                ]
            ]
        , tbody [] trs
        ]


toTr : TableRecord -> Html Msg
toTr r =
    tr []
        [ td [] [ text (String.fromInt r.id) ]
        , td [] [ text r.name ]
        , td [] [ text (String.fromInt r.age) ]
        ]
```

ファイルを保存してから、ブラウザから`http://localhost:8000/step3/Table.elm`にアクセスします。

再度ソースを変更したあとに画面表示を確かめたいときには、画面をリロードして下さい。


## Listについて
- __同じ型の要素__ を複数保持できる
- 他の言語と同じように順番がある

### 生成

以下のように`[]`でListを生成できます。

```
[1 ,2, 3]
["a", "b", "c"]
[]
```

### 型変数

Listの型は`List a`となります。`a`は任意の型を表し、これを`型変数`と呼びます。型変数は小文字で始まります。  
なので、`List TableRecord`とすることで、Listが持つ要素の型を具体的な型である`TableRecord`にしています。

### `List.map`関数
Listの要素の型を変換する関数。

- 第一引数は要素に対する変換関数
- 第二引数はList

```
List.map (\x -> String.fromInt x) [1, 2, 3]

-- 結果
["1","2","3"]
```

他にも`filter`関数や`sort`関数など色んな関数が揃っています。以下を参考にしてください。

- https://package.elm-lang.org/packages/elm/core/latest/List

# HTML要素
今まではplain textしか表示していませんでしが、ここではちゃんとしたHTMLタグを表示しています。  
`h1, div, table, p`など、各タグに該当する関数が用意されています。  
この関数達の定義は基本的には同じです。

```
-- table関数での例で書いたが、div関数・h1関数なども同じ引数・戻り値の型となっている
table : List (Attribute msg) -> List (Html msg) -> Html msg
```

つまり、HTML要素は`Html msg`という型で表されます。  
`msg`も`List a`の`a`と同様に型変数となります。  
今まででてきた`view`関数の戻り値は、`Html Msg`としていましたが、これは`msg`を具体的な型である`Msg`になっています。  

```
view : Model -> Html Msg
```

tableタグを生成するには

```
    table [ attribute "border" "1" ]
        [ thead [][]
        , tbody [][]
        ]
```

- 第一引数に属性のリストを渡す
- 第二引数に中の要素のリストを渡す

となっています。

HTML要素に対する関数の詳細は以下にあります。

- https://package.elm-lang.org/packages/elm/html/latest/Html

ここでは属性について触れませんが、HTML属性に関する詳細は以下にあります。

- https://package.elm-lang.org/packages/elm/html/latest/Html-Attributes
