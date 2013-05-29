" Test exchanging overlapping lines.
" Tests that nothing happens.
" Tests that an error is raised.

call vimtest#StartTap()
call vimtap#Plan(1)

try
    9,11Swap 7,9
    call vimtap#Fail()
catch
    call vimtap#err#Thrown('Overlap in the ranges to swap', 'error shown')
endtry

call Quit()
