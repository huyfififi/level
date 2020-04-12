open Array
open List
open Sys

let rec print_str_list l =
    match l with
    [] -> ()
    | h::t -> 
    print_string h;
    print_newline ();
    print_str_list t
;;

let readdir_abs s_dir = 
    let file_names = Array.to_list (Sys.readdir s_dir) in
    let cwd = Sys.getcwd () in
    List.map (fun s -> cwd ^ s) file_names
;;

let () =
    let dir_contents = readdir_abs "." in
    print_str_list dir_contents
;;
