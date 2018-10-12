module EventSample exposing (Model, Msg, init, main, update, view)

import Browser
import Html exposing (Html, button, div, input, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (attribute)
import Html.Events exposing (onClick, onInput)



-- MODEL


type alias Model =
    { inputText : String
    , divText : String
    }


init : () -> ( Model, Cmd msg )
init _ =
    ( Model "" "", Cmd.none )



-- MSG


type Msg
    = ChangeInput String
    | ChangeDiv



-- UPDATE


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ChangeInput text ->
            ( { model | inputText = text }, Cmd.none )

        ChangeDiv ->
            ( { model | divText = model.inputText }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ input [ onInput ChangeInput ] []
            , button [ onClick ChangeDiv ] [ text "クリック" ]
            ]
        , div [] [ text model.divText ]
        ]



-- MAIN


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
