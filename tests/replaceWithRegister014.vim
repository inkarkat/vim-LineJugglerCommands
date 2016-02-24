" Test replacing with named register vs. absolute line number.
" Tests that the named register 0 can be directly used.

9normal yy
let @2 = "\"2 the register\n"

$Replace 0

12Replace 2

10Replace "2

call Quit()
