" Test exchanging folded line with different number of folded lines.
" Tests that the cursor moves to the end of the original folded lines and moves to column 1.

execute '6normal! znwzN'
Swap 14

call Quit()
