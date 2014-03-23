" Test passing invalid range.
" Tests that nothing happens.
" Tests that an error is raised.

call vimtest#StartTap()
call vimtap#Plan(1)

try
    9,11Swap not/a/range
    call vimtap#Fail('expected error')
catch
    call vimtap#err#Thrown('Invalid range: not/a/range', 'error shown')
endtry

call Quit()
