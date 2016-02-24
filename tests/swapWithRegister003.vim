" Test exchanging from within a folded line with blockwise register.
" Tests that the cursor stays in the last line and moves to column 4.

call setreg('', "\"\" a \nquick\nred  \n  fox", "\<C-v>5")
15normal! znwzN
Swap

call vimtest#StartTap()
call vimtap#Plan(1)
call vimtap#Is(@", "14     THREE-LINE block C start\n15     THREE-LINE block C middle\n16     THREE-LINE block C end\n", 'exchanged line')

call Quit()
