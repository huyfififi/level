open String


let abs2name abs_path =
    let split_list = String.split_on_char '/' abs_path in
    let name = List.nth split_list ((List.length split_list) - 1) in
    print_string name;
    print_newline ();
    name
;;
