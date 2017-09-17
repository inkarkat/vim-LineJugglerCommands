" Test passing invalid counts.

call vimtest#StartTap()
call vimtap#Plan(1)

call vimtap#err#Errors('Not a count: /NotACount/', '7BlankLine /NotACount/', 'error shown')

call Quit()
