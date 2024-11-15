LINE JUGGLER COMMANDS
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

Most of the line manipulation mappings of the LineJuggler.vim plugin can
also be done with built-in Ex commands like :move, :put, etc. This plugin
adds those commands that do not exist (in a simple form) as built-in commands.
Sometimes, a command is just more practical (e.g. in a script), more
repeatable (from the command-line history), or offers different line
addressing.
Namely, this plugin provides a :BlankLine command, a :Swap command to
exchange two ranges of lines (or with a register), and a similar :Replace
command.

### SOURCE

- [Inspiration for this plugin the following Stack Overflow question:](http://stackoverflow.com/questions/15296393/line-swapping-in-vim/15298132)

### SEE ALSO

- This plugin is based on the functionality of the (required) LineJugger.vim
  plugin ([vimscript #4140](http://www.vim.org/scripts/script.php?script_id=4140)), which offers many mappings to quickly duplicate
  and move lines to above / below the current line.
- ReplaceWithRegister.vim ([vimscript #2703](http://www.vim.org/scripts/script.php?script_id=2703)) provides normal and visual mode
  gr commands that are similar to the :Replace Ex command.

USAGE
------------------------------------------------------------------------------

    :[range]BlankLine [N]   Add [N] blank line(s) below the current line / last
                            line in [range].

    :[range]Swap {range}    Exchange the current line / line(s) given by [range]
                            with the lines in {range}.
    :[range]Swap [["]x]     Exchange the current line / line(s) given by [range]
                            with the text from register [x]. This always works
                            linewise, like a combination of :delete [x] and
                            :put.

    :[range]Replace {range} Replace the current line / line(s) given by [range]
                            with the lines in {range}.
    :[range]Replace [["]x]
                            Replace the current line / line(s) given by [range]
                            with the text from register [x]. This always works
                            linewise, like a combination of :delete and
                            :put.

                            Note: To use one of the numbered registers 1-9, you
                            need to prepend the optional double quotes ("1 - "9),
                            in order to disambiguate them from the absolute lines
                            1 - 9.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-LineJugglerCommands
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim LineJugglerCommands*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the ingo-library.vim plugin ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)), version 1.033 or
  higher.
- Requires the LineJuggler.vim plugin ([vimscript #4140](http://www.vim.org/scripts/script.php?script_id=4140)), version 2.11 or
  higher.

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-LineJugglerCommands/issues or email (address
below).

HISTORY
------------------------------------------------------------------------------

##### 1.22    10-Nov-2024
- Adapt: :BlankLine needs to check &lt;count&gt; == -1 instead of &lt;line2&gt; to
  support current line as well as a lnum of 0 (since Vim 8.1.1241).

##### 1.21    04-Nov-2018
- Add :BlankLine command.
- Move LineJuggler#FoldClosed() and LineJuggler#FoldClosedEnd() into
  ingo-library as ingo#range#NetStart() and ingo#range#NetEnd().

__You need to update to ingo-library ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)) version 1.033!__

__You need to update to LineJuggler.vim ([vimscript #4140](http://www.vim.org/scripts/script.php?script_id=4140)) version 1.21!__

##### 1.20    19-Jun-2014
- ENH: Also allow to pass a [x] register to the :Replace command, and replace
  the range with its contents.
- ENH: Also allow to pass a [x] register to the :Swap command, and put the
  range into the register and vice versa.

##### 1.10    11-Jun-2014
- Add :Replace command.

__You need to update to LineJuggler.vim ([vimscript #4140](http://www.vim.org/scripts/script.php?script_id=4140)) version 2.10!__

##### 1.00    08-Mar-2013
- First published version.

------------------------------------------------------------------------------
Copyright: (C) 2013-2024 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
