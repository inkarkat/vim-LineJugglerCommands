" Test exchanging current line with special register.

file temporary-filename
12normal! w
call vimtest#StartTap()
call vimtap#Plan(1)
call vimtap#err#Errors('Cannot swap with readonly register', 'Swap %', 'error with read-only register %')

call Quit()
