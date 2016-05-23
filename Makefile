all:
	ocamlfind ocamlc -package batteries -linkpkg -o challenge1 challenge1.ml
	ocamlfind ocamlc -package batteries -linkpkg -o challenge2 challenge1.cmo challenge2.ml
	ocamlfind ocamlc -package batteries -linkpkg -o challenge3 challenge1.cmo challenge2.cmo challenge3.ml
	ocamlfind ocamlc -package batteries -linkpkg -o challenge4 challenge1.cmo challenge2.cmo challenge3.cmo challenge4.ml

test:
	@echo "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
	@./challenge1 49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d
	@echo "746865206b696420646f6e277420706c6179"
	@./challenge2 1c0111001f010100061a024b53535009181c 686974207468652062756c6c277320657965
	@echo "Cooking MC's like a pound of bacon"
	@./challenge3
	@echo "Now that the party is jumping"
	@./challenge4

clean:
	rm -f *.cmi *.cmo
	rm -f challenge1
	rm -f challenge2
	rm -f challenge3
	rm -f challenge4
