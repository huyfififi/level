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

let rec rec_readdir_inner dir_list =
    match dir_list with
    [] -> []
    | h::t -> 
        print_string h;
        print_newline ();
        if Sys.is_directory h then rec_readdir_inner (Pathlib.readdir h) @ rec_readdir_inner t else h :: rec_readdir_inner t
;;

let rec_readdir s_dir = 
    rec_readdir_inner (Pathlib.readdir s_dir)
;;

let () =
    let dir_contents = rec_readdir "." in
    print_str_list (dir_contents)
;;
