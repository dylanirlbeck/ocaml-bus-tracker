(* /gettime *)
type gettime = { tm : string; error : string option [@yojson.option] }
[@@deriving yojson]

type gettime_response = { bustime_response : gettime [@key "bustime-response"] }
[@@deriving yojson]

(* /getpredictions *)
type prediction = {
  tmstmp : string;
  typ : string; (* TODO Should be an enum. *)
  stpnm : string;
  stpid : string;
  vid : string;
  dstp : int;
  rt : string;
  rtdd : string; (* TODO This field is undocumented *)
  rtdir : string;
  des : string;
  prdtm : string;
  tablockid : string;
  tatripid : string;
  origtatripno : string; (* TODO This field is undocumented *)
  dly : bool;
  prdctdn : string;
  zone : string;
}
[@@deriving yojson]

type getpredictions = {
  prd : prediction list;
  error : string option; [@yojson.option]
}
[@@deriving yojson]

type getpredictions_response = {
  bustime_response : getpredictions; [@key "bustime-response"]
}
[@@deriving yojson]
