module Styles
    exposing
        ( Classes(..)
        , styles
        , class
        , id
        , classList
        )

{-|
@docs Classes, styles, class, id, classList
-}

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (Namespace, withNamespace)


{-|
-}
type Classes
    = Container


snippets : List Snippet
snippets =
    [ Css.class Container
        []
    ]


{ class, classList, id } =
    currentNamespace


currentNamespace : Html.CssHelpers.Namespace String a b c
currentNamespace =
    withNamespace "{{NAMESPACE}}-"


{-| The produced stylesheet.
-}
styles : String
styles =
    snippets
        |> namespace currentNamespace.name
        |> stylesheet
        |> (\x -> [ x ])
        |> compile
        |> .css
