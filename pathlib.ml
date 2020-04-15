open String
open Sys

open Stringlib


let abs2name abs_path =
    let split_list = String.split_on_char '/' abs_path in
    let name = List.nth split_list ((List.length split_list) - 1) in
    print_string name;
    print_newline ();
    name
;;

(* Sys.readdir cannot read complex paths *)
let readdir s_dir =
    let ex_cwd = Sys.getcwd() in
    Sys.chdir s_dir;
    let file_names = Sys.readdir "." in
    let comp_files = Array.map (fun s -> s_dir ^ "/" ^ s) file_names in 
    Sys.chdir ex_cwd;
    Array.to_list comp_files
;;

let rec comp2abs comp_list =
    match comp_list with
    [] -> []
    | h::t -> 
        let abs_paths = Stringlib.replace (Sys.getcwd () ^ h) "./" "/" in
        abs_paths :: comp2abs t
;;
