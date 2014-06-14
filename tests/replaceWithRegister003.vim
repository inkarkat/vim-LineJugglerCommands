" Test replacing from within a folded line with blockwise register.
" Tests that the cursor stays in the last line and moves to column 4.

call setreg('', "\"\" a \nquick\nred  \n  fox", "\<C-v>5")
15normal! znwzN
ReplaceWithRegister

call Quit()
