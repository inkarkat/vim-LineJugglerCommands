" Test exchanging current line with characterwise default register.
" Tests that the cursor stays in the line and moves to column 1.

let @" = '"" foobar'
12normal! w
Swap

call vimtest#StartTap()
call vimtap#Plan(1)
call vimtap#Is(@", "12 lines lines lines\n", 'exchanged line')

call Quit()
