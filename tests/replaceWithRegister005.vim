" Test replacing current line with special register.

file temporary-filename
12normal! w
ReplaceWithRegister %

call Quit()
