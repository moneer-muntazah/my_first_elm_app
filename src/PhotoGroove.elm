module PhotoGroove exposing (main)

import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (..)


type alias Photo =
    { url : String }


type alias Model =
    { photos : List Photo, selected : String }


urlPrefix : String
urlPrefix =
    ""


view : Model -> Html msg
view model =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ] (List.map (viewThumbnail model.selected) model.photos)
        ]


viewThumbnail : String -> Photo -> Html msg
viewThumbnail selected thumb =
    img
        [ src (urlPrefix ++ thumb.url)
        , width 150
        , height 150
        , classList [ ( "selected", selected == thumb.url ) ]
        ]
        []


initialModel : Model
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

main : Html msg
main =
    view initialModel
