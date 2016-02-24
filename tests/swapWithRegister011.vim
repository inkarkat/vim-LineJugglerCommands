" Test using an invalid range.
" Tests that nothing happens.
" Tests that an error is raised.

call vimtest#StartTap()
call vimtap#Plan(1)

call vimtap#err#ErrorsLike('^E16: ', '11,9999Swap', 'error shown')

call Quit()
