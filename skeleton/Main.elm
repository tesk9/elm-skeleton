module Main exposing (main)

import Accessibility exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)


{-| -}
main : Program Value Model Msg
main =
    programWithFlags
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- FLAGS


type alias Flags =
    {}


decoder : Decoder Flags
decoder =
    decode Flags



-- INIT


init : Value -> ( Model, Cmd Msg )
init pageData =
    case decodeValue decoder pageData of
        Ok flags ->
            ( Ok {}, Cmd.none )

        Err err ->
            ( Err err, Cmd.none )



-- MODEL


type alias Model =
    Result String {}



-- VIEW


view : Model -> Html Msg
view modelResult =
    case modelResult of
        Err err ->
            text err

        Ok model ->
            div
                []
                [ text "Hello, world!"
                ]



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg modelResult =
    case modelResult of
        Err err ->
            Err err ! []

        Ok model ->
            case msg of
                NoOp ->
                    Ok model ! []



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none
