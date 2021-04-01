module PhotoGroove exposing (main)

import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)

view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            [ img [ src "https://elm-in-action/1.jpeg" ] [] 
            , img [ src "https://elm-in-action/2.jpeg" ] []
            , img [ src "https://elm-in-action/3.jpeg" ] []
            ]
        ]

main = 
    view "no model yet"