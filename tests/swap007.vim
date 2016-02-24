" Test exchanging from within a folded line.
" Tests that the lines before and after that are included in the fold are moved,
" too.

execute '15normal! znwzN'
Swap 18

call Quit()
