" Test exchanging current line with 5 down.
" Tests that the cursor moves with the line and moves to column 1.
" Tests that one can jump back to the original position.

execute '12normal! w'
Swap 17

call Quit()
