import Html exposing (Html, Attribute, input, button, div, text)
import Html.Events exposing (onInput, onClick)


main =
  Html.beginnerProgram
  {
  model = model,
  view = view,
  update = update
  }


-- MODEL
type alias Model =
  {
    count : Int
  }

model : Model
model =
  Model 3

-- UPDATE

type Msg
  = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model | count = model.count + 1  }

    Decrement ->
      if model.count < 1 then Model 0 else Model (model.count - 1)


--VIEW

view : Model -> Html Msg
view model =
  div []
  [
    button [ onClick Decrement  ] [ text "-" ]
    , div [] [ text (toString model.count) ]
    , button [ onClick Increment ] [ text "+" ]
    , div [] [makeLine model.count 1]
  ]

makeLine : Int -> Int -> Html Msg
makeLine n s =
  if n <= 0 then
    text("")
  else if s >= n then
    div [] [text("This is line " ++ toString(s))]
  else
    div [] [text("This is line " ++ toString(s)), makeLine n (s + 1)]
