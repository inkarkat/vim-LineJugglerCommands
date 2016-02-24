" Test exchanging with alternative named register syntax.

let @a = "\"a my sweet\n   dear\n"
let @b = "\"b hello"
12normal! w
Swap "a
1Swap "b

call vimtest#StartTap()
call vimtap#Plan(2)
call vimtap#Is(@a, "12 lines lines lines\n", 'exchanged line')
call vimtap#Is(@b, "01 first line\n", 'exchanged line')

call Quit()
