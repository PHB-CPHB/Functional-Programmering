import Html exposing (Html, Attribute, input, button, div, text)
import Html.Attributes exposing(..)
import Html.Events exposing (onInput, onClick)
import String

main =
  Html.beginnerProgram { model = model , view = view, update = update }


-- MODEL
type alias Model =
  { content : String,
    text : String
  }

model : Model
model =
  { content = "",
    text = ""}

-- UPDATE

type Msg
  = Change String
  | AddText

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }

    AddText ->
      { model | text = model.content}

--VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ onInput Change ] []
    , button [ onClick AddText ] [text "Add Text"]
    , div [] [ text ("Hello " ++ model.text)]
    ]
