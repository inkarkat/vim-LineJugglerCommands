" Test replacing current line with linewise named register.
" Tests that the default register isn't clobbered.

let @" = 'default'
let @a = "\"a my sweet\n   dear\n"
12normal! w
ReplaceWithRegister a

call vimtest#StartTap()
call vimtap#Plan(2)
call vimtap#Is(@", 'default', 'default register unchanged')
call vimtap#Is(@a, "\"a my sweet\n   dear\n", 'named register unchanged')

call Quit()
