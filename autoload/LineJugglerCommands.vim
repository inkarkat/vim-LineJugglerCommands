" LineJugglerCommands.vim: Commands to duplicate and move around lines.
"
" DEPENDENCIES:
"   - LineJuggler.vim autoload script
"   - ingo/err.vim autoload script
"   - ingo/range.vim autoload script
"
" Copyright: (C) 2013-2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.21.003	08-Aug-2014	Move LineJuggler#FoldClosed() and
"				LineJuggler#FoldClosedEnd() into ingo-library as
"				ingo#range#NetStart() and ingo#range#NetEnd().
"   1.10.002	11-Jun-2014	Factor out s:RangeToLineNumbers() and turn the
"				LineJugglerCommands#Swap() into a generic
"				s:Invoke() that takes a Funcref.
"				Implement :Replace via
"				LineJugglerCommands#Replace().
"   1.00.001	08-Mar-2013	file creation
let s:save_cpo = &cpo
set cpo&vim

function! s:ExpandRange() range
    let [s:startLnum, s:endLnum] = [a:firstline, a:lastline]
endfunction
function! s:RangeToLineNumbers( range )
    let l:save_view = winsaveview()
	" To translate the passed {range} into a pair of line numbers, we
	" pass them to a dummy range-function. Unfortunately, this jumps to
	" the first line, so we have to restore the window view.
	execute 'keepjumps' a:range . 'call s:ExpandRange()'
    call winrestview(l:save_view)
    " Note: No finally clause necesary here; when the range is invalid, the
    " cursor position won't be changed.
endfunction
function! s:Invoke( LineJuggerRangeFunction, isRangeTarget, startLnum, endLnum, range, ... )
    try
	call s:RangeToLineNumbers(a:range)

	let l:passedStartEnd = [ingo#range#NetStart(a:startLnum), ingo#range#NetEnd(a:endLnum)]
	let l:rangeStartEnd  = [ingo#range#NetStart(s:startLnum), ingo#range#NetEnd(s:endLnum)]
	call call(a:LineJuggerRangeFunction,
	\   (a:isRangeTarget ?
	\       l:passedStartEnd + l:rangeStartEnd :
	\       l:rangeStartEnd + l:passedStartEnd
	\   ) + a:000
	\)

	return 1
    catch /^Vim\%((\a\+)\)\=:E492/ " E492: Not an editor command.
	" When the passed range isn't valid.
	call ingo#err#Set('Invalid range: ' . a:range)
    catch /^Vim\%((\a\+)\)\=:/
	" When the passed range isn't correct, e.g. "E78: Unknown mark".
	call ingo#err#SetVimException()
    catch /^LineJuggler:/
	" When the ranges overlap.
	call ingo#err#SetCustomException('LineJuggler')
    endtry
    return 0
endfunction
function! LineJugglerCommands#Swap( startLnum, endLnum, range )
    return s:Invoke(function('LineJuggler#SwapRanges'), 1, a:startLnum, a:endLnum, a:range)
endfunction
function! LineJugglerCommands#Replace( startLnum, endLnum, range )
    return s:Invoke(function('LineJuggler#ReplaceRanges'), 0, a:startLnum, a:endLnum, a:range, '_')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
