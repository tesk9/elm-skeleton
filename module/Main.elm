module Main
    exposing
        ( Flags
        , init
        , decoder
        , Model
        , Msg
        , view
        , styles
        )

{-|
@docs Flags, init

@docs Model, model

@docs Msg, update

@docs view

@docs styles
-}

import Html exposing (Html)
import Json.Decode
import Flags as Flags
import Init as Init
import Model as Model
import Update as Update
import View as View
import Styles as Styles


{-|
-}
type alias Flags =
    Flags.Flags


{-|
-}
decoder : Json.Decode.Decoder Flags.Flags
decoder =
    Flags.decoder


{-|
-}
init : Flags -> Model
init =
    Init.init


{-|
-}
type alias Model =
    Model.Model


{-|
-}
type alias Msg =
    Update.Msg


{-|
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update =
    Update.update


{-|
-}
view : Model -> Html Msg
view =
    View.view


{-|
-}
styles : String
styles =
    Styles.styles
