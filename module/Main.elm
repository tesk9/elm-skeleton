module Main
    exposing
        ( Flags
        , Model
        , Msg
        , decoder
        , init
        , update
        , view
        )

{-|

@docs Flags, init

@docs Model, model

@docs Msg, update

@docs view

-}

import Accessibility exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)


-- FLAGS


type alias Flags =
    {}


decoder : Decoder Flags
decoder =
    decode Flags



-- INIT


init : Flags -> Model
init flags =
    {}



-- MODEL


type alias Model =
    {}



-- VIEW


view : Model -> Html Msg
view model =
    div
        []
        [ text "Hello, world!"
        ]



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []
