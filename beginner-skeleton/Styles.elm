module Styles
    exposing
        ( Classes(..)
        , css
        , class
        , id
        , classList
        , snippets
        )

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (Namespace, withNamespace)


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


css : String
css =
    snippets
        |> namespace currentNamespace.name
        |> stylesheet
        |> (\x -> [ x ])
        |> compile
        |> .css
