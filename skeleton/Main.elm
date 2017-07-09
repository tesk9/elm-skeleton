module Main exposing (main)

{-|

@docs main

-}

import Flags exposing (decoder)
import Html
import Init exposing (init)
import Json.Decode exposing (Value, decodeString)
import Model exposing (Model)
import Update exposing (update)
import View exposing (view)


{-| -}
main : Program String Model Update.Msg
main =
    Html.programWithFlags
        { init = start
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


start : String -> ( Model, Cmd Msg )
start pageData =
    case decodeString decoder pageData of
        Ok flags ->
            init flags ! []

        Err err ->
            Debug.crash err


subscriptions : a -> Sub b
subscriptions =
    always Sub.none
