" Test replacing folded line with multiple lines.
" Tests that the cursor stays in the last line and moves to column 4.

let @" = "\"\" multiple\n   lines\n   have been\n   added.\n"
6normal! znwzN
Replace

call Quit()
