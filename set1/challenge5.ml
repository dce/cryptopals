open Batteries

let plaintext = "Burning 'em, if you ain't quick and nimble
I go crazy when I hear a cymbal"

let rec encrypt (cs : char list) (key : char BatDllist.t) : int list =
  match cs with
  | [] -> []
  | c :: tail -> (Char.code c) lxor (Char.code (Dllist.get key)) :: encrypt tail (Dllist.next key)

let main () =
  let chars = String.to_list plaintext in
  let key = Dllist.of_list [ 'I'; 'C'; 'E' ] in
  print_endline (Challenge2.hex_string_of_ints (encrypt chars key))

let () = if Sys.argv.(0) = "./challenge5" then main () else ()
