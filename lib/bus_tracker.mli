(**
   This library offers bindings to the CTA's read-only developer API.

   Each module corresponds 1:1 with a single API endpoint and has a consistent
   interface. The [run] method in each module will, given a valid API key,
   return a typed response (types defined in types.ml) suitable for use in
   application code.
*)

module Gettime : sig
  val run : string -> Types.gettime_response
end