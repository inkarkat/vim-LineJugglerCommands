" LineJugglerCommands/Register.vim: Command to replace with register contents.
"
" DEPENDENCIES:
"   - ingo/err.vim autoload script
"
" Copyright: (C) 2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.20.001	13-Jun-2014	file creation

function! LineJugglerCommands#Register#Replace( startLnum, endLnum, register )
    let l:isEntireBuffer = (a:startLnum <= 1 && a:endLnum == line('$'))
    let l:isPutBelow = (! l:isEntireBuffer && a:endLnum == line('$'))
    try
	silent execute printf('%s,%sdelete %s', a:startLnum, a:endLnum, '_')

	let l:beforeLineNum = line('$')
	    silent execute 'put' . (l:isPutBelow ? '' : '!') . escape(a:register, '"|')
	let l:afterLineNum = line('$')
	let l:sourceLineNum = l:afterLineNum - l:beforeLineNum

	if l:isEntireBuffer
	    silent $delete _
	endif

	let l:targetLineNum = a:endLnum - a:startLnum + 1
	if l:sourceLineNum > &report || l:targetLineNum > &report
	    echomsg printf('Replaced %d line%s', l:targetLineNum, (l:targetLineNum == 1 ? '' : 's')) .
	\	(l:sourceLineNum != l:targetLineNum ?
	\	    printf(' with %s line%s', l:sourceLineNum, (l:sourceLineNum == 1 ? '' : 's')) :
	\	    ''
	\	)
	endif

	return 1
    catch /^Vim\%((\a\+)\)\=:/
	call ingo#err#SetVimException()
	return 0
    endtry
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
