all:
	ocamlfind ocamlc -package batteries -linkpkg -o hex_to_base64 hex_to_base64.ml

clean:
	rm *.cmi *.cmo
	rm hex_to_base64
