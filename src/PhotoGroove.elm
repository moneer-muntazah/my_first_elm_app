module PhotoGroove exposing (main)

import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)


urlPrefix =
    ""

view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            (List.map
                (viewThumbnail model.selected)
                model.photos
            )
        ]


viewThumbnail selected thumb =
    img
        [ src (urlPrefix ++ thumb.url)
        , width 150
        , height 150
        , classList [ ( "selected", selected == thumb.url ) ]
        ]
        []


initialModel =
    { photos =
        [ { url = "1.jpg" }
        , { url = "2.jpg" }
        , { url = "3.jpg" }
        ]
    , selected = "1.jpg"
    }


main =
    view initialModel
