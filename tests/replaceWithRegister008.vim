" Test replacing range with line.
" Tests that replacing works one line next to the beginning and end of the buffer.

let @" = "my house is big\n"

29Replace
2Replace

call Quit()
