" Test replacing current line with expression.

12ReplaceWithRegister ='== this is' . repeat(' great', 3)

" Tests that special characters " and | are properly escaped.
10ReplaceWithRegister ='\"= ' . printf('%s is %d', '\|he\man\|', 746 * 42)


call Quit()
