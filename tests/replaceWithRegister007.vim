" Test replacing range with linewise default register.
" Tests that the cursor stays in the last line and moves to column 1.
" Tests that replacing works at the beginning and end of the buffer.

let @" = "my house is big\nmy garden is green\nmy car is empty\n"

29,30ReplaceWithRegister
12,15ReplaceWithRegister
1,2ReplaceWithRegister

call Quit()
