module Main exposing (main)

import Model exposing (Model, model)
import Update exposing (update)
import View exposing (view)


main : Program Never Model Update.Msg
main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }
