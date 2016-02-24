" Test passing invalid range.
" Tests that nothing happens.
" Tests that an error is raised.

call vimtest#StartTap()
call vimtap#Plan(1)

call vimtap#err#Errors('Invalid range: not/a/range', '9,11Swap not/a/range', 'error shown')

call Quit()
