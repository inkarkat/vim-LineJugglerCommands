" Test replacing current line with characterwise default register.
" Tests that the cursor stays in the line and moves to column 1.

let @" = '"" foobar'
12normal! w
Replace

call Quit()
