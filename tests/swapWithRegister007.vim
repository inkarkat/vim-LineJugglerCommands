" Test exchanging range with linewise default register.
" Tests that the cursor stays in the last line and moves to column 1.
" Tests that exchanging works at the beginning and end of the buffer.

let @" = "my house is big\nmy garden is green\nmy car is empty\n"
call vimtest#StartTap()
call vimtap#Plan(3)

29,30Swap
call vimtap#Is(@", "29 --  --  --\n30 last line\n", 'exchanged last two lines')
12,15Swap
call vimtap#Is(@", "12 lines lines lines\n13 to experiment\n14     THREE-LINE block C start\n15     THREE-LINE block C middle\n16     THREE-LINE block C end\n", 'exchanged lines from the middle')
1,2Swap
call vimtap#Is(@", "01 first line\n02 ---\n", 'exchanged first two lines')

call Quit()
