" Test exchanging folded line with multiple lines.
" Tests that the cursor stays in the last line and moves to column 4.

let @" = "\"\" multiple\n   lines\n   have been\n   added.\n"
6normal! znwzN
Swap

call vimtest#StartTap()
call vimtap#Plan(1)
call vimtap#Is(@", "06     TWO-LINE block B start\n07     TWO-LINE block B end\n", 'exchanged folded lines')

call Quit()
