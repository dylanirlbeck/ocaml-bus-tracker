# Bus Tracker: An OCaml client library for the CTA's API

## Development notes

Register for a Bus Tracker API key by following the instructions at
[https://www.transitchicago.com/developers/bustracker/](https://www.transitchicago.com/developers/bustracker/).

### Testing

Run integration tests with `dune exec lib_test/integration.exe` (Unix). NOTE:
You need to have `lib_test/config.ml.in` defined as follows for `Config.key` to
hold the correct API key:

```ocaml
let key = "<INSERT_YOUR_API_KEY>"
```

### Resources

- [yojson](https://github.com/ocaml-community/yojson)
- [ppx_yojson_conv](https://github.com/janestreet/ppx_yojson_conv)
