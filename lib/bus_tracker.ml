open Cohttp_lwt_unix
open Lwt.Infix

module URI = struct
  let api = "https://www.ctabustracker.com/bustime/api/v2"
  let gettime = Uri.of_string (Printf.sprintf "%s/gettime" api)
  let getpredictions = Uri.of_string (Printf.sprintf "%s/getpredictions" api)
end

module Gettime = struct
  let run key =
    let uri =
      Uri.with_query URI.gettime [ ("key", [ key ]); ("format", [ "json" ]) ]
    in
    (*TODO Add better error handling with response.*)
    Client.get uri >>= fun (_resp, body) ->
    body |> Cohttp_lwt.Body.to_string >|= Yojson.Safe.from_string
    >|= Types.gettime_response_of_yojson
    >|= fun gettime_response -> gettime_response.bustime_response
end

module Getpredictions = struct
  (* TODO Enforce singularity of stpid or vid *)
  let run key (stpid : int) (rt : string) =
    let uri =
      Uri.with_query URI.getpredictions
        [
          ("key", [ key ]);
          ("format", [ "json" ]);
          ("stpid", [ string_of_int stpid ]);
          ("rt", [ rt ]);
        ]
    in
    Client.get uri >>= fun (_resp, body) ->
    body |> Cohttp_lwt.Body.to_string >|= Yojson.Safe.from_string
    >|= Types.getpredictions_response_of_yojson
    >|= fun getpredictions_response -> getpredictions_response.bustime_response
end
