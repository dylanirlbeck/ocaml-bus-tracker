open Cohttp_lwt_unix
open Lwt.Infix

module URI = struct
  let api = "https://www.ctabustracker.com/bustime/api/v2"
  let gettime = Uri.of_string (Printf.sprintf "%s/gettime" api)
end

module Gettime = struct
  let run key =
    let uri =
      Uri.with_query URI.gettime [ ("key", [ key ]); ("format", [ "json" ]) ]
    in
    Client.get uri >>= fun (_resp, body) ->
    body |> Cohttp_lwt.Body.to_string >|= Yojson.Safe.from_string
    >|= Types.response_of_yojson
end
