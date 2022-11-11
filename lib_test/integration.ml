open Bus_tracker

let time = Lwt_main.run (Gettime.run Config.key)
let _ = Printf.printf "current system time: %s\n" time.tm
