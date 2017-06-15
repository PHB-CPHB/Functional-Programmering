import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode

--Msg
type Msg
  = GetData (Result Http.Error Int)
  | Get
  | Set

--Model
type alias Model
  = { counter : Int }

--View
view : Model -> Html Msg
view model =
    div []
      [
      button [onClick Get] [text "Get"]
      , div [] [text(toString  model.counter)]
      , button [onClick Set] [text "Set" ]
      ]

--Decoder
decodeRest : Decode.Decoder Int
decodeRest = Decode.at ["data"] Decode.int

--getCounter
getCounter : Cmd Msg
getCounter =
  let
    url = ""
  in
    Http.send GetData (Http.get url decodeRest)

--setCounter
setCounter : Cmd Msg
setCounter =
  let
    url = ""
  in
    Http.send GetData (Http.request
    { method = "PUT"
    , headers = []
    , url = url
    , body = Http.emptyBody
    , expect = Http.expectJson decodeRest
    , timeout = Nothing
    , withCredentials = False
    })

update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case message of
    GetData (Ok value) -> (Model 1, getCounter)
    GetData (Err _) -> (Model 9999, Cmd.none)
    Get -> (model, getCounter)
    Set -> (model, setCounter)

main =
  Html.program
    { init = (Model 0, Cmd.none)
    , view = view
    , update = update
    , subscriptions = \x -> Sub.none }
