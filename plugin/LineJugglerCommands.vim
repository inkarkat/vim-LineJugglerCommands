" LineJugglerCommands.vim: Commands to duplicate and move around lines.
"
" DEPENDENCIES:
"   - LineJugglerCommands.vim autoload script
"
" Copyright: (C) 2013-2014 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.10.002	11-Jun-2014	Add :Replace command.
"   1.00.001	08-Mar-2013	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_LineJugglerCommands') || (v:version < 700)
    finish
endif
let g:loaded_LineJugglerCommands = 1

command! -bar -range -nargs=1 Swap    call setline(<line1>, getline(<line1>)) | if ! LineJugglerCommands#Swap(<line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif
command! -bar -range -nargs=1 Replace call setline(<line1>, getline(<line1>)) | if ! LineJugglerCommands#Replace(<line1>, <line2>, <q-args>) | echoerr ingo#err#Get() | endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
