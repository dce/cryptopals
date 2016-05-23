open Batteries

let rec pairs (chars : char list) : (char * char) list =
  match chars with
  | [] -> []
  | [_] -> failwith "Error in pairs"
  | c1 :: c2 :: cs -> (c1, c2) :: pairs cs

let int_of_hex_pair ((c1, c2) : (char * char)) : int =
  int_of_string (Printf.sprintf "0x%c%c" c1 c2)

let hex_to_base64 (hex : string) : string =
  let hex_pairs = pairs (String.to_list hex) in
  let ints = List.map int_of_hex_pair hex_pairs in
  let chars = List.map Char.chr ints in
  let str = String.of_list chars in
  Base64.str_encode str;;

print_string (hex_to_base64 (Array.get Sys.argv 1))
