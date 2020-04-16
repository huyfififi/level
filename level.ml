open Array
open List
open String
open Sys

open Pathlib
open Stringlib

let rec level cwd path =
    match cwd with
    "" -> Stringlib.replace path "/" "_"
    |_ -> 
        let len_cwd = String.length cwd in
        let len_path = String.length path in
        let cwd_0 = String.sub cwd 0 1 in
        cwd_0 ^ level (String.sub cwd 1 (len_cwd - 1)) (String.sub path 1 (len_path - 1))
;;

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
        if Sys.is_directory h then rec_readdir_inner (Pathlib.readdir h) @ rec_readdir_inner t else h :: rec_readdir_inner t
;;

let rec_readdir s_dir = 
    rec_readdir_inner (Pathlib.readdir s_dir)
;;

let () =
    let dir_contents = rec_readdir "." in
    let abs_contents = Pathlib.comp2abs dir_contents in
    let cwd = Sys.getcwd() ^ "/" in
    print_str_list (abs_contents);
    print_str_list (List.map (level cwd) abs_contents)
;;
