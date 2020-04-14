ocamlopt -c pathlib.ml
ocamlopt -c flatten.ml
ocamlopt -o flatten pathlib.cmx flatten.cmx
