module TableSample exposing (Model, Msg, TableRecord, init, main, update, view)

import Browser
import Html exposing (Html, button, div, input, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (attribute)
import Html.Events exposing (onClick, onInput)



-- MODEL


type alias TableRecord =
    { id : Int
    , name : String
    , age : Int
    }


type alias Model =
    { records : List TableRecord
    }


init : () -> ( Model, Cmd msg )
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
    ( model, Cmd.none )



-- MSG


type Msg
    = NoOp



-- UPDATE


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )



-- VIEW


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



-- MAIN


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
