open String


let explode s = 
    List.init (String.length s) (String.get s)
;;

let rec replace str old_sub new_sub =
    let len_old_sub = String.length old_sub in
    let len_str = String.length str in
    if len_str < len_old_sub then str
    else
        let sub_str = String.sub str 0 len_old_sub in
        if String.equal sub_str old_sub then
            let rest_str = String.sub str len_old_sub (len_str - len_old_sub) in
            new_sub ^ replace rest_str old_sub new_sub
        else
            let rest_str = String.sub str 1 (len_str - 1) in
            (String.sub str 0 1) ^ replace rest_str old_sub new_sub
;;
