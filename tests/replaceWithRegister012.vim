" Test replacing from visual mode.

let @" = "\"\" multiple\n   lines\n   have been\n   added.\n"
execute "normal! 12GVj:Replace\<CR>"

call Quit()
