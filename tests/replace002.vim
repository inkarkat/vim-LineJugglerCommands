" Test replacing current line with one down.
" Tests that the cursor stays in the line and moves to column 1.

execute '12normal! w'
Replace +1

call Quit()
