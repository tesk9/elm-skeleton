module Main
    exposing
        ( Flags
        , Model
        , Msg
        , decoder
        , init
        , styles
        , update
        , view
        )

{-|

@docs Flags, init

@docs Model, model

@docs Msg, update

@docs view

@docs styles

-}

import Flags as Flags
import Html exposing (Html)
import Init as Init
import Json.Decode
import Model as Model
import Styles as Styles
import Update as Update
import View as View


{-| -}
type alias Flags =
    Flags.Flags


{-| -}
decoder : Json.Decode.Decoder Flags.Flags
decoder =
    Flags.decoder


{-| -}
init : Flags -> Model
init =
    Init.init


{-| -}
type alias Model =
    Model.Model


{-| -}
type alias Msg =
    Update.Msg


{-| -}
update : Msg -> Model -> ( Model, Cmd Msg )
update =
    Update.update


{-| -}
view : Model -> Html Msg
view =
    View.view


{-| -}
styles : String
styles =
    Styles.styles
