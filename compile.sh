ocamlopt -c stringlib.ml
ocamlopt -c pathlib.ml
ocamlopt -c level.ml
ocamlopt -o level stringlib.cmx pathlib.cmx level.cmx
