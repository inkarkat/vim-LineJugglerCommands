" Test replacing current line with 5 down.
" Tests that the cursor stays in the line and moves to column 1.

execute '12normal! w'
Replace 17

call Quit()
