" LineJugglerCommands.vim: Commands to duplicate and move around lines.
"
" DEPENDENCIES:
"   - LineJuggler.vim autoload script
"   - ingo/err.vim autoload script
"
" Copyright: (C) 2013 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.001	08-Mar-2013	file creation
let s:save_cpo = &cpo
set cpo&vim

function! s:ExpandRange() range
    let [s:startLnum, s:endLnum] = [a:firstline, a:lastline]
endfunction
function! LineJugglerCommands#Swap( startLnum, endLnum, targetRange )
    try
	let l:save_view = winsaveview()
	    " To translate the passed {range} into a pair of line numbers, we
	    " pass them to a dummy range-function. Unfortunately, this jumps to
	    " the first line, so we have to restore the window view.
	    execute 'keepjumps' a:targetRange . 'call s:ExpandRange()'
	call winrestview(l:save_view)

	call LineJuggler#SwapRanges(
	\   LineJuggler#FoldClosed(a:startLnum), LineJuggler#FoldClosedEnd(a:endLnum),
	\   LineJuggler#FoldClosed(s:startLnum), LineJuggler#FoldClosedEnd(s:endLnum)
	\)

	return 1
    catch /^Vim\%((\a\+)\)\=:E492/ " E492: Not an editor command.
	" When the passed range isn't valid.
	call ingo#err#Set('Invalid range: ' . a:targetRange)
    catch /^Vim\%((\a\+)\)\=:E/
	" When the passed range isn't correct, e.g. "E78: Unknown mark".
	call ingo#err#SetVimException()
    catch /^LineJuggler:/
	" When the ranges overlap.
	call ingo#err#SetCustomException('LineJuggler')
    endtry
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
