" Test exchanging current line with one down.
" Tests that the cursor moves with the line and moves to column 1.
" Tests that one can jump back to the original position.

execute '12normal! w'
Swap +1

call Quit()
