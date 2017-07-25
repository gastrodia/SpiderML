(* let average a b =
  (a +. b) /. 2.0;;
Js.log (average 7.0 23.0) *)

let port = 3000
let hostname = "127.0.0.1"
let create_server http =
  let server = http##createServer begin fun [@bs] req resp ->
      resp##statusCode #= 200;
      resp##setHeader "Content-Type" "text/plain";
      resp##_end "Hello world\n"
    end
  in
  server##listen port hostname begin fun [@bs] () ->
    Js.log ("Server running at http://"^ hostname ^ ":" ^ Pervasives.string_of_int port ^ "/")
  end

let () = create_server Http_types.http