all:
	ocamlfind ocamlc -package batteries -linkpkg -o challenge1 challenge1.ml

clean:
	rm *.cmi *.cmo
	rm challenge1
