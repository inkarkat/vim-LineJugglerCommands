" Test replacing current line with 3 up.
" Tests that the cursor stays in the line and moves to column 1.

execute '12normal! w'
Replace 9

call Quit()
