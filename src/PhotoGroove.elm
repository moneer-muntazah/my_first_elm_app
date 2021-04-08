module PhotoGroove exposing (main)

import Browser
import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


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
        , onClick { description = "ClickedPhoto", data = thumb.url }
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


update msg model =
    if msg.description == "ClickedPhoto" then
        { model | selected = msg.data }

    else
        model


main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
