module Types exposing (Model, Msg, init, main, update, view)

import Browser
import Html exposing (Html, button, div, input, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (attribute)
import Html.Events exposing (onClick, onInput)



-- MODEL


type alias Model =
    {}


init : () -> ( Model, Cmd msg )
init _ =
    ( {}, Cmd.none )



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
    text "test"



-- MAIN


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
