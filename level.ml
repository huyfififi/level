open Array
open List
open String
open Sys

open Pathutil
open Stringutil


let rec move_files old_paths new_paths =
    (* Assert that len of old_paths and new_paths equal*)
    match old_paths, new_paths with
    | [], [] -> ()
    | [], _::_ -> ()
    | _::_, [] -> ()
    | h1::t1, h2::t2 ->
        Sys.rename h1 h2;
        move_files t1 t2
;;

let rec level cwd path =
    match cwd with
    "" -> Stringutil.replace path "/" "_"
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
        if Sys.is_directory h then rec_readdir_inner (Pathutil.readdir h) @ rec_readdir_inner t else h :: rec_readdir_inner t
;;

let rec_readdir s_dir = 
    rec_readdir_inner (Pathutil.readdir s_dir)
;;

(* Sys.remove cannot remove directory *)
let rec delete_dir dir_list =
    match dir_list with
    [] -> 0
    | h::t ->
        let ex_code = Sys.command ("rm -r " ^ h) in
        ex_code + delete_dir t
;;

let rec rec_finddir_inner dir_list =
    match dir_list with
    [] -> []
    | h::t ->
        if Sys.is_directory h then h :: rec_finddir_inner t else rec_finddir_inner t
;;

let rec_finddir s_dir =
    rec_finddir_inner (Pathutil.readdir s_dir)
;;

let () =
    let dir_contents = rec_readdir "." in
    let old_paths = Pathutil.comp2abs dir_contents in
    let cwd = Sys.getcwd() ^ "/" in
    let new_paths = List.map (level cwd) old_paths in
    move_files old_paths new_paths;
    let dir_list = rec_finddir "." in
    print_int (delete_dir dir_list)
;;
