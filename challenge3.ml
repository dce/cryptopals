open Batteries

let ciphertext = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

let rec make_key (i : int) (len : int) : int list =
  match len with
  | 0 -> []
  | n -> i :: make_key i (len - 1)

let decrypt_with (str : string) (i : int) : char list =
  let ns = Challenge1.ints_of_hex_string str in
  let key = make_key i (List.length ns) in
  let plaintext = Challenge2.fixed_xor ns key in
  List.map Char.chr plaintext

let rec count_spaces (cs : char list) : int =
  match cs with
  | []          -> 0
  | ' ' :: rest -> 1 + count_spaces rest
  | _   :: rest -> count_spaces rest

let rec max_spaces (css : char list list) : char list =
  match css with
  | [] -> []
  | cs :: rest -> let max = max_spaces rest in
                  if count_spaces cs > count_spaces max then cs else max

let main () =
  let keys = List.range 0 `To 255 in
  let candidates = List.map (decrypt_with ciphertext) keys in
  print_endline (String.of_list (max_spaces candidates))

let () = if Sys.argv.(0) = "./challenge3" then main () else ()
