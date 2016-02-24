" Test replacing from within a folded line.
" Tests that the lines before and after that are included in the fold are
" replaced, too.

execute '15normal! znwzN'
Replace 18

call Quit()
