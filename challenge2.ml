open Batteries

let fixed_xor (ns1 : int list) (ns2 : int list) : int list =
  let pairs = List.combine ns1 ns2 in
  List.map (fun (n1, n2) -> n1 lxor n2) pairs

let hex_string_of_ints (ns : int list) : string =
  String.concat "" (List.map (Printf.sprintf "%02x") ns)

let main () =
  let ns1 = Challenge1.ints_of_hex_string (Array.get Sys.argv 1) in
  let ns2 = Challenge1.ints_of_hex_string (Array.get Sys.argv 2) in
  print_string (hex_string_of_ints (fixed_xor ns1 ns2))

let () = if Sys.argv.(0) = "./challenge2" then main () else ()
