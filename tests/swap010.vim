" Test exchanging overlapping lines.
" Tests that nothing happens.
" Tests that an error is raised.

call vimtest#StartTap()
call vimtap#Plan(1)

call vimtap#err#Errors('Overlap in the ranges to swap', '9,11Swap 7,9', 'error shown')

call Quit()
