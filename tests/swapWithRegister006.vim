" Test exchanging current line with expression.

call vimtest#StartTap()
call vimtap#Plan(1)
call vimtap#err#Errors('Cannot swap with readonly register', "Swap ='== this is' . repeat(' great', 3)", 'error with read-only register =')

call Quit()
