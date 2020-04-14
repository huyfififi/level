open Array
open List
open String
open Sys

open Pathlib


let rec print_str_list l =
    match l with
    [] -> ()
    | h::t -> 
    print_string h;
    print_newline ();
    print_str_list t
;;

let readdir_abs s_dir =
    let ex_cwd = Sys.getcwd() in
    let new_cwd = ex_cwd ^ "/" ^ (Pathlib.abs2name s_dir) in
    Sys.chdir new_cwd;
    let file_names = Sys.readdir s_dir in
    let abs_files = Array.map (fun s -> new_cwd ^ "/" ^ s) file_names in
    Sys.chdir ex_cwd;
    Array.to_list abs_files

let rec rec_readdir_inner dir_list =
    match dir_list with
    [] -> []
    | h::t -> 
        print_string h;
        print_newline ();
        if Sys.is_directory h then rec_readdir_inner (readdir_abs h) @ rec_readdir_inner t else h :: rec_readdir_inner t
;;

let rec_readdir s_dir = 
    rec_readdir_inner (readdir_abs s_dir)
;;

let () =
    let dir_contents = rec_readdir "." in
    print_str_list (dir_contents)
;;
