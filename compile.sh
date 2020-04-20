ocamlopt -c stringutil.ml
ocamlopt -c pathutil.ml
ocamlopt -c level.ml
ocamlopt -o level stringutil.cmx pathutil.cmx level.cmx
