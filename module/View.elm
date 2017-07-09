module View exposing (view)

{-|

@docs view

-}

import Html exposing (..)
import Html.A11y exposing (..)
import Html.Attributes
import Model exposing (Model)
import Styles exposing (..)
import Update exposing (Msg(..))


{-| -}
view : Model -> Html Msg
view model =
    div
        [ class [ Container ] ]
        [ text "Hello, world!"
        ]
