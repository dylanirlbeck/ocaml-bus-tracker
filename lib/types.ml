(* /gettime *)
type gettime = { tm : string; error : string option [@yojson.option] }
[@@deriving yojson]

type gettime_response = { bustime_response : gettime [@key "bustime-response"] }
[@@deriving yojson]
