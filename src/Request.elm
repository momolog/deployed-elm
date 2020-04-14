module Request exposing (..)

import Http
import Json.Decode as D

type RestMsg = GotItems (Result Http.Error (List String))

fetchItems : Cmd RestMsg
fetchItems =
  Http.post
    { url = "https://example.com/items.json"
    , body = Http.emptyBody
    , expect = Http.expectJson GotItems (D.list (D.field "name" D.string))
    }
