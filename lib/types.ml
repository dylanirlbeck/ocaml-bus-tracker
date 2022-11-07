type gettime_response = { tm : string; error : string option [@yojson.option] }
[@@deriving yojson]

type response = {
  bustime_response : gettime_response; [@key "bustime-response"]
}
[@@deriving yojson]
