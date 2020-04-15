ocamlopt -c stringlib.ml
ocamlopt -c pathlib.ml
ocamlopt -c flatten.ml
ocamlopt -o flatten stringlib.cmx pathlib.cmx flatten.cmx
