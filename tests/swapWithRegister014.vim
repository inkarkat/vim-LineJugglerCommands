" Test exchanging with named register vs. absolute line number.
" Tests that the named register 0 can be directly used.

9normal yy
let @2 = "\"2 the register\n"

$Swap 0
call vimtest#StartTap()
call vimtap#Plan(3)
call vimtap#Is(@2, "\"2 the register\n", 'swap of last line clobbers register 0')

12Swap 2
call vimtap#Is(@2, "\"2 the register\n", 'register contents kept with absolute line swap')

10Swap "2
call vimtap#Is(@2, "10 to fill the buffer\n", 'exchanged middle line')

call Quit()
