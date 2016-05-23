open Batteries

let rec pairs (chars : char list) : (char * char) list =
  match chars with
  | [] -> []
  | [_] -> failwith "Error in pairs"
  | c1 :: c2 :: cs -> (c1, c2) :: pairs cs

let int_of_hex_pair ((c1, c2) : (char * char)) : int =
  int_of_string (Printf.sprintf "0x%c%c" c1 c2)

let ints_of_hex_string (hex : string) : int list =
  let hex_pairs = pairs (String.to_list hex) in
  List.map int_of_hex_pair hex_pairs

let hex_to_base64 (hex : string) : string =
  let ints = ints_of_hex_string hex in
  let chars = List.map Char.chr ints in
  let str = String.of_list chars in
  Base64.str_encode str;;

let main () =
  print_string (hex_to_base64 (Array.get Sys.argv 1))

let () = if Sys.argv.(0) = "./challenge1" then main () else ()
