" Test replacing with alternative named register syntax.

let @a = "\"a my sweet\n   dear\n"
let @b = "\"b hello"
12normal! w
Replace "a

1Replace "b

call Quit()
