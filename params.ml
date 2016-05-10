let debug = ref false

let (~~) f x y = f y x


(****************************************************************)
(* MODES *)

type generate_token_flag = 
  | TokenTrue
  | TokenFalse

type generate_mode = 
  | Mode_pseudo of generate_token_flag
  | Mode_unlogged of generate_token_flag
  | Mode_logged
  | Mode_cmi

let current_mode = ref (Mode_unlogged TokenFalse)

let set_current_mode s =
  current_mode := match s with
    | "cmi" -> Mode_cmi
    | "log" -> Mode_logged
    | "unlog" -> Mode_unlogged TokenFalse
    | "token" -> Mode_unlogged TokenTrue
    | "pseudo" -> Mode_pseudo TokenFalse
    | "ptoken" -> Mode_pseudo TokenTrue
    | _ -> failwith "Invalid mode, chose log, unlog, or token"

let is_mode_pseudo () = 
  (match !current_mode with Mode_pseudo _ -> true | _ -> false)

let generate_qualified_names = ref false
