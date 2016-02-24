" Test exchanging folded line with same amount of lines up.
" Tests that the cursor moves to the end of the original folded lines and moves to column 1.

execute '14normal! znwzN'
Swap 11,13

call Quit()
