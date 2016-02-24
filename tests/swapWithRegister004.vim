" Test exchanging current line with linewise named register.
" Tests that the default register isn't clobbered.

let @" = 'default'
let @a = "\"a my sweet\n   dear\n"
12normal! w
Swap a

call vimtest#StartTap()
call vimtap#Plan(2)
call vimtap#Is(@", 'default', 'default register unchanged')
call vimtap#Is(@a, "12 lines lines lines\n", 'named register contains exchanged line')

call Quit()
