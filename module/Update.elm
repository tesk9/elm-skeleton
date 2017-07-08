module Update exposing (Msg(..), update)

{-|

@docs Msg, update

-}

import Model


{-| -}
type Msg
    = NoOp


{-| -}
update : Msg -> Model.Model -> ( Model.Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []
