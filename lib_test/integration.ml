open Bus_tracker

let time = Lwt_main.run (Gettime.run Config.key)
let _ = Printf.printf "/gettime | current system time: %s\n" time.tm

let prediction_time =
  let getpredictions = Lwt_main.run (Getpredictions.run Config.key 1521 "6") in
  getpredictions.prd |> List.hd |> fun prediction -> prediction.prdctdn

let _ =
  Printf.printf "/getpredictions | first prediction time: %s\n" prediction_time
