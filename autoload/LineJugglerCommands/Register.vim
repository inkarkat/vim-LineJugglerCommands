" LineJugglerCommands/Register.vim: Command to replace with register contents.
"
" DEPENDENCIES:
"   - ingo/err.vim autoload script
"   - ingo/range.vim autoload script
"
" Copyright: (C) 2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.20.002	15-Jun-2014	Parameterize
"				LineJugglerCommands#Register#Replace() as
"				s:ReplaceOrSwap() with a:isSwap argument to
"				enable :Swap with [x] register, too.
"   1.20.001	13-Jun-2014	file creation

function! s:ReplaceOrSwap( startLnum, endLnum, register, isSwap )
    let l:register = substitute(a:register, '^"', '', '')
    let l:isEntireBuffer = (a:startLnum <= 1 && a:endLnum == line('$'))
    let l:isPutBelow = (! l:isEntireBuffer && a:endLnum == line('$'))
    try
	if a:isSwap
	    if l:register =~# '^[:.%#~]$\|^='
		call ingo#err#Set('Cannot swap with readonly register')
		return 0
	    endif
	    let l:lines = ingo#range#Get(printf('%s,%s', a:startLnum, a:endLnum))
	endif

	silent execute printf('%s,%sdelete %s', a:startLnum, a:endLnum, '_')

	let l:beforeLineNum = line('$')
	    silent execute 'put' . (l:isPutBelow ? '' : '!') . escape(l:register, '"|')
	let l:afterLineNum = line('$')
	let l:sourceLineNum = l:afterLineNum - l:beforeLineNum

	if l:isEntireBuffer
	    silent $delete _
	endif

	if a:isSwap
	    call setreg(l:register, l:lines, 'V')
	endif

	let l:targetLineNum = a:endLnum - a:startLnum + 1
	if l:sourceLineNum > &report || l:targetLineNum > &report
	    echomsg printf('%s %d line%s',
	    \   (a:isSwap ? 'Swapped' : 'Replaced'),
	    \   l:targetLineNum, (l:targetLineNum == 1 ? '' : 's')) .
	    \   (l:sourceLineNum != l:targetLineNum ?
	    \       printf(' with %s line%s', l:sourceLineNum, (l:sourceLineNum == 1 ? '' : 's')) :
	    \       ''
	    \   )
	endif

	return 1
    catch /^Vim\%((\a\+)\)\=:/
	call ingo#err#SetVimException()
	return 0
    endtry
endfunction

function! LineJugglerCommands#Register#Replace( startLnum, endLnum, register )
    return s:ReplaceOrSwap(a:startLnum, a:endLnum, a:register, 0)
endfunction
function! LineJugglerCommands#Register#Swap( startLnum, endLnum, register )
    return s:ReplaceOrSwap(a:startLnum, a:endLnum, a:register, 1)
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
