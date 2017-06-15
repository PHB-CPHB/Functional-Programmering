module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

--
-- Exercise 1b
-- This exercise is about reusing components with functions instead of objects.
-- Look at the view method. A lot of the code is duplicated there. Can you think
-- of a smarter way to write that?
-- Hint: write a helper-function.
--

-- Model
type alias Model =
  { status : Status }

type Status =
    Single
  | Complicated
  | Relationship
  | Married
  | Other

-- UPDATE
type Msg = SetStatus Status

update : Msg -> Model -> ( Model, Cmd Msg )
update (SetStatus status) model = (Model status, Cmd.none)

view : Model -> Html Msg
view model =
  fieldset []
    [ labelData "Single" (SetStatus Single)
    , labelData "It's complicated..." (SetStatus Complicated)
    , labelData "In a relationship" (SetStatus Relationship)
    , labelData "Married" (SetStatus Married)
    , labelData "Keep out of my private life!" (SetStatus Other)
    ]

labelData : String -> Msg -> Html Msg
labelData labeltext click =
  label [] [ input [ type_ "radio", name "status-radio", onClick click ] [] , text labeltext ]

main =
  Html.program
    { init = (Model Single, Cmd.none)
    , view = view
    , update = update
    , subscriptions = \m -> Sub.none
    }
