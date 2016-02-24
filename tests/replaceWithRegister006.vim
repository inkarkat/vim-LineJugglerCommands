" Test replacing current line with expression.

12Replace ='== this is' . repeat(' great', 3)

" Tests that special characters " and | are properly escaped.
10Replace ='"= ' . printf('%s is %d', '|he\man|', 746 * 42)

call Quit()
