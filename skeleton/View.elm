module View exposing (view)

import Html exposing (..)
import Html.CssHelpers
import Model exposing (Model)
import Styles exposing (..)
import Update


view : Model -> Html b
view model =
    div
        [ class [ Container ] ]
        [ Html.CssHelpers.style css
        , text "Hello, world!"
        ]
