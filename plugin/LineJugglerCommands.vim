" LineJugglerCommands.vim: Commands to duplicate and move around lines.
"
" DEPENDENCIES:
"   - Requires Vim 7.0 or higher.
"
" Copyright: (C) 2013-2020 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_LineJugglerCommands') || (v:version < 700)
    finish
endif
let g:loaded_LineJugglerCommands = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:IsRegisterArgument( arguments )
    return (a:arguments =~# '^$\|^[-a-zA-Z0":.%#*+~/]$\|^"[-a-zA-Z0-9":.%#*+~/]$\|^=')
endfunction

command! -bar -range=-1 -nargs=? BlankLine
\   call setline(<line1>, getline(<line1>)) |
\   if <q-args> !~# '^\d*$' |
\       echoerr 'Not a count: ' . <q-args> |
\   else |
\       call LineJuggler#InsertBlankLine((<count> == -1 ? <line1> : <line2>), str2nr(<q-args>), 1) |
\   endif

command! -range -nargs=? Swap
\   call setline(<line1>, getline(<line1>)) |
\   if s:IsRegisterArgument(<q-args>) |
\	if ! LineJugglerCommands#Register#Swap(<line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif |
\   else |
\	if ! LineJugglerCommands#Swap(<line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif |
\   endif
command! -range -nargs=? Replace
\   call setline(<line1>, getline(<line1>)) |
\   if s:IsRegisterArgument(<q-args>) |
\	if ! LineJugglerCommands#Register#Replace(<line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif |
\   else |
\	if ! LineJugglerCommands#Replace(<line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif |
\   endif
" Note: Don't use -register because that doesn't handle special ones like % and =.

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
